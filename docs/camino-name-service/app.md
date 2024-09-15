---
sidebar_position: 2
title: CNS Manager App
description: How to use the CNS Manager App
---

# CNS App

The CNS App in the Camino Suite can be used to search, register and manage your domains.

## How to register a domain?

1. Login to your Camino Account. 
    - Make sure you have enough CAM and ERC-20 tokens to purchase your domain.
2. Navigate to the CNS App in the Camino Suite.
3. Look up your domain.
4. If your domain is still available for purchase, click `Register`.
5. Select the amount of years you want to register your domain for.
6. Select the ERC-20 token you want to purchase the domain with.
7. Click `Register` again to purchase your domain.
8. In a matter of a few seconds you'll be notified if your purchase went through.

## Manage your domains

In `My Domains` you can find a list of all domains connected to your account.
There are three classifications of access:

#### Owner
The wallet associated with the domain in the CNS Registry. The **owner** has full controll over the domain and its subdomains.

#### Operator
A wallet can appoint (multiple) operators which essentially have the same access rights as the **owner**.

**!!An operator has access rights to ALL domains owned by a wallet. Operators are associated to wallets, not specific domains!!**

#### Manager
This is a *Resolver* specific role. A **manager** has the ability to set data in the name of the owner on the *Resolver*.

### Domain Settings
Selecting a domain you find a menu with multiple options.

#### Subdomains (Owner/Operator)
All of the subdomains (which are still owned by the account) are listed here. Additionally you can register new subdomains.
Registering a subdomain only costs you the transaction fees of the Camino Network.

These subdomains are (almost) full-fledged domains and can be selected and managed just like their parents.

Subdomains inherit the Resolver address from their parent domain.

#### Resolver (Owner/Manager)
Here you can view and set the information stored in the Resolver contract associated with the domain.
You can also set a new Resolver address.

##### Resolver Address
Address of the Resolver associated with your domain.

##### C-Chain Address
Any C-Chain address you want to associate with your domain.

##### X-Chain Address
Any X-Chain address you want to associate with your domain.

##### P-Chain Address
Any P-Chain address you want to associate with your domain.

##### Public Key
The public key of a wallet (can also be the public key of a multi-sig wallet) you want to associate with your domain.
The public key can be used to derive C-,X-, and P-Chain addresses.

##### Content Hash
A cryptographic fingerprint of data that ensures its integrity and allows decentralized storage systems like IPFS to retrieve the exact same data by referencing its unique hash.

#### Expiration (Owner/Operator)
Shows you when your domain will expire in the Registrar. 
As soon as a domain expires (and the `grace period` is over) you loose access rights to it and the CNS Resolver stops returning data.
After the domain expiration anyone can claim your domain again.

For the domain you have the option to add additional time (in increment of years) to your domain's expiration date. 
The process is similar to the `domain registration`.
1. Select the number of years you want to extend your domain registration for.
2. Select an approved ERC-20 token of which your wallet has sufficient funds.
3. Click `Renew` to finish the purchase.

This does not work for the subdomains.

#### Roles (Owner)
Here you can add or remove **Operators** and **Managers**.

#### Settings (Owner/Operator)

##### TTL (in ms)
This tells an off-chain client how often they need to query information associated with a domain.

##### Owner
This is the **owner** of the domain in the Registry. **Updating this means transfering the domain.**

- As long as the NFT in the Registrar is not transfered as well you can always `reclaim` the domain with help of the Registrar. Even if you transfered the ownership in the Registry.
- Transfering the NFT automatically resets the domain owner as well.