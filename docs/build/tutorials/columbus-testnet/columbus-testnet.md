---
sidebar_position: 1
description: All about the columbus testnet, how to participate and what to expect.
---

# About columbus

The columbus testnet is a full-fledged ready-to-use platform to both learn how to participate in the network and to develop and test on-chain applications.

## What to expect

The Columbus testnet is undergoing constant improvement and despite the fact that the development is always striving to have a working network at all time it's highly unlikely but in extreme cases it can happen that the testnet must be build up from scratch. So please be aware of the fact that everything on the testnet can be reset at any given time and no productive environment is dependend on the state of the network.

## On-Chain Development

For on-chain development like deploying and testing solidity-based smart-contracts all you need is a RPC/HTTP endpoint to the columbus network. Our main HTTP/RPC node is reachable via the URL <https://columbus.camino.foundation>. By default you don't need to specify a port as the HTTPS port `443`, aswell as the default port of the node `9650` are both routed to our HTTP-Enabled columbus testnet node.

## Metamask configuration

For a [metamask](https://metamask.io/) configuration simply choose a network name, use the RPC-URL <https://columbus.camino.foundation/ext/bc/C/rpc>, Chain-ID `502`, Currency-Symbol `CAM` and the Block-Explorer URL <https://explorer.camino.foundation>.

## Funds on columbus

As this network is only for testing purposes the tokens (CAM) needed to test can not be bought via a bridge or exchange. In fact tokens can only be requested for free using our `Camino` Discord bot.

### Columbus faucet Discord bot

You'll need CAM tokens to start testing on columbus. To request them please join our [Discord](https://discord.gg/K5THjAweFB) and use the `/faucet <X-Address> <Amount>` command.

Requesting tokens from the `Camino` Discord bot is both limited in amount per request and per time. The current limits are provided with the help text Discord automatically displays when using the command.

#### X-Address to receive tokens

To be able to receive tokens via the faucet you'll need a valid X-Chain address for the Columbus network. There are multiple ways to create a X-Address where the easiest would be to simply create a wallet in our [Camino Wallet](https://wallet.camino.foundation). Please keep in mind to double-check that the Columbus network is selected in the top-right.

Another way to create a new X-Address would be to directly use the [X-Chain JSON API](../../caminogo-apis/x-chain.mdx) which is now recommended for normal users or as long as you're not planning to fully use the API without any user-interaction.

#### But I need more tokens

Don't panic!

As the tokens are provided for free we are sure you will understand that we have to restrict the number of tokens a user can request in a specific time frame to prevent that someone can run the faucet dry and claim a huge amount of tokens leaving everyone else without the chance to test properly. If you for some reason need more tokens please contact us in the support channel on the [Discord](https://discord.gg/K5THjAweFB) server.

## Running a RPC/HTTP node

To setup a node which acts as a RPC/HTTP node simply follow the tutorial on [How to set up a node with docker](../nodes-and-staking/set-up-node-with-docker.md).

## Running a validator node

We're always happy to welcome more partners, which also want to provide more network security by running validator nodes. At the moment the process of becoming a validator is Proof-Of-Stake based, therefore you'll need a minimum amount of `2000 CAM` on the P-Chain to register your node as a validator within the [wallet](https://wallet.camino.foundation). Please contact us in the support channel on the [Discord](https://discord.gg/K5THjAweFB) server to receive the tokens necessary to reach the minimum stake amount.

Running a validator node is as simple as running a RPC/HTTP node. As a matter of fact all nodes can become validator nodes but we strongly recommend to not expose any API of a node which acts as a validator, except the staking API running on port `9651` used by the nodes to communicate with each other.

## What next?

That's it, you're now familiar with the Columbus testnet and can at any time start to develop on-chain or participate in the network! Congratulations! Let us know you did it on our [Twitter](https://twitter.com/CaminoFndtn) or [Discord](https://discord.gg/K5THjAweFB)!

If you have any questions, or need help, feel free to contact us on our [Discord](https://discord.gg/K5THjAweFB) server.
