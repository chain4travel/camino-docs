---
sidebar_position: 15
title: Partner Plugin
description: Camino Messenger Bot Partner Plugin
---

# Camino Messenger Bot Partner Plugin

:::info DRAFT DOCUMENTATION NOTICE

Please be aware that this document is currently a draft and is undergoing
active development. Content, guidelines, and instructions may be subject to
change.

:::

:::caution 🚧 ALPHA CODE NOTICE 🚧

This application is in the alpha phase of development. It is important to note
that during this stage, breaking changes may occur without advance notice.
Users should proceed with caution.

:::

## What is Partner Plugin?

The Camino Messenger Bot facilitates integration with existing systems through
an application developed by the partner, whether they are a distributor or a
provider. It comes with a sample implementation of this application to
demonstrate how integration can be achieved.

This example can be found at `examples/rpc/partner-plugin/server.go` within the
[Camino Messenger Bot repository](https://github.com/chain4travel/camino-messenger-bot).

:::note

Please note that the Partner Plugin is a mockup designed to respond to
received messages with mock data only.

:::

## Compiling the Partner Plugin

Before compiling the Partner Plugin, ensure you have followed the
[installation steps](installation#compiling-from-source) for the Camino Messenger Bot.

After completing the installation, execute the following command:

```sh
go build -o plugin  examples/rpc/partner-plugin/server.go
```

## Running the Partner Plugin

Execute the Partner Plugin with the following command in the shell:

```sh
PORT=50051 ./plugin
```

Ensure the port number aligns with what you've configured in the Camino
Messenger Bot configuration file.
