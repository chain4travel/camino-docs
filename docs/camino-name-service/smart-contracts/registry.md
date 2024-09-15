---
sidebar_position: 4
title: Registry
description: The functionalities and structure of the CNS Registry
---

# CNS Registry

Its main functionalities include:

- **Domain Ownership and Delegation:** It records domain ownership and allows owners to delegate control to others or smart contracts.
- **Name Resolution:** It links each domain to a Resolver, which resolves the domain to addresses, content hashes, or other resources.
- **Hierarchical Structure:** It supports a hierarchical domain structure, enabling domain owners to create an unlimited number of subdomains.

## Structure

Given the hierarchical structure of CNS the parent domain always has authority over its children.

The **root** is the starting point of CNS and responsible for controlling Top-Level Domains (TLDs).

TLDs, like `.cam`, are managed (and owned) by [Registrar](./registrar.md) contracts. Domains, like `travel.cam`, can be purchased with the _Registrar_. The purchasing conditions (price finding, payment type, registration time, etc.) can be set by each _Registrar_ individually.

The owner of a domain, like `travel.cam` has the ability to register multiple subdomains, like `booking.travel.cam` by directly interacting with the _CNS Registry_.

Optionally the owner could also deploy their own _Registrar_ for their domain and sell subdomains.

An example use case could be setting up a _Registrar_ contract for `ticket.travel.cam` on the Camino Netowrks' C-Chain and enabling customers to purchase tickets in form of sub-domains, e.g. `1.ticket.travel.cam`. These tickets could then be used to identify a customer and optionally could be populated with the necessary metadata for additional travel information.

## Deployments

### Camino Mainnet

`TBD`

### Columbus Test Network

`0xDc2BaEbA55f2Ba55c01a155003c432Bb871d4f75`

## Functions

```solidity
// Returns owner of a domain
CNS.getOwner(string[] memory domain) external view returns (address);
// Returns resolver set for domain
CNS.getResolver(string[] memory domain) external view returns (address);
// Returns time-to-live for off-chain clients to know how long they should cache domain-information
CNS.getTTL(string[] memory domain) external view returns (uint64);
// Returns if a domain exists in the CNS
CNS.recordExists(string[] memory domain) external view returns (bool);
// Returns if a wallet is approved as an operator by a domain owner
CNS.isApprovalForAll(address owner, address operator) external view returns (bool);
```

```solidity
// Set owner, resolver and ttl for a node (only callable by current owner or approved operator)
CNS.setRecord(string[] memory domain, address owner, address resolver, uint64 ttl) external;
// Set owner, resolver and ttl for a subnode (only callable by current owner or approved operator of the parent node)
CNS.setSubnodeRecord(string[] memory domain, bytes32 label, address owner, address resolver, uint64 ttl) external;
// Set owner of a subnode (only callable by current owner or approved operator of the parent node)
CNS.setSubnodeOwner(string[] memory domain, bytes32 label, address owner) external returns (bytes32);
// Set resolver of a node (only callable by current owner or approved operator of the node)
CNS.setResolver(string[] memory domain, address resolver) external;
// Set owner of a node (only callable by current owner or approved operator of the node)
CNS.setOwner(string[] memory domain, address owner) external;
// Set ttl of a node (only callable by current owner or approved operator of the node)
CNS.setTTL(string[] memory domain, uint64 ttl) external;
// Authorize an operator for all nodes owned by the message caller
CNS.setApprovalForAll(address operator, bool approved) external;
```

## Events

```solidity
// New Owner Event
event NewOwner(bytes32 indexed parent, string label, address owner);
// Transfer Event
event Transfer(bytes32 indexed node, address owner);
// New Resolver Event
event NewResolver(bytes32 indexed node, address resolver);
// New TTL Event
event NewTTL(bytes32 indexed node, uint64 ttl);
// New Approval For All Event
event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
```
