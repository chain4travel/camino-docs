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

The Partner Plugin serves as a bridge enabling the Camino Messenger Bot to
integrate seamlessly with pre-existing systems. This tool is crafted for both
distributors and providers, coming equipped with a reference implementation
to illustrate potential integration strategies.

Functioning as an intermediary, the Partner Plugin establishes a gRPC server
that mirrors the bot's, effectively acting as a conduit for requests not
directly handled by the bot itself. These requests are then channeled to the
partner plugin which, after the necessary data transformation, forwards them
to the existing system of the distributor or provider. For example, should
the existing system accept search queries via a REST API, the Partner
Plugin's responsibilities would include:

- Receiving requests from the bot via its gRPC server.
- Executing REST calls to communicate with the existing system, thereby
  facilitating the integration process.

Example implementation can be found at `examples/rpc/partner-plugin/server.go` within the
[Camino Messenger Bot repository](https://github.com/chain4travel/camino-messenger-bot).

:::note

Please note that the Partner Plugin is fundamentally a mockup designed solely
for responding to incoming messages with mock data.

This application is compatible with all request types outlined in the Camino
Messenger Protocol. However, **it is not mandatory for a provider plugin** to
incorporate request types that are not applicable to the partner's services.

:::

### Compiling the Partner Plugin

Before compiling the Partner Plugin, ensure you have followed the
[installation steps](installation#compiling-from-source) for the Camino Messenger Bot.

After completing the installation, execute the following command:

```sh
go build -o plugin  examples/rpc/partner-plugin/server.go
```

### Running the Partner Plugin

Execute the Partner Plugin with the following command in the shell:

```sh
PORT=50051 ./plugin
```

Ensure the port number aligns with what you've configured in the Camino
Messenger Bot configuration file.

## Java Spring Boot Implementation

An alternative implementation of the Partner Plugin is available in Java
Spring Boot. For more details, please visit the GitHub repository.

Sprint Boot Partner Plugin repository: https://github.com/chain4travel/camino-messenger-plugin-example-spring-boot
