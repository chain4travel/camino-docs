---
sidebar_position: 1
description: The quickest way to learn about Camino is to run a node and interact with the network and geared toward people interested in how the Camino Platform works.
---

# Camino Node manual setup

The quickest way to learn about Camino is to run a node and interact with the network.

In this tutorial, we will:

- Install and run a Camino node
- Connect to Camino

This tutorial is primarily geared toward developers and people interested in how the Camino Platform works. If you're just interested in setting up a node for staking, you may want to follow the [Camino Node Install Script](set-up-node-with-installer.md) tutorial instead. The installer automates the installation process and sets it up as a system service, which is recommended for unattended operation. You may also try things out by following this tutorial first, and then later set up the node using the installer as a permanent solution.

## Requirements

Camino is a lightweight protocol which let nodes run on commodity hardware. Note that as network usage increases, hardware requirements may change.

- CPU: Equivalent of 8 AWS vCPU
- RAM: 16 GiB
- Storage: 512 GiB
- OS: Ubuntu 18.04/20.04/22.04 or MacOS &gt;= Catalina

## Run a Camino Node and Send Funds

Let’s install Camino-Node, the Go implementation of a Camino node, and connect to the Camino Public Testnet (Columbus).

### Download Camino-Node

The node is a binary program. You can either download the source code and then build the binary program, or you can download the pre-built binary. You don’t need to do both.

Downloading [pre-built binary](run-camino-node.md#binary) is easier and recommended if you're just looking to run your own node and stake on it.

Building the node from source is recommended if you're a developer looking to experiment and build on Camino.

#### **Source Code**

If you want to build the node from source, you're first going to need to install Go 1.16.8 or later. Follow the instructions [here](https://golang.org/doc/install).

Run `go version`. **It should be 1.16.8 or above.** Run `echo $GOPATH`. **It should not be empty.**

Download the Camino-Node repository:

```sh
git clone https://github.com/chain4travel/camino-node.git
```

Note: This checkouts to chain4travel branch. For the latest stable version, checkout to the latest tag. The latest version that is compatible with testnet (columbus) is v0.2.1-rc2

Change to the `camino-node` directory:

```sh
cd camino-node
```

Build Camino-Node:

```sh
./scripts/build.sh
```

The binary, named `camino-node`, is in `camino-node/build`.

#### **Binary**

If you want to download a pre-built binary instead of building it yourself, go to our [releases page](https://github.com/chain4travel/camino-node/releases), and select the release you want (probably the latest one.)

Under `Assets`, select the appropriate file.

For MacOS: Download: `camino-node-macos-<VERSION>.zip`
Unzip: `unzip camino-node-macos-<VERSION>.zip` The resulting folder, `camino-node-<VERSION>`, contains the binaries.

For Linux on PCs or cloud providers: Download: `camino-node-linux-amd64-<VERSION>.tar.gz`
Unzip: `tar -xvf camino-node-linux-amd64-<VERSION>.tar.gz`
The resulting folder, `camino-node-<VERSION>-linux`, contains the binaries.

For Linux on RaspberryPi4 or similar Arm64-based computers: Download: `camino-node-linux-arm64-<VERSION>.tar.gz`
Unzip: `tar -xvf camino-node-linux-arm64-<VERSION>.tar.gz`
The resulting folder, `camino-node-<VERSION>-linux`, contains the binaries.

### Start a Node, and Connect to Camino

If you built from source:

```sh
./build/camino-node --network-id=columbus
```

If you are using the pre-built binaries on MacOS:

```sh
./camino-node-<VERSION>/build/camino-node --network-id=columbus
```

If you are using the pre-built binaries on Linux:

```sh
./camino-node-<VERSION>-linux/camino-node --network-id=columbus
```

When the node starts, it has to bootstrap (catch up with the rest of the network). You will see logs about bootstrapping. When a given chain is done bootstrapping, it will print a log like this:

`INFO [06-07|19:54:06] <X Chain> /snow/engine/avalanche/transitive.go#80: bootstrapping finished with 1 vertices in the accepted frontier`

To check if a given chain is done bootstrapping, in another terminal window call [`info.isBootstrapped`](../../developer/apis/camino-node-apis/info.md#infoisbootstrapped) by copying and pasting the following command:

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"info.isBootstrapped",
    "params": {
        "chain":"X"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info
```

If this returns `true`, the chain is bootstrapped. If you make an API call to a chain that is not done bootstrapping, it will return `API call rejected because chain is not done bootstrapping`.

You can use `Ctrl + C` to kill the node.

If you want to experiment and play with your node, read on.

To be able to make API calls to your node from other machines, when starting up the node include argument `--http-host=` (e.g. `./build/camino-node --http-host=`)

When the mainnet (Camino) goes live, you can either omit `--network-id=columbus` parameter, or pass `--network-id=camino` which is the name of our mainnet.

Validators must know their public facing IP addresses so they can let other nodes know how to connect to them. So If your node will run as a validator, you need to use `--public-ip` option. For more info check [public-ip flag](camino-node-config-flags.md#public-ip)

## What next?

Your node is running and connected now. If you want to use your node as a validator, head over to the [Camino Web Wallet](https://wallet.camino.foundation) and register your node in there.
