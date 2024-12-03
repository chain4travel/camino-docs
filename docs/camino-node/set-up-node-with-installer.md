---
sidebar_position: 2
title: Automatic Install Script
description: Use installation script for a quick and easy deployment
---

# Camino Node Install Script

We have a [shell (bash) script](https://raw.githubusercontent.com/chain4travel/camino-docs/main/scripts/caminogo-installer.sh) that installs Camino node on your computer. This script sets up full, running node in a matter of minutes with minimal user input required.

## Before you start

Camino is a lightweight protocol which let nodes run on commodity hardware. Note that as network usage increases, hardware requirements may change.

- CPU: Equivalent of 8 AWS vCPU
- RAM: 16 GiB
- Storage: 512 GiB
- OS: Ubuntu 18.04/20.04/22.04

This install script assumes:

- Camino-Node is not running and not already installed as a service
- User running the script has superuser privileges (can run `sudo`)

:::caution NODE VERSIONS

Please make sure to use only the recommended node versions mentioned on the [Current Node Versions](/validator-guides/current-node-versions) page. Avoid using RC or Alpha releases on the mainnet.

:::

### Environment considerations

If you run a different flavor of Linux, the script might not work as intended. It assumes `systemd` is used to run system services. Other Linux flavors might use something else, or might have files in different places than is assumed by the script.

If you have a node already running on the computer, stop it before running the script.

#### Node running from terminal

If your node is running in a terminal stop it by pressing `ctrl+C`.

#### Node running as a service

If your node is already running as a service, then you probably don't need this script. You're good to go.

#### Node running in the background

If your node is running in the background (by running with `nohup`, for example) then find the process running the node by running `ps aux | grep camino-node`. This will produce output like:

```text
ubuntu  6834  0.0  0.0   2828   676 pts/1    S+   19:54   0:00 grep camino-node
ubuntu  2630 26.1  9.4 2459236 753316 ?      Sl   Dec02 1220:52 /home/ubuntu/build/camino-node
```

Look for line that doesn't have `grep` on it. In this example, that is the second line. It shows information about your node. Note the process id, in this case, `2630`. Stop the node by running `kill -2 2630`.

#### Node working files

If you previously ran a Camino-Node node on this computer, you will have the local node files stored in `$HOME/.caminogo` directory. Those files will not be disturbed and the node set up by the script will continue its operation with the same identity and state it had before. That being said, for your node's security, back up `staker.crt` and `staker.key` files, found in `$HOME/.caminogo/staking` and store them somewhere secure. You can use those files to recreate your node on a different computer if you ever need to.

### Networking considerations

To run successfully, Camino-Node needs to accept connections from the Internet on the network port `9651`. Before you proceed with the installation, you need to determine the networking environment your node will run in.

#### Running on a cloud provider

If your node is running on a cloud provider computer instance, it will have a static IP. Find out what that static IP is, or set it up if you didn't already. The script will try to find out the IP by itself, but that might not work in all environments, so you will need to check the IP or enter it yourself.

#### Running on a home connection

If you're running a node on a computer that is on a residential internet connection, you have a dynamic IP; that is, your IP will change periodically. The install script will configure the node appropriately for that situation. But, for a home connection, you will need to set up inbound port forwarding of port `9651` from the internet to the computer the node is installed on.

As there are too many models and router configurations, we cannot provide instructions on what exactly to do, but there are online guides to be found (like [this](https://www.noip.com/support/knowledgebase/general-port-forwarding-guide/), or [this](https://www.howtogeek.com/66214/how-to-forward-ports-on-your-router/) ), and your service provider support might help too.

## Running the script

So, now that you prepared your system and have the info ready, let's get to it.

To download and run the script, enter the following in the terminal:

```bash
wget -nd -m https://raw.githubusercontent.com/chain4travel/camino-docs/c4t/scripts/caminogo-installer.sh;\
chmod 755 caminogo-installer.sh;\
./caminogo-installer.sh
```

And we're off! The output should look something like this:

```text
Camino-Node installer
---------------------
Preparing environment...
Found arm64 architecture...
Looking for the latest arm64 build...
Will attempt to download:
 https://github.com/chain4travel/camino-node/releases/download/v0.1.0/camino-node-linux-arm64-v0.1.0.tar.gz
camino-node-linux-arm64-v0.1.0.tar.gz 100%[=========================================================================>]  29.83M  75.8MB/s    in 0.4s
Unpacking node files...
camino-node-v0.1.0/plugins/
camino-node-v0.1.0/camino-node
Node files unpacked into /home/ubuntu/camino-node
```

And then the script will prompt you for information about the network environment:

```text
To complete the setup some networking information is needed.
Where is the node installed:
1) residential network (dynamic IP)
2) cloud provider (static IP)
Enter your connection type [1,2]:
```

enter `1` if you have dynamic IP, and `2` if you have a static IP. If you are on a static IP, it will try to auto-detect the IP and ask for confirmation.

```text
Detected '104.27.15.23' as your public IP. Is this correct? [y,n]:
```

Confirm with `y`, or `n` if the detected IP is wrong (or empty), and then enter the correct IP at the next prompt.

The script will then continue with system service creation and finish with starting the service.

```text
Installing service with public IP: 104.27.15.23
Created symlink /etc/systemd/system/multi-user.target.wants/camino-node.service → /etc/systemd/system/camino-node.service.

Done!

Your node should now be bootstrapping on the main net.
Node configuration file is /home/ubuntu/.caminogo/configs/node.json
To check that the service is running use the following command (q to exit):
sudo systemctl status camino-node
To follow the log use (ctrl+C to stop):
sudo journalctl -u camino-node -f

Reach us over on https://discord.gg/camino if you're having problems.
```

The script is finished, and you should see the system prompt again.

## Running on Testnet (columbus)

By default the generated configuration file doesn't have `network-id` option which means it will run on the mainnet (camino). To run the node on testnet, you need to edit the configuaration file located in `.caminogo/configs/node.json` and add `"network-id": "columbus"`. It should look like the following:

```json
{
  "public-ip": "111.111.111.111",
  "network-id": "columbus",
  "http-host": ""
}
```

You need to stop the node and start it again if you change the config file. [**Stopping the node**](#stopping-the-node)

## Post installation

Camino-Node should be running in the background as a service. You can check that it's running with:

```bash
sudo systemctl status camino-node
```

This will print the node's latest logs, which should look like this:

```text
● camino-node.service - Camino-Node systemd service
Loaded: loaded (/etc/systemd/system/camino-node.service; enabled; vendor preset: enabled)
Active: active (running) since Tue 2021-01-05 10:38:21 UTC; 51s ago
Main PID: 2142 (camino-node)
Tasks: 8 (limit: 4495)
Memory: 223.0M
CGroup: /system.slice/camino-node.service
└─2142 /home/ubuntu/camino-node/camino-node --dynamic-public-ip=opendns --http-host=

Jan 05 10:38:45 ip-11-11-11-11 camino-node[2142]: INFO [01-05|10:38:45] <P Chain> caminogo/vms/platformvm/vm.go#322: initializing last accepted block as 2FUFPVPxbTpKNn39moGSzsmGroYES4NZRdw3mJgNvMkMiMHJ9e
Jan 05 10:38:45 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:38:45] <P Chain> caminogo/snow/engine/snowman/transitive.go#58: initializing consensus engine
Jan 05 10:38:45 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:38:45] caminogo/api/server.go#143: adding route /ext/bc/11111111111111111111111111111111LpoYY
Jan 05 10:38:45 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:38:45] caminogo/api/server.go#88: HTTP API server listening on ":9650"
Jan 05 10:38:58 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:38:58] <P Chain> caminogo/snow/engine/common/bootstrapper.go#185: Bootstrapping started syncing with 1 vertices in the accepted frontier
Jan 05 10:39:02 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:39:02] <P Chain> caminogo/snow/engine/snowman/bootstrap/bootstrapper.go#210: fetched 2500 blocks
Jan 05 10:39:04 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:39:04] <P Chain> caminogo/snow/engine/snowman/bootstrap/bootstrapper.go#210: fetched 5000 blocks
Jan 05 10:39:06 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:39:06] <P Chain> caminogo/snow/engine/snowman/bootstrap/bootstrapper.go#210: fetched 7500 blocks
Jan 05 10:39:09 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:39:09] <P Chain> caminogo/snow/engine/snowman/bootstrap/bootstrapper.go#210: fetched 10000 blocks
Jan 05 10:39:11 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:39:11] <P Chain> caminogo/snow/engine/snowman/bootstrap/bootstrapper.go#210: fetched 12500 blocks
```

Note the `active (running)` which indicates the service is running ok. You may need to press `q` to return to the command prompt.

To find out your NodeID, which is used to identify your node to the network, run the following command:

```bash
sudo journalctl -u camino-node | grep "NodeID"
```

It will produce output like:

```text
Jan 05 10:38:38 ip-11-11-11-11 caminogo[2142]: INFO [01-05|10:38:38] caminogo/node/node.go#428: Set node's ID to 6seStrauyCnVV7NEVwRbfaT9B6EnXEzfY
```

Prepend `NodeID-` to the value to get, for example, `NodeID-6seStrauyCnVV7NEVwRbfaT9B6EnXEzfY`. Store that; it will be needed for staking or looking up your node.

Your node should be in the process of bootstrapping now. You can monitor the progress by issuing the following command:

```bash
sudo journalctl -u camino-node -f
```

Press `ctrl+C` when you wish to stop reading node output.

## Stopping the node

To stop Camino-Node, run:

```bash
sudo systemctl stop camino-node
```

To start it again, run:

```bash
sudo systemctl start camino-node
```

## Node upgrade

Camino-Node is an ongoing project and there are regular version upgrades. Most upgrades are recommended but not required. Advance notice will be given for upgrades that are not backwards compatible. When a new version of the node is released, you will notice log lines like:

```text
Jan 08 10:26:45 ip-172-31-16-229 caminogo[6335]: INFO [01-08|10:26:45] caminogo/network/peer.go#526: beacon 9CkG9MBNavnw7EVSRsuFr7ws9gascDQy3 attempting to connect with newer version camino/0.1.0. You may want to update your client
```

It is recommended to always upgrade to the latest version, because new versions bring bug fixes, new features and upgrades.

To upgrade your node, just run the installer script again:

```bash
./caminogo-installer.sh
```

It will detect that you already have Camino-Node installed:

```text
Camino-Node installer
---------------------
Preparing environment...
Found 64bit Intel/AMD architecture...
Found Camino-Node systemd service already installed, switching to upgrade mode.
Stopping service...
```

It will then upgrade your node to the latest version, and after it's done, start the node back up, and print out the information about the latest version:

```text
Node upgraded, starting service...
New node version:
camino/0.1.0 [network=camino, database=v1.0.0, commit=f76f1fd5f99736cf468413bbac158d6626f712d2]
Done!
```

## Node configuration

File that configures node operation is `~/.caminogo/configs/node.json`. You can edit it to add or change configuration options. The documentation of configuration options can be found [here](/camino-node/configuration). Default configuration may look like this:

```json
{
  "dynamic-public-ip": "opendns",
  "http-host": ""
}
```

Note that configuration file needs to be a properly formatted `JSON` file, so switches are formatted differently than for command line, so don't enter options like `--dynamic-public-ip=opendns` but as in the example above.

## Using a previous version

The installer script can also be used to install a version of Camino-Node other than the latest version.

To see a list of available versions for installation, run:

```bash
./caminogo-installer.sh --list
```

It will print out a list, something like:

```text
Camino-Node installer
---------------------
Available versions:
v0.1.0
v0.0.0
```

To install a specific version, run the script with `--version` followed by the tag of the version. For example:

```bash
./caminogo-installer.sh --version v0.1.0
```

:::danger
Note that not all Camino-Node versions are compatible. You should generally run the latest version. Running a version other than latest may lead to your node not working properly and, for validators, not receiving a staking reward.
:::

## Reinstall and script update

Installer script gets updated from time to time, with new features and capabilities added. To take advantage of new features or to recover from modifications that made the node fail, you may want to reinstall the node. To do that, fetch the latest version of the script from the web with:

```bash
wget -nd -m https://raw.githubusercontent.com/chain4travel/camino-docs/main/scripts/caminogo-installer.sh
```

After the script has updated, run it again with the `--reinstall` config flag:

```bash
./caminogo-installer.sh --reinstall
```

This will delete the existing service file, and run the installer from scratch, like it was started for the first time. Note that the database and NodeID will be left intact.

## What next?

That's it, you're running a Camino-Node node! Congratulations! Let us know you did it on our [Twitter](https://twitter.com/camino_network) or [Discord](https://discord.gg/camino)!

If you're on a residential network (dynamic IP), don't forget to set up port forwarding. If you're on a cloud service provider, you're good to go.

Now you can [interact with your node](/developer/apis/camino-node-apis/issuing-api-calls.md).

Finally, if you haven't already, it is a good idea to back up important files in case you ever need to restore your node to a different machine.

If you have any questions, or need help, feel free to contact us on our [Discord](https://discord.gg/camino) server.
