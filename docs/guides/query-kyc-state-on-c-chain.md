---
sidebar_position: 45
title: Query KYC State on C-Chain
description: This document describes how to use Remix IDE to query KYC State of an address on C-Chain
---

# How to Query KYC State on C-Chain

This document provides a guide on how to use Remix IDE to query the KYC state of 
an address on C-Chain. Follow the steps below to accomplish this.

## Requirements

- MetaMask installation and functionality

## Add Camino Network to MetaMask

To query the KYC state of an address using the Remix IDE, we will use the MetaMask wallet. 

We need to add a custom network to MetaMask. In this document, we will use the Columbus test network.

- Click **Add network** from MetaMask.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/0-add-network-to-metamask.png"/>
<figcaption align="center"><b>Fig.1:</b> Click "Add network"</figcaption>
</figure>

- On the next screen, click **Add a network manually**

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/1-add-custom-network-to-mm.png"/>
<figcaption align="center"><b>Fig.2:</b> Click "Add a network manually"</figcaption>
</figure>

- **Fill in the text fields & click Save**. You can obtain this information from the [MetaMask RPC Endpoints](/guides/metamask-rpc-endpoints.md) page.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/2-enter-details-into-the-network.png"/>
<figcaption align="center"><b>Fig.3:</b> Fill out the text fields</figcaption>
</figure>

- Verify that the custom network has been added successfully.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/3-add-custom-network-success.png"/>
<figcaption align="center"><b>Fig.4:</b> Verify success</figcaption>
</figure>

## Connecting MetaMask to the Remix IDE

Follow the steps below to connect MetaMask to the IDE:

- Open the Remix IDE web page: https://remix.ethereum.org/
- Click **Deploy and run transaction** on the right sidebar.
- Select **Inject Provider - MetaMask** from the **Environment** dropdown menu.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/4-select-injected-provider.png"/>
<figcaption align="center"><b>Fig.5:</b> Click "Deploy and run transactions" tab and select "Inject Provider" from "Environment"</figcaption>
</figure>

- Verify that the MetaMask is connected to the Remix IDE.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/5-check-network-connected.png"/>
<figcaption align="center"><b>Fig.6:</b> Verify network is connected</figcaption>
</figure>

## Downloading the CaminoAdmin.abi file

We can either compile the contract or use the precompiled ABI file. In this guide, we will use the ABI file.

You can download the ABI file from Chain4Travel's GitHub repository:
[chain4travel/caminoethvm - CaminoAdmin.abi](https://github.com/chain4travel/caminoethvm/blob/chain4travel/contracts/build_contracts/admin/abi/CaminoAdmin.abi)

- Rigth click on "Raw" and select "Save as..." to save it to your local computer.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/6-abi-save-link-as.png"/>
<figcaption align="center"><b>Fig.7:</b> Save "CaminoAdmin.abi" file to local computer</figcaption>
</figure>

## Uploading the ABI file to the Remix IDE

Follow these steps to upload the ABI file to the Remix IDE:


- Switch to **File Explorer** on the right sidebar and click the upload button.
- Select the file you downloaded from your local computer and upload it.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/7-load-local-file.png"/>
<figcaption align="center"><b>Fig.8:</b> Switch to "File Explorer" and click "Load a local file into current workspace"</figcaption>
</figure>

- Select the `CaminoAdmin.abi` file.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/8-select-the-loaded-file.png"/>
<figcaption align="center"><b>Fig.9:</b> Select the loaded ABI file</figcaption>
</figure>

## Getting the CaminoAdmin Contract Address

**Camino Admin Address**: `0x010000000000000000000000000000000000000a`

You can also find the Camino contract addresses on [Camino Smart Contracts](/developer/references/camino-contracts.md) page under `Developer` > `References`.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/9-get-the-contract-address.png"/>
<figcaption align="center"><b>Fig.10:</b> Get the CaminoAdmin contract address</figcaption>
</figure>

## Interacting with the Address

- Paste the address into the **At Address** field and click on the button.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/10-paste-address-and-click-at-address.png"/>
<figcaption align="center"><b>Fig.11:</b> Paste the contract address into the "At Address" field and click "At Address"</figcaption>
</figure>

- Confirm the interaction

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/11-confirm-the-popup.png"/>
<figcaption align="center"><b>Fig.12:</b> Confirm the dialog popup</figcaption>
</figure>

## Making the Query

Follow the steps below to make the query:

- Click the arrow to open the contracts methods list.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/12-open-dropdown-abi.png"/>
<figcaption align="center"><b>Fig.13:</b> Click the arrow to open the dropdown</figcaption>
</figure>

- Paste the address you want to query KYC state into the field and click **`getKycState`** button.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/13-paste-the-address-n-click-getkycstate.png"/>
<figcaption align="center"><b>Fig.14:</b> Paste the address to query and click getKycState button</figcaption>
</figure>

## Result

- The result of the query will be displayed below the **`getKycState`** button

### Example Result for KYC Verified Address

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/14-kyc-state-result.png"/>
<figcaption align="center"><b>Fig.15:</b> Example result for KYC Verified address</figcaption>
</figure>

### Example Result for Non-Verified Address

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/15-kyc-state-result-zero.png"/>
<figcaption align="center"><b>Fig.15:</b> Example result for Non-Verified address</figcaption>
</figure>
