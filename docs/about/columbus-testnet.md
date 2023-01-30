---
sidebar_position: 3
description: All about the Columbus testnet, how to participate and what to expect.
---

# Columbus Test Network

The Columbus testnet is a full-fledged ready-to-use platform to both learn how to participate in the network and to develop and test on-chain applications.

## What to expect

The Columbus testnet is undergoing constant improvement and despite the fact that the development is always striving to have a working network at all time it's highly unlikely but in extreme cases it can happen that the testnet must be built up from scratch. So please be aware of the fact that everything on the testnet can be reset at any given time and no productive environment is dependent on the state of the network.

## On-Chain Development

For on-chain development like deploying and testing solidity-based smart-contracts all you need is a RPC/HTTP endpoint to the Columbus network. Our main HTTP/RPC node is reachable via the URL <https://columbus.camino.foundation>. By default you don't need to specify a port as the HTTPS port `443`, as well as the default port of the node `9650` are both routed to our HTTP-Enabled Columbus testnet node.

## Metamask configuration

The information on setting up Camino Network with MetaMask and RPC Endpoints can be found in the guide [MetaMask & RPC Endpoints](/guides/metamask-rpc-endpoints).

:::tip CAMINO ON CHAINLIST.ORG

Camino Network is on ChainList.org. You can automatically add Camino networks to MetaMask, please visit the links below:

- [**Camino Mainnet** on ChainList.org](https://chainlist.org/?search=camino&testnets=false)
- [**Columbus Testnet** on ChainList.org](https://chainlist.org/?search=columbus&testnets=true)

:::

## Funds on Columbus

As this network is only for testing purposes the tokens (CAM) needed to test can not be bought via a bridge or exchange. In fact tokens can only be requested for free using our `Camino` Discord bot.

### Columbus faucet Discord bot

You'll need tokens (CAM) to start testing on Columbus. To request them please join our [Discord](https://discord.gg/camino) and use the `/faucet <X-Address> <Amount>` command.

Requesting tokens from the `Camino` Discord bot is both limited in amount per request and per time. The current limits are provided with the help text Discord automatically displays when using the command.

#### X-Address to receive tokens

To be able to receive tokens via the faucet you'll need a valid X-Chain address for the Columbus network. There are multiple ways to create a X-Address where the easiest would be to simply create a wallet in the [Camino Wallet](https://wallet.camino.foundation). Please keep in mind to double-check that the Columbus network is selected in the top-right.

Another way to create a new X-Address would be to directly use the [X-Chain JSON API](../developer/apis/camino-node-apis/x-chain.mdx) which is now recommended for normal users or as long as you're not planning to fully use the API without any user-interaction.

#### But I need more tokens

Don't panic!

As the tokens are provided for free we are sure you'll understand, that we have to restrict the number of tokens a user can request in a specific time frame, to prevent that someone can run the faucet dry and claim a huge amount of tokens leaving everyone else without the chance to test properly. If you for some reason need more tokens, please contact us in the support channel on the [Discord](https://discord.gg/camino) server.

### But I need the tokens on the C-Chain

When receiving tokens via the Discord bot they'll always be sent to the X-Address provided in the `/faucet` command. To transfer tokens between the X- and C-Chain, just login into the [Camino Wallet](https://wallet.camino.foundation) and transfer the tokens with the `Cross Chain` function.

## Running a RPC/HTTP node

To setup a node which acts as a RPC/HTTP node, simply follow the tutorial on [How to set up a node with docker](/nodes/set-up-node-with-docker.md).

## Running a validator node

We're always happy to welcome more partners who want to provide more network security by running validator nodes. At the moment the process of becoming a validator is Proof-Of-Stake based, therefore you'll need a minimum amount of `2000 CAM` on the P-Chain to register your node as a validator within the [wallet](https://wallet.camino.foundation). Please contact us in the support channel on the [Discord](https://discord.gg/camino) server to receive the tokens necessary to reach the minimum stake amount.

Running a validator node is as simple as running a RPC/HTTP node. As a matter of fact all nodes can become validator nodes, but we strongly recommend not to expose any API of a node which acts as a validator, except for the staking API running on port `9651`, used by the nodes to communicate with each other.

## What next?

That's it, you're now familiar with the Columbus testnet, and can at any time start to develop on-chain or participate in the network! Congratulations! Let us know you did it on our [Twitter](https://twitter.com/caminonetwork) or [Discord](https://discord.gg/camino)!

If you have any questions, or need help, feel free to contact us on our [Discord](https://discord.gg/camino) server.
