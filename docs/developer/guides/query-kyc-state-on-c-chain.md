---
sidebar_position: 45
title: Query KYC/KYB States on C-Chain
description: This document describes how to use Remix IDE to query KYC/KYB States of an address on C-Chain
---

# How to Query KYC/KYB States on C-Chain

This document provides a guide on how to use [Remix IDE](https://remix.ethereum.org/) to query the KYC/KYB States of
an address on C-Chain. Follow the steps below to accomplish this.

## Prerequisites

- MetaMask installation and functionality

## Add Camino Network to MetaMask

To query the KYC/KYB States of an address using the Remix IDE, we will use the MetaMask wallet.

We need to add a custom network to MetaMask. In this document, we will use the Columbus test network.

Please refer to the [MetaMask & RPC Endpoints](/guides/metamask-rpc-endpoints.md) document to add a custom network.

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

- Paste the address you want to query KYC/KYB States into the field and click **`getKycState`** button.

:::note

This is the C-Chain address of a wallet, that starts with `0x`.

If you want to query the **P-Chain address**,
please refer to the [`platform.getAddressStates()`](/developer/apis/camino-node-apis/p-chain#platformgetaddressstates)
method in P-Chain API documentation.

:::

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/13-paste-the-address-n-click-getkycstate.png"/>
<figcaption align="center"><b>Fig.14:</b> Paste the address to query and click getKycState button</figcaption>
</figure>

## Result

- The result of the query will be displayed below the **`getKycState`** button.

- Common values are:

| Value |       State        | Description                                        |
| :---: | :----------------: | -------------------------------------------------- |
|  `0`  |  No Verification   | Given address has not undergone KYC verification   |
|  `1`  |    KYC Verified    | Given address has undergone KYC verification       |
| `256` |    KYB Verified    | Given address has undergone KYB verification       |
| `257` | KYC & KYB Verified | Given address has undergone KYC & KYB verification |

## KYC/KYB State Bits

KYC/KYB states are represented by bits in a uint256 variable. The table below illustrates
the mapping of each bit to its corresponding information:

| Bit | Information  |
| :-: | :----------: |
| `0` | KYC Verifed  |
| `1` | KYC Expired  |
| `8` | KYB Verified |

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

### Example Result for KYC & KYB Verified Address

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/16-kyc-kyb-state.png"/>
<figcaption align="center"><b>Fig.16:</b> Example result for KYC & KYB verified address</figcaption>
</figure>

:::info Conclusion

Smart contracts on the C-Chain can retrieve information from the CaminoAdmin contract to confirm
whether an address they are interacting with has undergone KYC/KYB verification or not.

This functionality empowers developers to create use-cases where such information is necessary.

:::
