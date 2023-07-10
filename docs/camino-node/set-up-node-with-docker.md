---
sidebar_position: 3
title: Using Docker Image
---

# Camino Node Docker Setup

We have a docker registry containing the releases of Camino-Node hosted on [DockerHub](https://hub.docker.com/r/c4tplatform/camino-node). The docker images are ready-to-go precompiled versions of Camino-Node which is hosted on [GitHub](https://github.com/chain4travel/camino-node).

## Before you start

Camino is a lightweight protocol which let nodes run on commodity hardware. Note that as network usage increases, hardware requirements may change.

- CPU: Equivalent of 8 AWS vCPU
- RAM: 16 GiB
- Storage: 512 GiB
- OS: Ubuntu 18.04/20.04/22.04

The docker container assumes in the default configuration:

- Camino-Node will connect and integrate itself in the `Main-Net` which is not launched yet
- No API except the staking-API for peer-to-peer communication between the nodes is enabled
- A mount-point will be used to mount the directory `/root/.caminogo` to a persistent storage
- The port 9651 is accessible from the internet

:::caution NODE VERSIONS

Please make sure to use only the recommended node versions mentioned on the [Current Node Versions](/validator-guides/current-node-versions) page. Avoid using RC or Alpha releases on the mainnet.

:::

## Configuration

To change the configuration you have to pass another set of config-flags to the execution of Camino-Node. The list of config-flags can be found [here](/camino-node/configuration).

Examples:

- To connect to the Public Testnet `Columbus` you have to pass the `--network-id=columbus` flag
- To enable the HTTP/RPC API of the node (which is required for example for a MetaMask access) you have to pass the `--http-host=<IP/Host>`

Please note that it's highly recommended to leave all other APIs except the staking-API deactivated for Nodes which shall be used as a Validator-Node!

### Configuration with docker-compose

To make the configuration easier and more straightforward you can also use docker-compose to configure the Node to your needs:

Example docker-compose.yml file:

```
version: '3.1'

services:
  camino-columbus:
    image: c4tplatform/camino-node:v0.1.0
    ports:
      - 9650:9650
      - 9651:9651
    volumes:
      - ./camino-data:/root/.caminogo
    command: [ "./camino-node", "--network-id=columbus" , "--http-host=0.0.0.0" ]
```

With this docker-compose config a Camino-Node Node is started as part of the Public Testnet Columbus and will have the HTTP/RPC API reachable not only from localhost but also from the outside with its standard-port `9650`.

The reference how to use docker-compose can be found [here](https://docs.docker.com/compose/reference/) and the possible content of a docker-compose file can be found [here](https://docs.docker.com/compose/compose-file/).

## Node working files

The local node files are stored inside of the container in the `$HOME/.caminogo` directory. Those files should be located on a persistent storage and the directory should be mounted to not loose the key-files and logs when the container is being shut down. That being said, for your node's security, back up `staker.crt` and `staker.key` files, found in `$HOME/.caminogo/staking` and store them somewhere secure. You can use those files to recreate your node on a different computer if you ever need to.

## Networking considerations

To run successfully, Camino-Node needs to accept connections from the Internet on the network port `9651`. Before you proceed with the installation, you need to determine the networking environment your node will run in.

### Running on a cloud provider

If your node is running on a cloud provider computer instance, it will have a static IP. Find out what that static IP is, or set it up if you didn't already.

### Running on a home connection

If you're running a node on a computer that is on a residential internet connection, you have a dynamic IP; that is, your IP will change periodically. For a home connection, you will need to set up inbound port forwarding of port `9651` from the internet to the computer the node is installed on.

As there are too many models and router configurations, we cannot provide instructions on what exactly to do, but there are online guides to be found (like [this](https://www.noip.com/support/knowledgebase/general-port-forwarding-guide/), or [this](https://www.howtogeek.com/66214/how-to-forward-ports-on-your-router/) ), and your service provider support might help too.

### Node ID

To find out your NodeID, which is used to identify your node to the network, you can look up the log-line in your docker log or you can run the following command inside of a shell attached to the container:

Docker logs:

```bash
docker logs <container-id> | grep -oP "node ID is:.*" | cut -d" " -f4 | sort -u
```

Command-line inside of the container:

```bash
grep -oP "node ID is:.*" /root/.caminogo/logs/main.log | cut -d" " -f4 | sort -u
```

It will produce output like:

```text
NodeID-6seStrauyCnVV7NEVwRbfaT9B6EnXEzfY
```

This is the ID to your Node. Store that; it will be needed for staking or looking up your node.

## Node upgrade

Camino-Node is an ongoing project and there are regular version upgrades. Most upgrades are recommended but not required. Advance notice will be given for upgrades that are not backwards compatible. When a new version of the node is released, you will notice log lines like:

```text
Jan 08 10:26:45 ip-172-31-16-229 caminogo[6335]: INFO [01-08|10:26:45] caminogo/network/peer.go#526: beacon 9CkG9MBNavnw7EVSRsuFr7ws9gascDQy3 attempting to connect with newer version camino/0.1.0. You may want to update your client
```

It is recommended to always upgrade to the latest version, because new versions bring bug fixes, new features and upgrades.

To upgrade your node, simply change the tag of the docker container obtained from the DockerHub repository

## Advanced Node configuration

File that configures node operation is `~/.caminogo/configs/node.json`. You can edit it to add or change configuration options. The documentation of configuration options can be found [here](/camino-node/configuration). Default configuration may look like this:

```json
{
  "dynamic-public-ip": "opendns",
  "http-host": ""
}
```

Note that configuration file needs to be a properly formatted `JSON` file, so switches are formatted differently than for command line, so don't enter options like `--dynamic-public-ip=opendns` but as in the example above.

## What next?

That's it, you're running a Camino-Node node on docker! Congratulations! Share it on our [Twitter](https://twitter.com/caminonetwork) or [Discord](https://discord.gg/camino)!

If you're on a residential network (dynamic IP), don't forget to set up port forwarding. If you're on a cloud service provider, you're good to go.

Now you can [interact with your node](/developer/apis/camino-node-apis/issuing-api-calls.md).

Finally, if you haven't already, it is a good idea to back up important files in case you ever need to restore your node to a different machine.

If you have any questions, or need help, feel free to contact us on our [Discord](https://discord.gg/camino) server.
