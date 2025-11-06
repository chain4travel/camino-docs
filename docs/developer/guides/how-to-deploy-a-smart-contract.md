---
sidebar_position: 10
title: How to Deploy a Smart Contract
description: This guide explains the process of deploying a Smart Contract on the C-Chain using Remix IDE.
---

# How to Deploy a Smart Contract

This guide provides instructions on deploying a sample ERC20 smart contract on the Columbus test network.

:::tip ALTERNATIVE METHOD:

## Camino Builder: Your Gateway to Smart Contract Development

The [Camino Builder repository](https://github.com/chain4travel/camino-builder) is
your comprehensive guide to developing smart contracts on Camino Network's C-Chain.
Perfect for both beginners and experienced developers, it offers:

- **Step-by-Step Tutorials** for creating NFTs, token-gated access, KYC-compliant
  contracts, tokens, and staking systems
- **Ready-to-Use Project Template** with pre-configured Hardhat setup
- **Security Best Practices** and challenge exercises
- **Testing Frameworks** and guides for writing robust tests
- **Detailed Theory Sections** to understand the underlying concepts
- **Front-end Integration** guides to build complete dApps

Whether you're building the next travel industry innovation or learning blockchain
development, Camino Builder provides all the tools and knowledge you need to get
started.

Repository: [https://github.com/chain4travel/camino-builder](https://github.com/chain4travel/camino-builder)

Get support on [Discord #tech-support](https://discord.com/channels/949247897688494150/959050296263323668) channel!

:::

## Requirements

- **KYC-verified wallet:** Only KYC-verified accounts are allowed to deploy smart contracts on the Camino Network.
- **Funds in C-Chain Address:** Ensure that you have CAM tokens in your C-Chain address. You can acquire some tokens through the faucet on the Discord channel.
- **MetaMask Wallet:** Configure your MetaMask wallet to connect with the Columbus network and your account.

## Overview

1. Create a wallet.
1. Complete the KYC verification process.
1. Request funds from the Discord faucet.
1. Perform a cross-chain transfer between the X-Chain and C-Chain.
1. Add your account and the Columbus network to the MetaMask wallet.
1. Access the Remix IDE & Import a sample ERC20 contract.
1. Compile the contract.
1. Provide the necessary details and deploy the contract.
1. Add your newly created token to MetaMask and the Camino Wallet.

## 1. Create a Wallet

To create a Camino Wallet, please follow the instructions provided in the
[How to Create a Wallet](/guides/how-to-create-a-wallet) documentation page.

If you already have a wallet, you can proceed to the next step.

## 2. KYC Verification

Ensure that your account is KYC-verified. To complete the KYC verification process,
refer to the [KYC Verification](/guides/kyc) documentation page.

If your account is already KYC-verified, you can skip this step.

## 3. Request Funds from the Discord Faucet

To request funds from the Discord faucet, visit the [**Camino Discord server**](https://discord.gg/camino)
and the steps explained in [Columbus Faucet Discord Bot](../../about/columbus-testnet.md#columbus-faucet-discord-bot).

## 4. Add Your Account and the Columbus Network to the MetaMask Wallet

To add your account and the Columbus Network to your MetaMask wallet, please follow the instructions
provided in the [MetaMask & RPC Endpoints](/guides/metamask-rpc-endpoints) documentation page.

## 5. Access the Remix IDE & Import a Sample ERC20 Contract

Go to the [Remix IDE](https://remix.ethereum.org/):

On the Remix IDE page, locate and click on the "OXPROJECT ERC20" to import the sample ERC20 contract.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/7-deploy-sc-access-remix.png"/>
<figcaption align="center"><b>Fig.7:</b> Remix IDE</figcaption>
</figure>

## 6. Compile the Contract

After importing the necessary files into your workspace, select the "SampleERC20.sol" file.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/8-deploy-sc-selected.png"/>
<figcaption align="center"><b>Fig.8:</b> Import Files</figcaption>
</figure>

- To compile your contract, navigate to the "Solidity Compiler" tab in the Remix IDE.
- Choose the appropriate compiler version. In this case, select v0.5.17.
- Click on the drop down menu "Advanced Configurations" and select "paris" as EVM version.
- Click on the "Compile SampleERC20.sol" button to initiate the compilation process.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/9-deploy-sc-compiled.png"/>
<figcaption align="center"><b>Fig.9:</b> Contract Compiled</figcaption>
</figure>

:::caution DON'T FORGET TO SET EVM VERSION TO "PARIS"

Please choose the EVM version "paris" from Advanced Configurations section.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/19-select-evm-version.png#center"/>
<figcaption align="center">Choose "paris" as the EVM version</figcaption>
</figure>

:::

## 7. Provide the Necessary Details and Deploy the Contract

- Choose "Injected Provider - MetaMask" from the Environment dropdown menu.
- Click on the arrow on the right side of the "Deploy" button to expand the menu.
- Enter your desired values for NAME, SYMBOL, DECIMALS, and TOTALSUPPLY.
  In the example provided below, we used `9` decimals and `1000000000000000` to mint 1 million tokens.
- Once you have filled in the required details, click on the "transact" button to proceed.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/10-deploy-sc-transact.png"/>
<figcaption align="center"><b>Fig.10:</b> Fill in the details and deploy</figcaption>
</figure>

- Once your contract is deployed, click on the contract to expand the menu located at the bottom left-hand side.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/11-deploy-sc-deployed.png"/>
<figcaption align="center"><b>Fig.11:</b> Click on the deployed contract</figcaption>
</figure>

- Copy and save the contract address. To do this, click on the copy button positioned on the right side of the contract,
  under the deployed contracts section. This contract address will be required when adding your token to wallets.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/12-deploy-sc-address.png"/>
<figcaption align="center"><b>Fig.12:</b> Copy the contract address</figcaption>
</figure>

## 8. Add Your Newly Created Token to MetaMask and the Camino Wallet

Congratulations, you have your own token! Let's add your token to MetaMask and Camino Wallet.

### Add Your Token to the Camino Wallet

- Open your wallet and navigate to the Portfolio page.
- Locate & click the "Add Token" button at the bottom of the Assets section.
- Paste the contract address into the "Token Contract Address" field.
- Click on "Add Token" to proceed.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/13-deploy-sc-add-camino-wallet.png"/>
<figcaption align="center"><b>Fig.13:</b> Add your token to Camino Wallet</figcaption>
</figure>

- Your token will be successfully added to your wallet. Now, you can send it to your friends. :)

<figure>
<img class="zoom" src="/img/deploy-smart-contract/14-deploy-sc-cw-balance.png"/>
<figcaption align="center"><b>Fig.14:</b> Enjoy your new token!</figcaption>
</figure>

### Add Your Token to the MetaMask Wallet

- At the bottom of the window, click on "Import tokens."

<figure>
<img class="zoom" src="/img/deploy-smart-contract/15-deploy-sc-mm-import.png#center"/>
<figcaption align="center"><b>Fig.15:</b> Click "Import tokens"</figcaption>
</figure>

- Paste your contract address, and the remaining fields will be automatically filled in.

<figure>
<img class="zoom" src="/img/deploy-smart-contract/16-deploy-sc-mm-add-token.png#center"/>
<figcaption align="center"><b>Fig.16:</b> Paste contract address</figcaption>
</figure>

- Click "Import tokens"

<figure>
<img class="zoom" src="/img/deploy-smart-contract/17-deploy-sc-mm-import-token.png#center"/>
<figcaption align="center"><b>Fig.17:</b> Click Import tokens</figcaption>
</figure>

- Enjoy using your new token on MetaMask!

<figure>
<img class="zoom" src="/img/deploy-smart-contract/18-deploy-sc-mm-imported.png#center"/>
<figcaption align="center"><b>Fig.18:</b> Enjoy!</figcaption>
</figure>
