---
sidebar_position: 11
title: Run Camino Node with AWS
description: This guide provides step-by-step instructions on how to set up and run Camino Node on the AWS.
---

# Setting Up Camino Node on AWS

In this guide, we will walk you through the process of setting up Camino Node on the Amazon Web Services (AWS) platform.
You have three methods to choose from for the setup process: the manual method, AWS Marketplace method, and the automatic method using Terraform.

- [**Manual Method**](#manual-method): If you prefer a more hands-on approach and want to understand the detailed steps, the manual method is for you.

- [**AWS Marketplace Method**](#aws-marketplace-method): This method leverages the AWS Marketplace to deploy the Camino Node. It provides a streamlined, user-friendly interface, minimizing the intricacies of manual setup. Ideal for those who seek an efficient and straightforward deployment without delving deep into the underlying technical details.

- [**Terraform Method**](#terraform-method): For those who favor an automated approach and want to streamline the setup process, Terraform is the way to go. This method allows you to deploy Camino Node quickly with minimal effort, making it an attractive option for users familiar with Terraform's infrastructure-as-code paradigm.

Whether you're new to blockchain technology or an experienced AWS user, this guide is designed to be accessible
and easy to follow. It provides step-by-step instructions to help you get Camino Node up and running smoothly on AWS.

Let's get started with the setup process of Camino Node on AWS. Choose the method that best suits your preferences and needs.

## Manual Method

### Go to EC2 section in AWS

1. Go to **Services > Compute > EC2** to access the EC2 section in AWS. This is where you'll create and manage your virtual machine instances.

<figure>
<img class="zoom" src="/img/aws/aws_instance_0.png#center"/>
<figcaption align = "center"><b>Fig.1:</b> Go to EC2 Section</figcaption>
</figure>

### Create Key Pair: Secure Access to Your Machine

Creating a Key Pair is an essential step that will grant you secure access to your newly created machine. With the Key Pair,
you'll be able to log in to the machine securely via SSH (Secure Shell) and manage it effectively.

During the Key Pair creation process, you will generate a public and private key pair. The private key will be used to
authenticate yourself when connecting to the machine, while the public key will be associated with the machine and enable secure access.

Keep your private key safe and do not share it with others. With this Key Pair, you'll have the necessary credentials to access
your machine securely and carry out the required configurations.

Let's proceed with creating the Key Pair to ensure secure access to your Camino Node machine.

1. Go to **"Network & Security" > "Key Pairs"**.

<figure>
<img class="zoom" src="/img/aws/aws_keypair_1.png#center"/>
<figcaption align = "center"><b>Fig.2:</b> Click on "Key Pairs"</figcaption>
</figure>

2. Click on **"Create Key Pair"**.

<figure>
<img class="zoom" src="/img/aws/aws_keypair_2.png#center"/>
<figcaption align = "center"><b>Fig.3:</b> Click "Create Key Pair"</figcaption>
</figure>

3. Write a name for the key, e.g., "camino-key-pair".
4. Choose RSA as the key pair type.
5. Select .pem if you use Linux or .ppk if you use Windows to download the key pair.
6. Click on **"Create Key Pair"** and save the downloaded file. This key pair will be used to connect to the machine via SSH.

<figure>
<img class="zoom" src="/img/aws/aws_keypair_3.png#center"/>
<figcaption align = "center"><b>Fig.4:</b> Click "Create Key Pair" when finished</figcaption>
</figure>

### Create Security Group: Configuring Access Permissions

In this step, we'll create a Security Group, which acts as a virtual firewall to control inbound and outbound traffic to your
Camino Node machine. By defining the access permissions within the Security Group, we can ensure that the necessary ports for
Camino Node (staking port, HTTP port) and SSH connection are allowed while maintaining security.

The Security Group settings determine which IP addresses and ports are permitted to access the machine. We'll configure the
Security Group to allow SSH access for secure remote connections and enable communication through the required TCP ports for
Camino Node.

By setting up the Security Group with the appropriate rules, we can ensure that your Camino Node machine is both accessible
and protected from unauthorized access.

Let's proceed with creating the Security Group and configuring the access permissions to run Camino Node securely.

1. Go to **"Network & Security" >> "Security Groups"**.

<figure>
<img class="zoom" src="/img/aws/aws_sg_1.png#center"/>
<figcaption align = "center"><b>Fig.5:</b> Click "Security Groups"</figcaption>
</figure>

2. Click on **"Create Security Group"**.

3. Write a name for the security group, e.g., "camino-security-group".

4. Write a description, e.g., "Allow inbound traffic for SSH port and Camino TCP ports".

<figure>
<img class="zoom" src="/img/aws/aws_sg_2.png#center"/>
<figcaption align = "center"><b>Fig.6:</b> Fill in the details</figcaption>
</figure>

5. Under **"Inbound rules,"** click on **"Add rule"** and add 3 rules with the following settings:

   - **Rule 1**:
     - **Type**: SSH
     - **Port**: 22
     - **Source**: Custom Source
     - **IP Range**: Your IP Range (to allow SSH access from your IP Range)
     - **Description**: SSH port
   - **Rule 2**:
     - **Type**: Custom TCP
     - **Port**: 9650
     - **Source**: Custom Source
     - **IP Range**: Your IP Range (to allow HTTP port access from your IP Range)
     - **Description**: HTTP port
   - **Rule 3**:
     - **Type**: Custom TCP
     - **Port**: 9651
     - **Source**: Anywhere-IPv4
     - **IP Range**: 0.0.0.0/0 (to allow staking port access from any IP)
     - **Description**: Staking port

<figure>
<img class="zoom" src="/img/aws/aws_sg_3.png#center"/>
<figcaption align = "center"><b>Fig.7:</b> Fill in the details</figcaption>
</figure>

:::tip UNDERSTANDING PORTS: STAKING & API PORTS

Camino Node utilizes two ports for distinct functionalities. Port 9651 is the staking port, responsible for communication
with the validator nodes on the Camino Network.

Additionally, port 9650 is used to expose the API. If you do not intend to utilize your node as an API node, you can exclude
the rule 2 or if you wish to restrict API access to specific IP addresses or subnets, you can modify the source IP range
accordingly. The staking port (9651) should always have access to all IP addresses (0.0.0.0/0) without any restrictions.

For a more comprehensive understanding of APIs, please consult the [Camino Node APIs](/developer/apis/camino-node-apis/)
documentation.

:::

6. Click on **"Create security group"** to create the security group.

<figure>
<img class="zoom" src="/img/aws/aws_sg_4.png#center"/>
<figcaption align = "center"><b>Fig.8:</b> Click "Create security group"</figcaption>
</figure>

### Create EC2 instance: Launching Your Camino Node Machine

In this step, we'll create an Amazon Elastic Compute Cloud (EC2) instance, which will serve as your Camino Node machine. The EC2 instance provides a scalable and flexible computing environment, allowing you to run applications like Camino Node on the AWS cloud.

During the EC2 instance creation, you'll select the instance type, operating system, and other configurations to suit your Camino Node requirements. We'll also associate the previously created Key Pair and Security Group to ensure secure access and communication.

Once the EC2 instance is up and running, you'll be ready to start the Camino Node setup process. The instance will be equipped with the necessary resources to run Camino Node efficiently.

Let's proceed with creating the EC2 instance and get your Camino Node machine up and running on AWS.

1. Click on **"Launch instances"** to start the process of creating a new EC2 instance.

<figure>
<img class="zoom" src="/img/aws/aws_instance_0.5.png#center"/>
<figcaption align = "center"><b>Fig.9:</b> Click on "Launch instances"</figcaption>
</figure>

2. Write a name for the instance to identify it easily.

3. Choose **Ubuntu LTS** as the operating system with **64-bit (x86) configuration**.

<figure>
<img class="zoom" src="/img/aws/aws_instance_1.png#center"/>
<figcaption align = "center"><b>Fig.10:</b> Fill in the details</figcaption>
</figure>

4. Choose **Instance type: m6g.xlarge** (or any other suitable instance type, check [node requirements](/camino-node/set-up-node-with-installer/#before-you-start) for guidance).

<figure>
<img class="zoom" src="/img/aws/aws_instance_2.png#center"/>
<figcaption align = "center"><b>Fig.11:</b> Select "mx6.xlarge"</figcaption>
</figure>

5. Under **"Key pair,"** choose the key pair which you created previously from the dropdown list. This will enable you to SSH into the instance.

<figure>
<img class="zoom" src="/img/aws/aws_instance_3.png#center"/>
<figcaption align = "center"><b>Fig.12:</b> Select the key pair</figcaption>
</figure>

6. Under **"Network Settings,"** choose **"Select an existing security group"** and select the security group you created earlier from the list. This will apply the inbound rules you set for SSH and Camino TCP ports.

<figure>
<img class="zoom" src="/img/aws/aws_instance_4.png#center"/>
<figcaption align = "center"><b>Fig.13:</b> Select the Security Group</figcaption>
</figure>

7. Under **"Configure storage,"** set the size to **500 GB** with **gp3** for the storage type.

<figure>
<img class="zoom" src="/img/aws/aws_instance_5.png#center"/>
<figcaption align = "center"><b>Fig.14:</b> Set the disk size</figcaption>
</figure>

8. Click on **"Advanced details"** to configure additional settings.

9. Under **"User data,"** add the startup script provided below. This script will be executed when the instance starts and set up the necessary components for running Camino Node.

<figure>
<img class="zoom" src="/img/aws/aws_instance_6.png#center"/>
<figcaption align = "center"><b>Fig.15:</b> Add a start up script</figcaption>
</figure>

```bash
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
gsutil -m rsync -d -R  gs://camino-db /home/camino-data/db

docker run -d -v /home/camino-data:/root/.caminogo -p 9650:9650 -p 9651:9651 --restart always c4tplatform/camino-node:latest ./camino-node --network-id=camino --http-host=0.0.0.0 --public-ip-resolution-service=ifconfigme

```

:::note NETWORK ID

If you intend to run your node on the testnet, make the following changes:

- Change the `--network-id=camino` option to `--network-id=columbus`.
- Update `gs://camino-db` to `gs://columbus-db`.

These adjustments will ensure your Camino Node operates on the Columbus testnet instead of the Camino mainnet.

:::

:::note PUBLIC IP

In the example startup script above, we utilized a public IP resolution service to determine the public IP address.
However, it is advisable to have a static public IP for stability. If you have a static public IP,
please replace `--public-ip-resolution-service=ifconfigme` with `--public-ip=<static-ip>` instead.

:::

## AWS Marketplace Method

:::caution DRAFT DOCUMENTATION

The information in this section of the documentation is currently under testing and review. Please proceed with caution.

:::

1. **Create a Keypair Manually:** Follow the ["Create Key Pair: Secure Access to Your Machine"](#create-key-pair-secure-access-to-your-machine) instructions from above to create a keypair.

2. **Create a Security Group Manually:** Follow the ["Create Security Group: Configuring Access Permissions"](#create-security-group-configuring-access-permissions) instructions from above to create a security group.

:::info

If you are already subscribed to the "Camino Node" product, you can skip steps 3-6 and proceed directly to step 7.

Navigate to your marketplace subscriptions and select "Launch new instance" for the "Camino Node" product.

<figure>
<img class="zoom" src="/img/aws/aws_mp_8.png#center"/>
<figcaption align = "center"><b>Fig.16:</b> Click "Launch new instance"</figcaption>
</figure>

:::

3. Navigate to the AWS Marketplace and search for "Camino Node".

4. Access the "Camino Node" product page and click on "Continue to Subscribe".

<figure>
<img class="zoom" src="/img/aws/aws_mp_1.png#center"/>
<figcaption align = "center"><b>Fig.17:</b> Click "Continue to Subscribe"</figcaption>
</figure>

5. Click on "Accept Terms".

<figure>
<img class="zoom" src="/img/aws/aws_mp_2.png#center"/>
<figcaption align = "center"><b>Fig.18:</b> Click on "Accept Terms"</figcaption>
</figure>

6. Click on "Continue to Configuration".

<figure>
<img class="zoom" src="/img/aws/aws_mp_3.png#center"/>
<figcaption align = "center"><b>Fig.19:</b> Click on "Continue to Configuration"</figcaption>
</figure>

7. Select the desired version of Camino Node. The version name includes the network (columbus for testnet or camino for mainnet) and the version number as per the GitHub releases [Releases · chain4travel/camino-node](https://github.com/chain4travel/camino-node/releases).

<figure>
<img class="zoom" src="/img/aws/aws_mp_4.png#center"/>
<figcaption align = "center"><b>Fig.20:</b> Select the desired version</figcaption>
</figure>

8. Choose the preferred AWS region.

<figure>
<img class="zoom" src="/img/aws/aws_mp_4.png#center"/>
<figcaption align = "center"><b>Fig.21:</b> Choose the region</figcaption>
</figure>

9. Select an instance type. As of this guide's creation, the recommended type is `t3.xlarge`.

<figure>
<img class="zoom" src="/img/aws/aws_mp_5.png#center"/>
<figcaption align = "center"><b>Fig.22:</b> Select the instance type</figcaption>
</figure>

10. Configure your preferred VPC settings and subnet.

<figure>
<img class="zoom" src="/img/aws/aws_mp_6.png#center"/>
<figcaption align = "center"><b>Fig.23:</b> Configure VPC & Subnet</figcaption>
</figure>

11. Select the security group and key pair created in the first two steps, then click "Launch".

<figure>
<img class="zoom" src="/img/aws/aws_mp_7.png#center"/>
<figcaption align = "center"><b>Fig.24:</b> Select security group and key pair</figcaption>
</figure>

## Terraform Method

### Setting Up Camino Node with Terraform on AWS

Automating the process of configuring Camino Node on AWS is made easier with Terraform.
Terraform allows you to create and manage infrastructure as code, simplifying the setup and deployment steps significantly.

:::note

Please note that this section outlines an alternative method for installing Camino Node on AWS.
If you have already completed the steps outlined in this guide, you do not need to follow this alternative method.

This alternative method provides an additional approach for setting up Camino Node on AWS and may be useful for
specific use cases or preferences.

:::

To take advantage of Terraform for setting up Camino Node, follow these steps:

1. [Download the Terraform script](/img/aws/camino-node-aws-terraform.tf).
1. Run the following commands in your terminal or command prompt, making sure to update the values
   for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`:

:::caution AWS CREDENTIALS

Before proceeding, ensure you have your AWS credentials ready. If you haven't created them yet, you can refer
to the [AWS Account and Access Keys](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)
documentation for instructions on how to create AWS credentials.

:::

```bash
terraform init
terraform fmt
terraform validate

## REQUIRED variables for aws access
export AWS_ACCESS_KEY_ID="xxxxxxx"
export AWS_SECRET_ACCESS_KEY="xxxxxx"

## OPTIONAL variables, below are the defaul values assigned
export TF_VAR_network=camino    ## use columbus for testnet
export TF_VAR_aws_region=eu-north-1
export TF_VAR_vm_name=camino-node
export TF_VAR_key_pair_name="camino-key-pair"
# write your ip range that will be allowed to ssh to the vm and also make api calls using port 9650. eg: 1.1.1.1/32
export TF_VAR_allowed_ip_range=""

terraform apply
```
