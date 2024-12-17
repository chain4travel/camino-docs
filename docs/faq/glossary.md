---
sidebar_position: 5
description: Frequently used terminologies
---

# Glossary

In this glossary we aim to clarify the terminologies associated with the Camino
Blockchain and the Camino Messenger, providing a comprehensive guide for both
technicians and travel professionals. We aim to define one expression, the Camino
expression to a concept that otherwise could be explained with several different
words, all closely meaning the same thing, and causing confusion.

## Acronyms

| Short   | Long                                                                        |
| ------- | --------------------------------------------------------------------------- |
| ASB     | [Application Service Bot](#application-service-bot)                         |
| CM      | [Camino Messenger](#camino-messenger)                                       |
| CMA     | [Camino Messenger Account](#camino-messenger-account)                       |
| CMB     | [Camino Messenger Bot](#camino-messenger-bot)                               |
| CMP     | [Camino Messenger Protocol](#camino-messenger-protocol)                     |
| DAC     | [Decentralized Autonomous Consortium](#decentralized-autonomous-consortium) |
| EOA     | [Externally Owned Account](#externally-owned-account)                       |
| EVM     | [Ethereum Virtual Machine](#ethereum-virtual-machine)                       |
| MSIG    | [Multi-Signature](#multisignature)                                          |
| OTA     | [Online Travel Agency](#ota)                                                |
| PK      | [Private Key](#private-key)                                                 |
| SC      | [Smart Contract](#smart-contract)                                           |
| TA      | [Travel Agency](#travel-agency)                                             |
| TO      | [Tour Operator](#tour-operator)                                             |
| TX, TXN | [Transaction](#transaction)                                                 |

## Address

In the context of blockchains, an address is a compressed and/or hashed public key
that is used as an address to receive funds or interact with the smart contracts
on-chain.

Different representations are used by different chains. X and P chains use
[CB58](https://support.avax.network/en/articles/4587395-what-is-cb58) and C-Chain
uses hex.

## Application Service Bot

Application Service Bot (ASB) is a program that runs on [Camino Messenger
Server](#camino-messenger-server) and validates the messenger fee cheques, mutes
bots that do not adhere to the rules, like issuing invalid or bounced cheques.

## Blockchain

A blockchain is a distributed ledger with growing lists of records (blocks) that are
securely linked together via cryptographic hashes. See
[Wikipedia:Blockchain](https://en.wikipedia.org/wiki/Blockchain)

## Booking Token

The digital representation of a reservation or booking for travel-related services
such as flights, hotels, tours, or other activities. This has a specific
implementation that is developed and managed by C4T.

## Builder

Partner building dApps or an integration with Camino Network.

## Camino Messenger

An efficient travel data exchange system built on Camino Network for instant
communication between suppliers and distributors.

## Camino Messenger Account

The Camino Messenger Account is a smart contract (actually an ensemble of smart
contracts), acting as the financial backbone of the [Partner
Configuration](#partner-configuration), holding the funds designated for trading on
behalf of the Partner on the Camino Messenger, and paying / receiving payment
amounts for bookings.

It also stores all configuration settings such as the services offered and wanted
(and their versions), the applicable service fees and the accepted currencies. It
also maintains a list of the wallets of the off-chain bots with which the Partner's
systems interact with the Messenger.

The Camino Messenger Account can be created from the Partner Showroom of the [Camino
Suite](https://suite.camino.network/partners) or - for development purposes on
Columbus only - by using a [cli
tool](https://github.com/chain4travel/camino-messenger-bot?tab=readme-ov-file#camino-messenger-account-cm-account)

More details can be found in our functional documentation: [Camino Partner
Showroom](/partners/partner-showroom)

## Camino Messenger Bot

A client-implementation for sending and receiving messages via the Camino Messenger.
This application acts as an abstraction layer for ease of communication even if the
underlying technology stack changes and evolves over time. It offers endpoints to
communicate with the Camino Messenger network and can actively send requests to
so-called [partner plugins](#partner-plugin).

## Camino Messenger Server

The backbone of the Camino Messenger infrastructure. Essentially, it's a server
relaying messages between bots. Currently, Matrix messenger server is used.

## Camino Messenger Protocol

Camino Messenger Protocol (CMP) was developed as the communication protocol for
Camino Messenger. It is used for (de)serializing messages between
[bots](#camino-messenger-bot) and [partner plugins](#partner-plugin)

More details can be found in our functional documentation: [Camino Messenger Protocol Documentation](/camino-messenger/introduction)

## Camino Network

Comprehensive ecosystem with a vast amount of industry partners designed
specifically for the travel industry leveraging blockchain technology

## Camino Partner

A person or a company that is building on the Camino blockchain which has become a
Validator and/or a Supporter

## Centralization

The process or result of concentrating decision-making power, authority, or
functions within a single individual, group, or location. This organizational
structure is commonly observed in governments, large corporations, and financial
institutions, where control is exercised from a central point, often leading to a
hierarchical system of management and administration.

## Centralized System

A centralized system is one in which a single entity or a small group of entities
have control over the entire system. All data, processes, and controls are managed
from a central point.

**Key Characteristics:**

1. **Single Point of Control:** One central authority manages the system.
2. **Data Centralization:** All data is stored in a central database.
3. **Ease of Management:** Centralized systems are easier to manage because there is
   a single point of control.
4. **Efficiency:** Centralized systems can be more efficient in decision-making and
   resource allocation since decisions are made by a central authority.
5. **Security Risks:** If the central point is compromised, the entire system can be
   affected.
6. **Scalability Issues:** Centralized systems can face challenges in scaling up as
   the central node can become a bottleneck.
7. **Vulnerability to Failures:** Centralized systems are vulnerable to single
   points of failure, meaning if the central node fails, the entire system can be
   disrupted.

**Examples:** Traditional banking systems, social media platforms like Facebook and
Twitter, and centralized cloud services like AWS and Google Cloud.

Comparison: Centralized Systems vs Decentralized

| Feature      | Centralized Systems                      | Decentralized                                |
| ------------ | ---------------------------------------- | -------------------------------------------- |
| Control      | Centralized authority                    | Distributed network                          |
| Data Storage | Centralized database                     | Decentralized ledger (blockchain)            |
| Security     | Vulnerable to central point attacks      | Enhanced security through decentralization   |
| Transparency | Limited, controlled by central entity    | High, with immutable and transparent records |
| User Control | Limited, controlled by central authority | High, users control their own data           |
| Scalability  | Can face bottlenecks                     | Scalable through distributed networks        |
| Innovation   | Slower, controlled by central authority  | Fast, driven by open-source and community    |

## Coin

A coin, in cryptocurrency terminology, refers to the primary or native digital asset
of a specific blockchain network. It serves as the foundational currency within that
ecosystem, often used for transaction fees, rewards, and network operations. Coins
are distinct from tokens, which are typically built on top of existing blockchain
platforms.

## Cross-Chain

A system designed to enable communication and asset transfers between different
blockchain networks, allowing for a more connected and efficient blockchain
ecosystem.

## Cryptocurrency

Cryptocurrencies are digital or virtual currencies that operate on decentralized
networks, typically using blockchain technology. Key features include:

1. Decentralization: No central authority controls or regulates them.
2. Cryptography: Used to secure transactions and control the creation of new units.
3. Digital nature: Exist only in electronic form, with no physical counterparts.
4. Peer-to-peer transactions: Allow direct transfers between users without intermediaries.
5. Limited supply: Many have a cap on total units to maintain value.
6. Pseudonymity: Users can operate with a degree of anonymity.

## Customer

End consumer buying a travel product or service. The customer might travel alone or
with other [travellers](#traveller). It is also common that the customer is a person
or entity not traveling, like for example the secretary or company buying a ticket
for a business trip. Or a travel agency buying a ticket for a family holiday trip

## DApp (Decentralized Application)

A DApp is a software application that operates on a distributed computing system,
typically a blockchain network. Key characteristics include:

1. Decentralization: Runs on a peer-to-peer network of computers rather than a
   single centralized server.
2. Open-source: Usually has its entire codebase available for scrutiny.
3. Blockchain integration: Utilizes a blockchain for data storage and smart contract
   execution.
4. Cryptographic tokens: Often uses cryptocurrency tokens for access or
   functionality.
5. Consensus mechanism: Relies on network consensus to validate operations.
6. Autonomy: Can operate without human intervention, guided by smart contracts.

DApps aim to enhance transparency, reduce single points of failure, and minimize
censorship risks compared to traditional centralized applications.

## Decentralized

A system organization or process where control, decision-making and functions are
distributed across multiple points, rather than being centralized in a single
central authority or system

## Decentralized Autonomous Consortium

Consortium in which all members participate in decision-making because there is no
central governing body and whose members share a common goal of acting in the best
interest of the Consortium. The Camino Consortium is a heterogeneous group of
companies that might disagree or have different approaches in minor or major
matters. Camino offers tools to solve disputes and reach a consensus on general
topics.

## Deposit

The act of transferring cryptocurrency or tokens from a personal wallet to a smart
contract, exchange, or other platforms for various purposes such as staking,
lending, or trading.

## Digital Asset

A digital asset is any content or item of value that exists in a digital form and
can be owned or controlled. It often has a relation to an asset in the real world.

## Digital Asset ID

A "Digital Asset ID" is a unique identifier for digital items like cryptocurrencies,
digital art, or tokens. This ID ensures the item's authenticity, tracks ownership,
and prevents fraud.

For example:

- **NFTs:** Each token has a unique ID on the blockchain, making every digital art
  or collectible distinct.
- **Concert tickets or loyalty points:** Each token has a unique code, ensuring
  authenticity and easy tracking.
- **ERC-20 tokens:** Each type of token has a unique contract identifier on the
  Ethereum blockchain, ensuring proper tracking and management.

## Digital Signature

**Digital Signature** is a cryptographic mechanism used in blockchain networks to:

1. Authenticate the sender of a message or transaction
2. Ensure the integrity of the message or transaction data
3. Provide non-repudiation

The digital signing process involves:

1. The sender signs a payload (data or transaction details) using their private key
2. The signature is sent along with the original payload
3. The receiver can:
   - Verify that the payload is unchanged
   - Extract the public key from the signature to identify the signer
   - Confirm the authenticity of the signature without prior knowledge of the public key

In blockchain contexts, this is often used for "unsigned transactions", which contains:

- The intended action (what shall be done)
- The digital signature

The signature verifies that the transaction is as intended by the sender and
identifies the sender, allowing the network to execute the transaction in the
context of the sender's account.

## Dispute

Disagreement between parties involving differing interpretations, claims or views
regarding a transaction or a series of transactions.

## Distributor

An entity in [Camino Network](#camino-network) engaged in the distribution of
travel products or services from suppliers.

## Encryption

Encoding information to make it unreadable without the appropriate decryption
key(s).

## ERC-20 Token

**ERC-20** represents a standard for fungible tokens on Ethereum. Contracts that
represent an ERC-20 token must implement specified functionality that allows for
uniform usage/behavior of these tokens. For more info: [ERC-20 Token
Standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-20/)

## ERC-721 Token

**ERC-721** represents a standard for non-fungible tokens (NFTs) on Ethereum.
Contracts that represent an ERC-721 token must implement specified functionality
that allows for uniform usage/behavior of these tokens. For more info: [ERC-721
Token Standard](https://ethereum.org/en/developers/docs/standards/tokens/erc-721/)

## Ethereum Virtual Machine

The Ethereum Virtual Machine (EVM) is a global computer network that runs smart
contracts on the Ethereum blockchain. It allows developers to create decentralized
applications ([dApps](#dapp-decentralized-application)) that automatically enforce
rules and agreements, ensuring transactions are secure without needing a middleman.

Camino Network's C-Chain is fully compatible with EVM, meaning code written for
Ethereum can run on the C-Chain.

## Externally Owned Account

Externally owned account (EOA), is a regular address that has a [private
key](#private-key). In EVM based chains, an address may be a smart contract, which
is not an EOA because it doesn't have a private key, meaning smart contracts can not
sign things. You need a private key to sign things, hence the distinction between
accounts.

## Fiat Currency

Fiat currency is a government-issued currency that is not backed by a physical
commodity like gold or silver. Examples of fiat currencies include the US Dollar,
Canadian Dollar, and Euro. The value of fiat currency is derived from the trust and
confidence that people have in the government that issues it.

## Fungible

**Fungible** refers to the ability to replace or to be replaced by another identical
item. ERC-20 tokens are fungible tokens.

## Gas

Gas is the unit of measure for the amount of computational work required to process
transactions or execute smart contracts on a blockchain network. On Camino Network
it is used for EVM compatible C-Chain.

## Gas Fee

_(Also known as transaction fee)_

A gas fee is a small payment made to compensate for the computational power required
to process and validate transactions or execute smart contracts on a blockchain
network.

Gas fee (or transaction fee) is calculated by multiplying consumed gas by the
transaction and the [gas price](#gas-price).

## Gas Price

Gas price is the amount of cryptocurrency you are willing to pay per unit of gas to
incentivize miners to process your transaction or execute your smart contract on a
blockchain network.

On Camino Network gas price is fixed to 200 nCAM.

## gRPC

Open-source remote procedure call (RPC) framework developed by Google. In Camino
Messenger, bots and partner plugins communicate using gRPC services.

## Message Type

In the context of Camino Messenger, this describes a specific protocol definition
for a set of travel products or services. In general, it is a Protobuf message type
definition.

## Mint

Generally speaking, minting is the creation of a token or coin. Like creation of
Bitcoin as miner rewards every block or creation of NFTs on any blockchain.

In the context of the [Camino Messenger](#camino-messenger) and [Booking
token](#booking-token) it describes the process between supplier and distributor in
which a travel product or service is purchased by creating (minting) a booking token
and the act of transferring (buying) it by the distributor.

## Mining

The process of validating transactions and adding new blocks to a blockchain,
often involving solving complex mathematical problems.

## Multisignature

_(also called multisig)_

A concept of allowing the transaction to require to have one or more signatures
before it can be executed. Multisig provides more security than single-signature
transactions.

## NDC

New Distribution Capability. NDC is a set of XML-based data transmission standards
developed by the International Air Transport Association (IATA) to modernize and
standardize the way airline products and services are distributed and sold.

NDC aims to enable airlines to deliver richer and more personalized content and
offers to travelers

## Node

A computer that connects to a blockchain network and participates in the network
by relaying transactions and maintaining a copy of the blockchain.

## Non-Fungible

**Non-Fungible** refers to something that is unique and cannot be replaced.
Non-Fungible tokens (NFTs) are unique tokens that cannot be interchanged and all
have their own unique id.

## Off chain data

Not all data and transactions need to be stored directly on the blockchain itself.
Off-chain data can be stored, processed, and managed using alternative methods or
networks with only necessary information being recorded on the blockchain reducing
transaction cost.

## On chain data

Data that is recorded and stored directly on a blockchain network via transactions.

A general rule is that the more complex the transaction or the bigger the data the
higher the transaction fee and the slower the transaction.

## On-Ramp

An On-Ramp allows users to purchase cryptocurrencies using fiat money, typically
through exchanges where users deposit fiat currency into their exchange account and
use those funds to buy cryptocurrencies.

## Off-Ramp

An Off-Ramp enables users to sell their cryptocurrencies on an exchange, converting
the cryptocurrency to fiat money, and then withdrawing those funds to a bank
account.

## Onboarding

The process of introducing and integrating a new product into a company's offerings
and ensuring that customers understand how to use and benefit from the product or
service.

## OTA

Online Travel Agency. OTAs are online platforms or websites that allow consumers
planning and booking various travel-related services and products, often offering a
wide range of options and choices from different suppliers.

## Partner Configuration

The Partner Configuration allows Partners to make themselves known to the Camino
Network as service providers, or as looking for services from other Partners in the
Network. Upon matching between services wanted and offered by two parties, such
services will be then traded on Camino Messenger.

More details can be found in our functional documentation: [Camino Partner
Configuration](/partners/partner-config)

## Partner Plugin

The Partner Plugin serves as a bridge, enabling the Camino Messenger Bot to integrate
with the Partner distribution or inventory system.

This is developed by the suppliers to link their inventory systems with the Camino
Messenger Bot.

More details can be found in our functional documentation: [Camino Messenger Bot
Partner Plugin](/camino-messenger/bot/partner-plugin)

## PAX

Abbreviation of "persons approximate". Used to give a count of persons or referring
to a single person/[Traveller](#traveller).

## Point of Interest

Point of Interest (POI) refer to specific locations or attractions that are of
interest to travelers like landmarks, tourist attractions, historical sites, natural
wonders, parks, museums, restaurants, shopping centers, etc.

## Protobuf

Protocol Buffers (protobuf) is a platform-neutral, language-neutral and extensible
mechanism developed by Google for serializing structured data.

It is used by Camino Messenger Protocol.

## Private Key

A private key in the context of cryptocurrency is a confidential, unique,
alphanumeric code that enables the holder to access and manage their digital assets.
It functions as a password, allowing the owner to sign (authorize) transactions and
prove ownership of the associated wallet address (EOA). A private key must be kept
secure and confidential.

## Protocol

Definition of the methods and data formats that allow transmitting data between
systems. In the context of Camino, it refers to the [Camino Messenger
Protocol](#camino-messenger-protocol).

## Provider

Synonym for [Supplier](#supplier). Only "supplier" shall be used

## Public Key

A blockchain account's **public key** is derived from its [private
key](#private-key) and is used to generate the account's identifier, known as an
"address". The public key is extractable from signatures and can be used as an
identifier and to encrypt data, which can only be decrypted by the corresponding
private key. Nodes on the network can verify that transactions were properly signed
using the associated private key by checking them against the account's public key.

## Search

Process that occurs when a customer looks for travel-related products or services
such as flights, hotels, car rentals or vacation packages

## Seed Phrase

_(also mnemonic key phrase, mnemonic seed phrase, or mnemonic)_

Serves as a human-readable representation of an associated cryptographic key or
seed. In the case of Camino Network, key phrases consist of a specific sequence
of 24 words, carefully selected from a predefined word list.

The purpose of a key phrase is to simplify the process of backing up, storing, and
recovering cryptographic keys. It offers a user-friendly and easily understandable
approach to interact with and secure cryptographic systems. This accessibility
empowers individuals to effectively manage their keys and retain control over their
digital assets.

## Settlement

Transfer of proof of ownership from the seller to the buyer and the corresponding
transfer of funds from the buyer to the seller

## Smart Contract

A smart contract is a self-executing digital agreement with the terms directly
written into code, which automatically enforces and executes actions on a blockchain
when predefined conditions are met. See: [Wikipedia:Smart
Contract](https://en.wikipedia.org/wiki/Smart_contract)

## Stable coin

Cryptocurrency designed to maintain a stable value relative to a specific fiat
currency like EUR, GBP or USD

## Submessage

A Protobuf message type that can be used in multiple message types. These are used
heavily in the [CMP](#camino-messenger-protocol)

## Supplier

An entity in Camino Network engaged in the supply of travel products or services
to distributors or customers

## Supporter

Partner supporting Camino Network initiative but not (yet) undertaking concrete
action like a builder or a validator

## Transaction

A transaction in blockchains is a secure, verified, and transparent transfer of
digital assets or information, including interactions with [smart
contracts](#smart-contract), recorded on a decentralized digital ledger.

## Travel Agency

Travel Agencies (TAs) are businesses that specialize in providing
travel-related services and products to individuals groups and organizations.

Unlike online travel agencies (OTAs) which operate primarily through digital
platforms traditional travel agencies may have physical storefronts where customers
can visit in person to plan and book their trips.

## (Travel) Entity

Widely used term in Camino Network which describes a travel related entity
acting on the network. This term has been established as there can be different
types of entities like persons, companies or persons acting on behalf of a company.

## Token

A **token** is a digital asset that exists on a blockchain network and is created
and managed by a smart contract.

## Tour Operator

A company or individual that organizes and arranges travel-related products and
service.

Tour Operators (TO) typically package together various components of a trip such as
transportation accommodation activities and guided tours to provide comprehensive
travel experiences to their customers.

## Traveller

Person participating in a trip.

## Trip

Journey or expedition from one place to another often involving a method of
transportation and overnight stay(s).

## UUID

Universally Unique Identifier, a 128-bit identifier standardized by the Open
Software Foundation (OSF) as part of the Distributed Computing Environment (DCE)
specification and subsequently adopted by the Internet Engineering Task Force
(IETF). UUIDs are designed to be globally unique across space and time.

## Validate

In the context of Camino Messenger, the process of checking whether a product or
service is still bookable at the price advertised in the search results. As these
are often provided from cached data and might have sold-out after a certain amount
of time has passed.

This is a prerequisite for the [Mint](#mint) workflow.

## Validator

Partner responsible for verifying and validating transactions and maintaining the
integrity of the blockchain.

Also, depending on the context it refers to the node (physical server) of the
Partner that runs the Camino Node application.

## Vertical

_(also Travel Vertical)_

Similar to the term "Business Vertical" which describes a specific industry or
market that focuses on a particular niche, travel verticals describe specific fields
in the travel industry which can be seen isolated but have also certain overlaps
with other verticals.

## Wallet

Unlike a physical wallet which holds physical assets, in the blockchain space a
wallet is just an application to be able to interact with the address on the
blockchain which holds the assets.

Using a [seed phrase](#seed-phrase) or [private key](#private-key), one is able to
locally create and sign transactions for a particular address or set of addresses
before it is sent to a blockchain to be executed.

Usually a wallet also has some convenience functionality to see the tokens (funds,
digital assets, collections) in possession and interact with them.
