---
sidebar_position: 5
title: Resolver
description: The functionalities and structure of the CNS Resolver
---

# Resolver

## Name Resolution

The _Resolver_ is a crucial component in the Camino Name Service (CNS) that handles the process of mapping human-readable domain names to their corresponding resources on the blockchain.
This process is known as name resolution and is essential for translating domain names into addresses or other data types.

### Forward Resolution

Forward Resolution is the process by which a domain name is translated into its corresponding blockchain address or resource.
This involves querying the _Resolver_ associated with the domain, which returns the appropriate address or data linked to that name.

<!-- MS2: Reverse Resolution -->

## Functions

```solidity
// Returns if a wallet is authorized to be an operator for a domain
function isApproved(string[] memory domain, address operator) external view returns (bool);
// Returns the public key associated with a domain
function getPubKey(string[] memory domain) external view returns (string memory);
// Returns a C-Chain address associated with a domain
function getAddr(string[] memory domain) external view returns (address payable);
// Returns a content hash assciated with a domain
function getContentHash(string[] memory domain) external view returns (bytes memory);
```

```solidity
// Sets approval an operator for a domain (can only be called by the domain owner)
function approve(string[] memory domain, address operator, bool approved) external;
// Sets a public key associated with a domain (can only be called by the domain owner or operator)
function setPubKey(string[] memory domain, string calldata pubKey) external;
// Sets a wallet address associated with a domain (can only be called by the domain owner or operator)
function setAddr(string[] memory domain, address addr) external;
// Sets a content hash associated with a domain (can only be called by the domain owner)
function setContentHash(string[] memory domain, bytes calldata data) external;
```

## Events

```solidity
// Operator Approved Event
event OperatorApproved(bytes32 indexed node, address indexed operator, bool approved);
// Public Key Set Event
event PubKeySet(bytes32 indexed node, string pubKey);
// Address Set Event
event AddressSet(bytes32 indexed node, bytes indexed addr);
// Content Hash Set Event
event ContentHashSet(bytes32 indexed node, bytes data);
```

## Deployments

### Camino Mainnet

`TBD`

### Columbus Test Network

`0x6FD5BA2cD98D3E89E8912D7712e0C4ac9fD3fC2b`
