---
sidebar_position: 6
title: Registrar
description: The functionalities and structure of the CNS Registrar
---

# Registrar

The _Registrar_ is a contract that holds ownership of a domain or Top-Level Domain (TLD). It is designed to facilitate the sale of subdomains, allowing each _Registrar_ to define individual purchasing conditions, such as pricing, payment methods, registration duration, and other parameters.

## Functions

```solidity
// Returns if the NFT associated with a domain name is still available
Registrar.available(uint256 id) external view returns (bool);
```

```solidity
// Set the standard resolver for the TLD
Registrar.setResolver(address resolver) external;
// Withdraw funds deposited on the contract
Registrar.withdraw(address to, uint256 amount, address tokenAddress) external;
// Registers a new domain to the TLD
Registrar.register(string calldata label, address owner, address tokenAddress, uint8 numberOfYears) external;
// Renews the domain for the current domain owner
Registrar.renew(string calldata label, address tokenAddress, uint8 numberOfYears) external;
// Reclaims a domain in the Registry if the NFT is owned in the Registrar
Registrar.reclaim(string calldata label) external;
```

## Events

```solidity
// Name Registered Event
event NameRegistered(uint256 indexed id, address indexed owner, uint256 expires);
// Name Migrated Event
event NameMigrated(uint256 indexed id, address indexed owner, uint256 expires);
// Name Renewed Event
event NameRenewed(uint256 indexed id, uint256 expires);
```

# CAM Registrar

The _CAM Registrar_ is in charge of the `.cam` TLD.

Key features are:

- **`.cam` domain registration**: Allows to register domain to `.cam`.
- **n year registration period**: A domain can be registered for a minimum of one year or for n years.
- **30 days grace period**: After domain expiry the domain owner can have a 30 day during which their domain is reserved for them for renewal.
- **Payment with ERC-20 token**: Domains are paid for with `$Token`

## Pricing

The minimum price to register or renew a domain is dependent of the ERC-20 token selected for payment.
If the registration or renewal period exceeds the one year minimum by n years, the price gets adjusted by n \* `token base price`.

## Domain Names

### Register Name

Registering a domain name involves selecting an available domain and completing the registration process through the relevant Registrar.
The registration requires specifying details such as the domain name and the duration of ownership.

### Renew Name

Renewing a domain name extends the ownership period of an already registered domain.
Renewal must be completed before the expiration date, with a fee of the `selected token base price` per year.
Renewal is also possible after expiration, within the grace period defined in the _Registrar_.

## Deployments

### Camino Mainnet

`TBD`

### Columbus Test Network

`0x56EA612205686153Bc329fd16BCC5a494C153DB5`
