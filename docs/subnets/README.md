---
sidebar_position: 1
---

# Subnets Overview

A **Subnet** is a dynamic subset of Camino validators working together to achieve consensus on the state of one or more blockchains. Each blockchain is validated by exactly one Subnet. A Subnet can validate many blockchains and define its own rules regarding its membership and token economics. A validator may be a member of many Subnets.

Camino's 3 built-in blockchains: Exchange Chain (X-Chain), Platform Chain (P-Chain), and Contract Chain (C-Chain) are validated and secured by all the Camino validators which compose a special Subnet and is referred as the Primary Network.

![image](/img/subnet-validators.png)

Subnets are independent and don’t share execution thread, storage or networking with other Subnets or the Primary Network, effectively allowing the network to scale up easily while enabling lower latency, higher transactions per second (TPS), and lower transaction costs.

Subnets are effectively ‘Blockchain-as-a-Service’ secured by some portion of Camino validators.

## Advantages

A Subnet manages its own membership and can create its own rules and it may require that its constituent validators have certain properties. This is very useful, and we explore its ramifications in more depth below:

### Compliance

Camino's Subnet architecture makes regulatory compliance manageable. As mentioned above, a Subnet may require validators to meet a set of requirements.

Some examples of requirements include:

- Validators must be located in a given country
- Validators must pass a KYC/AML checks
- Validators must hold a certain license

### Support for Private Blockchains

You can create a Subnet where only certain pre-defined validators may join and create a private Subnet where the contents of the blockchains would be visible only to those validators. This is ideal for organizations interested in keeping their information private.

### Separation of Concerns

In a heterogeneous network of blockchains, some validators will not want to validate certain blockchains because they simply have no interest in those blockchains. The Subnet model allows validators to only concern themselves with blockchains that they care about. This reduces the burden on validators.

### Application-Specific Requirements

Different blockchain-based applications may require validators to have certain properties. Suppose there is an application that requires large amounts of RAM or CPU power. A Subnet could require that validators meet certain [hardware requirements](../apps/nodes/run-camino-node.md#requirements) so that the application doesn’t suffer from low performance due to slow validators.

Subnets can have their own token economy with their own native tokens and fee markets. They can launch their own blockchains with customized virtual machines. See [Customize a Subnet](https://docs.avax.network/subnets/customize-a-subnet) for more details.

## Validators

Camino validators are incentivized by Subnet owners to validate their Subnet. The incentive can be customized by each Subnet. Validators needs to take consideration of security and resource concerns before joining a Subnet.
