variable "template_name" {
  type        = string
  default     = "camino-node-template"
  description = "name of the vm instance template"
}

variable "network" {
  type        = string
  default     = "columbus"
  description = "camino-node network id"
}

variable "vm_name" {
  type        = string
  description = "Name of VM instance"
  default     = "camino-node"

}

variable "vm_zone" {
  type        = string
  description = "zone of VM instance"
  default     = "europe-west1-b"
}

variable "gcp_project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "allowed_ip_range" {
  type        = string
  default     = ""
  description = "IP range to be allowed for ssh and 9650 ports connection. eg: 1.1.1.1/32"
}

// setting local variables you can optionally change them but no need.
locals {
  camino_data_path = "/home/camino-data"
  vm_tags          = ["camino-node-p2p"]
  docker_image     = "c4tplatform/camino-node:latest"
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.20.0"
    }
  }
}

provider "google" {

  project = var.gcp_project_id
  zone    = var.vm_zone

}

provider "google-beta" {

  project = var.gcp_project_id
  zone    = var.vm_zone

}

// container module to set container options
module "gce-container" {
  source  = "terraform-google-modules/container-vm/google"
  version = "~> 2.0"

  container = {
    image = "${local.docker_image}"
    command = [
      "./camino-node"
    ]
    args = [
      "--network-id=${var.network}",
      "--public-ip=${google_compute_address.default.address}"
    ]

    # Declare volumes to be mounted.
    # This is similar to how docker volumes are declared.
    volumeMounts = [
      {
        mountPath = "/root/.caminogo"
        name      = "node-data"
        readOnly  = false
      }
    ]
  }

  # Declare the Volumes which will be used for mounting.
  volumes = [
    {
      name = "node-data",
      hostPath = {
        path = local.camino_data_path
      }
    }
  ]

  restart_policy = "Always"
}


// create the template for vm
resource "google_compute_instance_template" "default" {
  name        = var.template_name
  project     = var.gcp_project_id
  description = "This template is used to create camino node instances."

  tags = local.vm_tags

  labels = {
    network = "${var.network}"
    camino  = ""
  }

  // setting startup script and logging. You can set logging and monitoring to false if you want
  metadata = {
    gce-container-declaration = module.gce-container.metadata_value
    startup-script            = <<EOF
#! /bin/bash
mkdir -p /home/camino-data
docker pull google/cloud-sdk:434.0.0
export CONTNAME=$(docker ps -q  --filter ancestor=${local.docker_image})
docker container stop $CONTNAME || true
mkdir -p /home/camino-data/db
docker run -v /home/camino-data/db:/opt/db --name gcloud-config google/cloud-sdk:434.0.0 gsutil -m rsync -d -R  gs://${var.network}-db /opt/db
docker rm -f gcloud-config
docker container start $CONTNAME || true
EOF

    google-logging-enabled    = "true"
    google-monitoring-enabled = "true"
  }


  instance_description = "description assigned to instances"
  machine_type         = "e2-standard-4" // 4vCPUs & 16 GB RAM
  can_ip_forward       = false


  disk {
    source_image = module.gce-container.source_image
    auto_delete  = true
    boot         = true
    mode         = "READ_WRITE"
    disk_type    = "pd-balanced"
    disk_size_gb = 500 // size in GB. you can change that as needed
  }


  network_interface {
    network = google_compute_network.default.name
    access_config {

    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email = google_service_account.default.email
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/pubsub",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"]
  }



}

// creates instance from the template
resource "google_compute_instance_from_template" "default" {

  name = var.vm_name
  zone = var.vm_zone

  source_instance_template = google_compute_instance_template.default.id

  network_interface {
    network = google_compute_network.default.name
    // setting the static ip of the machine
    access_config {
      nat_ip = google_compute_address.default.address
    }
  }

}

// creates firewall to allow traffic for port 9651
resource "google_compute_firewall" "default" {
  name    = "allow-camino-staking-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["9651"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["camino-node-p2p"]
}

// creates firewall to allow traffic for ports 9650 & 22 to certain IP range
resource "google_compute_firewall" "ssh_api_fw" {
  count   = var.allowed_ip_range == "" ? 0 : 1
  name    = "allow-camino-api-ssh-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["9650", "22"]
  }

  source_ranges = [var.allowed_ip_range]
  target_tags   = ["camino-node-p2p"]
}

// creates a new vpc network
resource "google_compute_network" "default" {
  name = "camino-vpc-network"
}


// creates a new service account (Optional, you can remove it and edit the service account email in service_account option under google_compute_instance_template)
resource "google_service_account" "default" {
  account_id   = "camino-service-account-id"
  display_name = "Camino Service Account"
  project      = var.gcp_project_id
}

// create a new static public ip
resource "google_compute_address" "default" {
  name = "camino-node-test-ip"
}
