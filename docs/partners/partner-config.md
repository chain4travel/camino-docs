---
sidebar_position: 2
title: Partner Configuration
description: Camino Partner Configuration
---

# Camino Partner Configuration

:::info DRAFT DOCUMENTATION NOTICE

Although we released our first production-ready version of Camino Messenger, it is still early days and we plan to add and refine functionality as long as partners begin to send and receive substantial transaction traffic. Camino Partner Configuration is thus under active development and we suggest you check back regularly for updates, as content, guidelines, and instructions may be subject to change.

:::

## Introduction

The Partner Config stores into a smart contract CM Account.

Partners create a Messenger Account through a wizard. Suppliers configure the services they offer and Distributors configure the services they want to obtain. The Messenger Bots can be registered so that Suppliers can identify the distributor requesting the services and personalize their offering. There is a matching service, where partners can easily search for suppliers offering a specific service, what message version(s) is/are supported. Suppliers can easily find Distributors that want their services and Distributors can easily find suppliers that provide the required services.

In detail:

- Supported Services (full package name including the version, rack-rate flag, fee, capabilities) -- for suppliers to specify which services they support, whether they have a rack-rate or public rate that any Camino Partner can book without prior agreement, what fee they charge to respond to (search) messages and to specify particularities of their integration in capabilities.
- Wanted Services (full package name including the version) -- for distributors to specify which services they support and search for when matching with others
- Payment info (supported currencies: Off-Chain, CAM, ERC20 tokens, stable coins)
- Active Bots for identification