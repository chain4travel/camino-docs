variable "aws_region" {
  type        = string
  default     = "eu-north-1"
  description = "region of the instance"
}

variable "allowed_ip_range" {
  type        = string
  default     = ""
  description = "IP range to be allowed for ssh and 9650 ports connection"
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

variable "key_pair_name" {
  type        = string
  description = "Name of the key pair associated with the instance"
  default     = "camino-key-pair"

}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
// we use ubuntu image
data "aws_ami" "default" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]

}

resource "aws_instance" "default" {
  ami           = data.aws_ami.default.id
  instance_type = "m6g.xlarge"

  tags = {
    Name = var.vm_name
  }

  vpc_security_group_ids = [aws_security_group.default.id]
  key_name               = var.key_pair_name

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    throughput            = 200
    volume_size           = 500  // size in GB, you can change it as needed
    volume_type           = "gp3"
  }

  ebs_optimized = true
// startup script to download db and start camino-node docker container
  user_data = <<EOF
#!/bin/bash


apt-get update
apt-get install -y ca-certificates curl gnupg

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

apt-get install -y apt-transport-https ca-certificates gnupg curl sudo

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

apt-get update && apt-get install -y google-cloud-cli

mkdir -p /home/camino-data/db
## for columbus use gs://columbus-db
gsutil -m rsync -d -R  gs://${var.network}-db /home/camino-data/db

docker run -d -v /home/camino-data:/root/.caminogo -p 9650:9650 -p 9651:9651 --restart always c4tplatform/camino-node:latest ./camino-node --network-id=${var.network} --http-host=0.0.0.0 --public-ip-resolution-service=ifconfigme

EOF
}

// allow egress traffic
resource "aws_security_group" "default" {
  name        = "allow_camino_staking"
  description = "Allow camino inbound traffic"


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_camino_staking"
  }
}

// allow ssh connection to certain ip range
resource "aws_security_group_rule" "ssh_sg_rule" {
  count             = var.allowed_ip_range == "" ? 0 : 1
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.allowed_ip_range]
  security_group_id = aws_security_group.default.id
}

// allow 9650 port to certain ip range
resource "aws_security_group_rule" "api_sg_rule" {
  count             = var.allowed_ip_range == "" ? 0 : 1
  type              = "ingress"
  from_port         = 9650
  to_port           = 9650
  protocol          = "tcp"
  cidr_blocks       = [var.allowed_ip_range]
  security_group_id = aws_security_group.default.id
}

// allow traffic through staking port 9651
resource "aws_security_group_rule" "staking_sg_rule" {
  type              = "ingress"
  from_port         = 9651
  to_port           = 9651
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}


