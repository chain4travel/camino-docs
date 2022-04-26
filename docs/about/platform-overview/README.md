# Camino Platform Overview

Camino features 3 built-in blockchains: [**Exchange Chain (X-Chain)**](#exchange-chain-x-chain), [**Platform Chain (P-Chain)**](#platform-chain-p-chain), and [**Contract Chain (C-Chain**)](#contract-chain-c-chain). All 3 blockchains are validated and secured by the **Primary Network**. The Primary Network is a special subnet, and all members of all custom subnets must also be a member of the Primary Network.

![Primary network](/img/about/platform-overview/primary-network.png)

## Exchange Chain (X-Chain)

The **X-Chain** acts as a decentralized platform for creating and trading digital smart assets, a representation of a real-world resource (e.g., equity, bonds) with a set of rules that govern its behavior, like "can’t be traded until tomorrow" or "can only be sent to US citizens."

One asset traded on the X-Chain is CAM. When you issue a transaction to a blockchain on Camino, you pay a fee denominated in CAM.

The X-Chain is an instance of the Avalanche Virtual Machine (AVM). The [X-Chain API](../../build/caminogo-apis/x-chain.mdx) allows clients to create and trade assets on the X-Chain and other instances of the AVM.

This is a highly specialized and performance-optimized Chain and since it's kept at a very simple complexity level the overall network load for transactions is lower compared to other Chains. This is also part of the transaction fee computation as simple and fast operations don't put much of a load on the network.

## Platform Chain (P-Chain)

The **P-Chain** is the metadata blockchain on Camino and coordinates validators, keeps track of active subnets, and enables the creation of new subnets. The P-Chain implements the **Snowman consensus protocol**.

The [P-Chain API](../../build/caminogo-apis/p-chain.md) allows clients to create subnets, add validators to subnets, and create blockchains.

Not only coordination but also creation of validators and also delegation of stake is part of the P-Chain. Conceptually, we are in an ongoing process to change the way how stake/delegate is bound to validators, but fundamentally it still be handled on the P-Chain.

## Contract Chain (C-Chain)

The **C-Chain** allows for the creation smart contracts using the [C-Chain’s API](../../build/caminogo-apis/c-chain.md).

The C-Chain is an instance of the Ethereum Virtual Machine powered by [Camino](../../).

This chain is where probably 95% of the total load is transacted. Here the smart contracts (e.g. based on Solidity via Remix) are deployed and used by the users of the chain (mostly via apps). The addresses used on this chain are also identical in structure to what one is used to from EVM/Ethereum and, in addition, one can also connect to this chain quite easily with existing applications (such as Meta-Mask).
From the maximum flexibility and compatibility the largest negative point arises: It is _potentially_ slow in the execution of (complex) operations. In order to prevent an overload of the network by inefficient smart contracts, there are corresponding transaction fees measured by the complexity.

## Why 3 chains?

One should always use the tool that is best suited for a job. This is exactly the philosophy behind the approach of the specialized chains within Avalanche, and since Camino is build on the technical basis, this also applies to us. These chains are designed, optimized and basically considered as completely separate systems according to their purpose.
This can seem a bit overwhelming at first, but there are good reasons why these application areas should be split into different chains. And at the end of the day, it's not that complicated anymore, because you only use the Chains you really need.

The chains are to be considered completely separate from each other and the interaction between the chains is exclusively the transfer of CAM between them. Who needs to work with which chain effectively is determined by the requirement and role of the entity/person who wants to work with it:

- Validators/Delegates must work with the P-Chain.
- App developers can decide, depending on their requirements, whether integration via the X-chain would be useful in order to save on fees for many small transactions. As soon as it comes to more complex application scenarios, which requires the use of smart contracts, one ends up on the C-Chain anyway.
- App users should not notice this at all, as the apps should handle this accordingly in the background.

So, in summary and in a nutshell:

- Anyone can very easily transfer CAM between Chains in the Camino wallet.
- Network operators/validators and anyone who wants to delegate must (also) deal with the P-Chain.
- Advanced app developers have the choice to deal with the limitations but also advantages of the simple and fast X-Chain.
- All others are on the C-Chain anyway as they use the widely known and EVM compatible techniques.

## Virtual Machines

A **Virtual Machine** (VM) defines the application-level logic of a blockchain. In technical terms, it specifies the blockchain’s state, state transition function, transactions, and the API through which users can interact with the blockchain. Every blockchain on Camino is an instance of a VM.

When you write a VM, you don't need to concern yourself with lower-level logic like networking, consensus, and the structure of the blockchain. Camino does this behind the scenes so you can focus on the thing you would like to build.

Think of a VM as a blueprint for a blockchain; you can use the same VM to create many blockchains, each of which follows the same ruleset but is logically independent of other blockchains.

### Why Virtual Machines?

At first, blockchain networks had one Virtual Machine (VM) with a pre-defined, static set of functionality. This rigid, monolithic design limited what blockchain-based applications one could run on such networks.

People who wanted custom decentralized applications had to create their own, entirely new blockchain network from scratch. Doing so required a great deal of time and effort, offered limited security, and generally resulted in a bespoke, fragile blockchain that never got off the ground.

Ethereum made a step toward solving this problem with smart contracts. Developers didn’t need to worry about networking and consensus, but creating decentralized applications was still hard. The Ethereum VM has low performance and imposes restrictions on smart contract developers. Solidity and the other few languages for writing Ethereum smart contracts are unfamiliar to most programmers.

Camino VMs make it easy to define a blockchain-based decentralized application. Rather than new, limited languages like Solidity, developers can write VMs in Go (other languages will be supported in the future).

## Subnets

A **subnet**, or subnetwork, is a dynamic set of validators working together to achieve consensus on the state of a set of blockchains. Each blockchain is validated by exactly one subnet. A subnet can validate many blockchains. A node may be a member of many subnets.

A subnet manages its own membership, and it may require that its constituent validators have certain properties. This is very useful, and we explore its ramifications in more depth below:

### Compliance

Camino’s subnet architecture makes regulatory compliance manageable. As mentioned above, a subnet may require validators to meet a set of requirements.

Some examples of requirements include:

- Validators must be located in a given country
- Validators must pass a KYC/AML checks
- Validators must hold a certain license

(To be abundantly clear, the above examples are just that: examples. Not all requirements do apply to the Camino Primary Network.)

### Support for Private Blockchains

You can create a subnet where only certain pre-defined validators may join and create a private subnet where the contents of the blockchains would be visible only to those validators. This is ideal for organizations interested in keeping their information private.

### Separation of Concerns

In a heterogeneous network of blockchains, some validators will not want to validate certain blockchains because they simply have no interest in those blockchains. The subnet model allows validators to only concern themselves with blockchains that they care about. This reduces the burden on validators.

### Application-Specific Requirements

Different blockchain-based applications may require validators to have certain properties. Suppose there is an application that requires large amounts of RAM or CPU power. A Subnet could require that validators meet certain hardware requirements so that the application doesn’t suffer from low performance due to slow validators.
