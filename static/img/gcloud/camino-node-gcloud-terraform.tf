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


locals {
  camino_data_path = "/home/camino-data"
  camino_args = [
    "--network-id=${var.network}",
    "--public-ip-resolution-service=ifconfigme"
  ]
  vm_tags      = ["camino-node-p2p"]
  docker_image = "c4tplatform/camino-node:latest"
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

}

provider "google-beta" {

  project = var.gcp_project_id

}

module "gce-container" {
  source  = "terraform-google-modules/container-vm/google"
  version = "~> 2.0"

  container = {
    image = "${local.docker_image}"
    command = [
      "/camino-node/build/camino-node"
    ]
    args = local.camino_args

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



resource "google_compute_instance_template" "default" {
  name        = var.template_name
  project     = var.gcp_project_id
  description = "This template is used to create camino node instances."

  tags = local.vm_tags

  labels = {
    network = "${var.network}"
    camino  = ""
  }

  metadata = {
    gce-container-declaration = module.gce-container.metadata_value
    startup-script            = "#! /bin/bash\n     mkdir -p /home/camino-data\n  docker pull google/cloud-sdk:434.0.0\n   export CONTNAME=$(docker ps -q  --filter ancestor=c4tplatform/camino-node:latest)\n     docker container stop $CONTNAME || true\n         mkdir -p /home/camino-data/db\n     docker run -v /home/camino-data/db:/opt/db --name gcloud-config google/cloud-sdk:434.0.0 gsutil -m rsync -d -R  gs://${var.network}-db /opt/db\n     docker rm -f gcloud-config\n     docker container start $CONTNAME || true"
    google-logging-enabled    = "true"
    google-monitoring-enabled = "true"
  }


  instance_description = "description assigned to instances"
  machine_type         = "e2-standard-4"
  can_ip_forward       = false


  disk {
    source_image = module.gce-container.source_image
    auto_delete  = true
    boot         = true
    mode         = "READ_WRITE"
    disk_type    = "pd-balanced"
    disk_size_gb = 500
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

resource "google_compute_instance_from_template" "default" {

  name = var.vm_name
  zone = var.vm_zone

  source_instance_template = google_compute_instance_template.default.id

  network_interface {
    network = google_compute_network.default.name
    access_config {
    }
  }

}

resource "google_compute_firewall" "default" {
  name    = "allow-camino-staking-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["9651"]
  }

  target_tags = ["camino-node-p2p"]
}

resource "google_compute_network" "default" {
  name = "camino-vpc-network"
}

resource "google_service_account" "default" {
  account_id   = "camino-service-account-id"
  display_name = "Camino Service Account"
  project      = var.gcp_project_id
}

