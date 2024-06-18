---
sidebar_position: 13
title: Run Camino Node with Huawei Cloud KooGallery
description: Learn how to set up Camino Node on Huawei Cloud KooGallery once it's released.
---

# Setting Up Camino Node on Huawei Cloud KooGallery

In this guide, we will walk you through the process of setting up Camino Node on Huawei Cloud KooGallery platform.

Whether you're new to blockchain technology or an experienced Huawei Cloud user, this guide is designed to be accessible and easy to follow. It provides step-by-step instructions to help you get Camino Node up and running smoothly on Huawei KooGallery.

Let's get started with the setup process of Camino Node on Huawei KooGallery.

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

1. Select **Elastic Cloud Server Console** to access the ECS section in Huawei Cloud Console. This is where you'll create and manage your virtual machine instances.

<figure>
<img class="zoom" src="/img/huawei/huawei_sg_1.png#center"/>
<figcaption align = "center"><b>Fig.1:</b> Go to ECS Section</figcaption>
</figure>

2. Go to **"Network & Security" >> "Security Groups"**. This will open new browser tab.

3. Click on **"Create Security Group"**.

4. Write a name for the security group, e.g., "camino-security-group".

5. Choose **"Fast-add-rule"** from the templates.

6. Write a description, e.g., "Allow inbound traffic for SSH port and Camino TCP ports". Then click on **"Ok"**.

<figure>
<img class="zoom" src="/img/huawei/huawei_sg_2.png#center"/>
<figcaption align = "center"><b>Fig.2:</b> Fill in the details</figcaption>
</figure>

6. A pop message will appear to let you add new rules. Click on **"Manage Rules"**

<figure>
<img class="zoom" src="/img/huawei/huawei_sg_3.png#center"/>
<figcaption align = "center"><b>Fig.3:</b> Manage Rules</figcaption>
</figure>

7. click on **"Add Rule"**, add the following inbound rules, then click **"Ok"**:

   - **Rule 1**:
     - **Priority**: 1
     - **Action**: Allow
     - **Type**: IPv4
     - **Protocol**: Protocols/TCP (Custom ports)
     - **Port**: 22
     - **Source**: IP Address
     - **IP Range**: Your IP Range (to allow SSH port access from your IP Range)
     - **Description**: SSH port
   - **Rule 2**:
     - **Priority**: 1
     - **Action**: Allow
     - **Type**: IPv4
     - **Protocol**: Protocols/TCP (Custom ports)
     - **Port**: 9651
     - **Source**: IP Address
     - **IP Range**: 0.0.0.0/0 (to allow staking port access from any IP)
     - **Description**: Staking port
   - **Rule 3**:
     - **Priority**: 1
     - **Action**: Allow
     - **Type**: IPv4
     - **Protocol**: Protocols/TCP (Custom ports)
     - **Port**: 9650
     - **Source**: IP Address
     - **IP Range**: Your IP Range (to allow HTTP port access from your IP Range)
     - **Description**: API HTTP port

<figure>
<img class="zoom" src="/img/huawei/huawei_sg_4.png#center"/>
<figcaption align = "center"><b>Fig.4:</b> Add Rules</figcaption>
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

### Create Key Pair: Secure Access to Your Machine

Creating a Key Pair is an essential step that will grant you secure access to your newly created machine. With the Key Pair,
you'll be able to log in to the machine securely via SSH (Secure Shell) and manage it effectively.

During the Key Pair creation process, you will generate a public and private key pair. The private key will be used to
authenticate yourself when connecting to the machine, while the public key will be associated with the machine and enable secure access.

Keep your private key safe and do not share it with others. With this Key Pair, you'll have the necessary credentials to access
your machine securely and carry out the required configurations.

Let's proceed with creating the Key Pair to ensure secure access to your Camino Node machine.

1. Back to the **"ECS Console"** Go to **"Network & Security" > "Key Pair"**.

2. Click on **"Create Key Pair"**.

<figure>
<img class="zoom" src="/img/huawei/huawei_kp_1.png#center"/>
<figcaption align = "center"><b>Fig.5:</b> Click "Create Key Pair"</figcaption>
</figure>

3. Write a name for the key, e.g., "camino-key-pair".
4. Check the box for Key Pair Service Disclaimer.
5. Click **"Ok"** and save the downloaded file. This key pair will be used to connect to the machine via SSH.

<figure>
<img class="zoom" src="/img/huawei/huawei_kp_2.png#center"/>
<figcaption align = "center"><b>Fig.4:</b> Key Pair Creation</figcaption>
</figure>

### Create ECS instance: Launching Your Camino Node Machine

In this step, we'll create an Elastic Cloud Server (ECS) instance, which will serve as your Camino Node machine. You will find Camino Node image in Huawei Cloud KooGallery

During the ECS instance creation, you'll select the instance type, operating system, and other configurations to suit your Camino Node requirements. We'll also associate the previously created Key Pair and Security Group to ensure secure access and communication.

Once the ECS instance is up and running, you'll be ready to start the Camino Node setup process. The instance will be equipped with the necessary resources to run Camino Node efficiently.

Let's proceed with creating the ECS instance and get your Camino Node machine up and running on Huawei Cloud.

1. Open KooGallery and serch for "Camino Node" or you can directly use this [LINK](https://marketplace.eu.huaweicloud.com/hidden/contents/8939f076-027e-4cd6-a8c6-170fedccda51)

<figure>
<img class="zoom" src="/img/huawei/huawei_instance_1.png#center"/>
<figcaption align = "center"><b>Fig.9:</b> Camino Node in KooGallery</figcaption>
</figure>

2. Scroll down and choose suitable **Region, Image and ECS Flabour**, then click on **"Continue to Submit"**

<figure>
<img class="zoom" src="/img/huawei/huawei_instance_2.png#center"/>
<figcaption align = "center"><b>Fig.9:</b> Camino Node Configurations</figcaption>
</figure>

3. It will open a new browser tab to create ECS instance. Configure **Region, Billin Mode, Specifications, Image and System Disk**. Note that System Disk must have at least **128 GB**. Then click on **"Next: Configure Network"**

<figure>
<img class="zoom" src="/img/huawei/huawei_instance_3.png#center"/>
<figcaption align = "center"><b>Fig.9:</b> ECS Specifications</figcaption>
</figure>

4. Choose the preferred **Network VPC**. Choose the **Security Group: camino-security-group**. Set **EIP** to **Auto assign**. Then click on **"Next: Configure Advanced Settings"**

<figure>
<img class="zoom" src="/img/huawei/huawei_instance_4.png#center"/>
<figcaption align = "center"><b>Fig.11:</b> Netwrok Configurations</figcaption>
</figure>

5. Write a name for your instance. Choose **Key Pair** as Login method and select the Key Pair which was created previously. check the **Auto Recovery** Box. Then click on **"Next: Confirm"**

<figure>
<img class="zoom" src="/img/huawei/huawei_instance_5.png#center"/>
<figcaption align = "center"><b>Fig.12:</b> Advanced Settings Configurations</figcaption>
</figure>

6. Review the instance configurations and agree to the Image Disclaimer. Then click on **"Submit"**

<figure>
<img class="zoom" src="/img/huawei/huawei_instance_6.png#center"/>
<figcaption align = "center"><b>Fig.12:</b> Review and Submit</figcaption>
</figure>

7. Now the ECS instance will start and Camino Node service will run inside it. You can go back to the **ECS Console** to chekc the instance status and connect to it.
