---
sidebar_position: 6
title: Auto Upgrade Node
description: Automatically Upgrade Camino Node
---

# Automatically Upgrade Camino Node

This guide provides instructions on how to automatically upgrade camino-node using a bash script and crontab.

## Automatic Install Script

If you have previously installed camino-node using the autoinstall script, you can now configure an automatic
upgrade with the following steps:

### Download Node Upgrader

First, download the node upgrader script. You can place this script anywhere on the node's operating system.
For the sake of this guide, we will assume you put it under the `/root` directory.

```
wget -nd -m https://raw.githubusercontent.com/chain4travel/camino-docs/c4t/scripts/camino-node-upgrader.sh;\
chmod 755 camino-node-upgrader.sh
```

**Usage:**

The script accepts a single option `-u` followed by a username argument. Provide the username used to install camino-node.

```
# ./camino-node-upgrader.sh -h
Usage: camino-node-upgrader.sh -u username
```

:::note DESINGED TO BE RUN AS ROOT

This script is intended to be executed with root user privileges.

:::

### Edit Crontab File

Edit the crontab file (`/etc/crontab`) and add the following line. Choose the desired time for the cron service to run the script.

In the example below, the script will run every day at 08:00 and log its output to `/var/log/camino-node-upgrader.log`.
You can check this file to review the script's actions.

:::tip CUSTOMIZE UPGRADE TIME

Customizing the upgrade time to suit your preferences is advisable instead of using the example provided. Doing so will prevent all nodes in the network from upgrading simultaneously, ensuring a smoother upgrade process overall.

:::

```cron
0 8 * * *       root    /root/camino-node-upgrader.sh -u <username> >> /var/log/camino-node-upgrader.log 2>&1
```

:::tip CHANGE THE USERNAME

Before saving, make sure to replace `<username>` in the crontab entry with the appropriate username.

:::

:::caution Important Precautions for Automatic Upgrades

Keep in mind that performing automatic upgrades always involves certain risks. It is crucial to have a
backup plan in place to address any unexpected issues that may arise during the upgrade process.
Most importantly, ensure that you have backed up your node's staker keys.

:::

### Sample Output From Script

Here is a sample output from a node that is updated from `v0.4.9` to `v1.0.0`.

```
*** Starting upgrade process for user: camino ***
*** Date is: Thu Jul 27 22:36:01 UTC 2023 ***
Found camino-node systemd service...
Preparing environment...
Found amd64 architecture...
Checking latest release... latest camino-node version is: v1.0.0
Getting current running node version... current running camino-node version is: v0.4.9
Current Node version (v0.4.9) is NOT the latest (v1.0.0)
Upgrading camino-node...
Stopping service...done @Thu Jul 27 22:36:02 UTC 2023
Node version found.
Attempting to download: https://github.com/chain4travel/camino-node/releases/download/v1.0.0/camino-node-linux-amd64-v1.0.0.tar.gz

     0K .......... .......... .......... .......... ..........  0% 1.51M 19s
    50K .......... .......... .......... .......... ..........  0% 2.03M 17s
   100K .......... .......... .......... .......... ..........  0% 4.15M 13s
   150K .......... .......... .......... .......... ..........  0% 8.02M 11s
--------------------8<--------------------
 29300K .......... .......... .......... .......... .......... 99% 11.1M 0s
 29350K .......... .......... .......... .......... .......... 99% 8.85M 0s
 29400K .......... .......... .......... .......... .......... 99% 8.59M 0s
 29450K .......... .......... .......... .......... .......... 99% 13.7M 0s
 29500K ..........                                            100% 18.5M=3.4s2023-07-27 22:36:07 URL:https://objects.githubusercontent.com/github-production-release-asset-2e65be/492036145/6f1d02ce-373c-4369-b277-
ada7df6ce5af?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20230727%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230727T223602Z&X-Amz-Expires=300&X-Amz-Signature=0b206b166738adff6cde104
079b7926e8e43b1e01abbd4c4f09882a8f006207d&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=492036145&response-content-disposition=attachment%3B%20filename%3Dcamino-node-linux-amd64-v1.0.0.tar.gz&response-cont
ent-type=application%2Foctet-stream [30218484/30218484] -> "camino-node-linux-amd64-v1.0.0.tar.gz" [1]
Unpacking node files...
camino-node-v1.0.0/tools/
camino-node-v1.0.0/tools/cert
camino-node-v1.0.0/LICENSE
camino-node-v1.0.0/plugins/
camino-node-v1.0.0/camino-node
Node files unpacked into /home/camino/camino-node
Node upgraded, starting service...done @Thu Jul 27 22:36:08 UTC 2023
New node version:
camino-node: v1.0.0, commit: c403cb6
caminogo: v1.0.0-rc1, commit: 0c5035f69
  compat: v1.0.0 [database: v1.4.5]
Done!
```

If the latest released node version is the same as the one already installed, the output will look like this:

```
*** Starting upgrade process for user: camino ***
*** Date is: Thu Jul 27 22:37:01 UTC 2023 ***
Found camino-node systemd service...
Preparing environment...
Found amd64 architecture...
Checking latest release... latest camino-node version is: v1.0.0
Getting current running node version... current running camino-node version is: v1.0.0
Current node version (v1.0.0) is the latest (v1.0.0). Skipping...
```

## Docker Compose

If you have installed camino-node with Docker, you can enable auto-upgrades using Docker Compose with
the following configuration:

### Add Watchtower to Docker Compose

Include the Watchtower service in your Docker Compose file to enable automatic upgrades for the camino-node container.

```yaml
version: "3.1"

services:
  camino:
    image: c4tplatform/camino-node:latest
    ports:
      - 9650:9650
      - 9651:9651
    volumes:
      - ./camino-data:/root/.caminogo
    # Replace <public-ip> with your node's public IP address
    command:
      [
        "./camino-node",
        "--network-id=camino",
        "--public-ip=<public-ip>",
        "--http-host=0.0.0.0",
      ]
    restart: always
    labels:
      - "com.centurylinklabs.watchtower.enable=true"
  watchtower:
    image: containrrr/watchtower
    container_name: watchtower
    restart: always
    environment:
      WATCHTOWER_POLL_INTERVAL: 86400
      WATCHTOWER_CLEANUP: "true"
      WATCHTOWER_DEBUG: "true"
      WATCHTOWER_LABEL_ENABLE: "true"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

#### Customize Watchtower Poll Interval:

Change the value of `WATCHTOWER_POLL_INTERVAL` (in seconds) above to your desired poll interval.
In the provided example, it is set to 24 hours, default value of Watchtower.

#### Set Your Public IP:

Don't forget to specify your public IP address in the command line.
