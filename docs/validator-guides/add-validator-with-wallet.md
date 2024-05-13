---
sidebar_position: 30
title: Adding a Validator Node with Wallet
description: How to add a Validator Node with Camino Wallet
---

# Adding a Validator Node using the Wallet

This guide will walk you through the process of adding a validator node using
your consortium member address with Camino Wallet.

:::info MULTISIG WALLETS

Kindly note that the wallets of a majority of the consortium members are multi-signature
(multi-sig) wallets. If your wallet is also a multisig wallet, please consult the
[Adding a Validator Node with MultiSig Wallet](/validator-guides/add-validator-with-msig) documentation.

:::

:::tip WALLET ADDRESS

Please ensure that you use the correct wallet address for this guide: https://suite.camino.network/

:::

:::caution VERIFY WALLET ADDRESS

Always verify that the domain is **camino.network** while using the wallet.

![](/img/add-validator/wallet-ssl-check-0.png)

:::

## Overview

To add a validator node with Camino Wallet, you will need to follow the steps below:

1. Check and verify the requirements
1. Retrieve your node's private key
1. Register your node with your wallet
1. Add your node as a validator
1. Verify that the validator is online

## 1. Requirements

Before you begin the process of adding a validator node, there are a few requirements you must fulfill.
Below is a list of these requirements for the mainnet (`camino`) and testnet (`columbus`).

### **Camino Mainnet** & **Columbus Testnet**

- **NodeID**: This is the address of your node, similar to a regular wallet address.
- **Node's PrivateKey**: You will need this to prove ownership of the **NodeID**.<br/>
  Keep it safe and secure!
- **100,000 non-bonded CAMs** in your P-Chain wallet. And a few CAMs for paying for transaction fees.<br/>
- **Consortium Member**: Your wallet address must be a consortium member.<br/>
  If you are unsure about this, please reach out to us on [Discord](https://discord.gg/camino) for clarification. If you participated in the pre-sale, you are already a Consortium Member.
- **KYC/KYB Verified**: You must be Know-Your-Customer (KYC) or Know-Your-Business (KYB) verified.

### Checking Requirements Using Camino Wallet

You can verify if you meet these requirements by accessing the Validator tab in your wallet's navigation bar after
logging in.

If some of the requirements are not met, you will see a page similar to this:

<figure>
<img class="zoom" src="/img/add-validator/00-no-c-member-kyc-verified.png"/>
<figcaption align = "center"><b>Fig.1:</b> Example with KYC Verified but not a Consortium Member Address</figcaption>
</figure>

<figure>
<img class="zoom" src="/img/add-validator/05-add-val-funds-green.png"/>
<figcaption align = "center"><b>Fig.2:</b> Example with a Consortium Member address</figcaption>
</figure>

## 2. Retrieving Your Node's Private Key

To register your node to your consortium address, you need to prove that you own the node. Therefore, the wallet needs to sign the register node transaction with the node's private key. This is why you need to provide your node's private key to the wallet.

For more information on how to retrieve your node's private key, please refer to the [Retrieving Your Node's Private Key](/validator-guides/add-validator-with-curl#retrieving-your-nodes-private-key) guide.

## 3. Register Your Node

Once you have fulfilled the requirements outlined above, you can proceed to register your node. You should see a page as in the Fig.2 screenshot.
Simply enter your node's private key into the designated field and click on the `REGISTER VALIDATOR NODE` button.

<figure>
<img class="zoom" src="/img/add-validator/06-add-val-pkey-input.png"/>
<figcaption align = "center"><b>Fig.3:</b> Enter Your Node's Private Key</figcaption>
</figure>

## 4. Add Your Node as a Validator

After successfully registering your node, the validator page will update and appear as follows:

<figure>
<img class="zoom" src="/img/add-validator/07-add-val-confirm.png"/>
<figcaption align = "center"><b>Fig.4:</b> Setting up Validator Node</figcaption>
</figure>

### Enter the Required Details

- **Node ID**: Your node's ID will be automatically retrieved from the registered node of your address.
- **Validation End Date**: Enter the date when you want the validation period to end. The minimum value is two weeks, and the maximum is one year. You can click the `MAX` button for the maximum value.
- **Validation End Date**: Enter the date when you want the validation period to end. The minimum value is two weeks, and the maximum is one year. You can click on the `MAX` button to select the maximum value.
- **Bonded Amount**: For Camino, this value is a fixed amount of 100,000 CAMs. The field will be pre-set with this value.

:::info

Please note that the value shown in the screenshot above is 2000 CAMs, which is used for documentation purposes only, as a development network is being used.

:::

### Confirm & Submit

After filling in the required details, click the Confirm button located on the right side of the page. You will be presented with the information you entered.

Verify the information carefully, and if you are satisfied with it, click on the Submit button.

:::caution

Please note that once you have added your validator, you cannot undo this operation or change the end date of the validation period.
Therefore, it is crucial to double-check the entered information before submitting.

:::

<figure>
<img class="zoom" src="/img/add-validator/08-add-val-submit.png"/>
<figcaption align = "center"><b>Fig.5:</b> Verify the Information and Submit the Transaction</figcaption>
</figure>

## 5. Check your Validator

After you have submitted your transaction, you should see the status as committed with a green checkmark:

<figure>
<img class="zoom" src="/img/add-validator/09c-add-val-committed-tx-extra.png"/>
<figcaption align = "center"><b>Fig.5-b:</b> Successfull Transaction</figcaption>
</figure>

### 5.1 Check Camino Explorer

In a few minutes, your validator should be online in [Explorer's validators page](https://suite.camino.network/explorer/camino/validators)

:::tip Validators List

To access the **Validators List**, click on the "Number of Validators" on the Camino Explorer:

<img class="zoom" src="/img/add-validator/06-check-validators.png"/>

:::

### Before the Add Validator Transaction

<figure>
<img class="zoom" src="/img/add-validator/e1-initial-2x.png"/>
<figcaption align = "center"><b>Fig.6:</b> Before Add Validator: P-Chain Latest Transactions</figcaption>
</figure>

<figure>
<img class="zoom" src="/img/add-validator/e2-initial-2x-val-list.png"/>
<figcaption align = "center"><b>Fig.6-b:</b> Before Add Validator: Validators List</figcaption>
</figure>

### After the Add Validator Transaction

<figure>
<img class="zoom" src="/img/add-validator/e3-val-added-3x.png"/>
<figcaption align = "center"><b>Fig.7:</b> After Add Validator: P-Chain Latest Transactions</figcaption>
</figure>

<figure>
<img class="zoom" src="/img/add-validator/e3-val-added-3x-val-list.png"/>
<figcaption align = "center"><b>Fig.7-b:</b> After Add Validator: Validators List</figcaption>
</figure>

### 5.2 Check Earn Page

You can also check Earn page on Camino Wallet to your bond about your validator:

<figure>
<img class="zoom" src="/img/add-validator/10-earn-tab.png"/>
<figcaption align = "center"><b>Fig.7-b:</b> Earn page: Deposits & Bonds</figcaption>
</figure>

## All Done!

Congratulations! You have successfully added your validator node.

<figure>
<img class="zoom" src="/img/add-validator/10-val-general-view.png"/>
<figcaption align = "center"><b>Fig.8:</b> Validator Node Information</figcaption>
</figure>

You can also check Validator Rewards on Camino Wallet in the Rewards section in Validator tab:

<figure>
<img class="zoom" src="/img/add-validator/11-val-rewards.png"/>
<figcaption align = "center"><b>Fig.9:</b> Validator Rewards</figcaption>
</figure>
