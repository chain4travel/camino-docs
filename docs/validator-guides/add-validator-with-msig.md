---
sidebar_position: 32
title: Adding a Validator Node with Multisig Wallet
description: How to add a Validator Node with Multisig Wallet
---

# Adding a Validator Node with Multisig Wallet

This guide will walk you through the process of adding a validator node using
your consortium member address with Camino Wallet.

:::tip WALLET ADDRESS

Please ensure that you use the correct wallet address for this guide: https://suite.camino.network/ 

:::

:::caution VERIFY WALLET ADDRESS

Always verify that the domain is **camino.network** while using the wallet.

![](/img/add-validator/wallet-ssl-check-0.png)

:::

## Overview

To add a validator node using Camino Wallet and a multisig wallet, you will need to follow these steps:

1. Activate your Multisig Wallet
1. Check and verify the requirements
1. Retrieve your node's private key
1. Register your node with your wallet
   - Initiate the Register Node transaction
   - Collect signatures from other members of the wallet
   - Execute the transaction
1. Add your node as a validator
   - Set the end dates
   - Initiate the Add Validator transaction
   - Collect signatures from other members of the wallet
   - Execute the transaction
1. Verify that the validator is online

:::danger RAPID DEVELOPMENT

The Multi-Signature features of Camino Wallet are currently undergoing rapid development. Please note that these features are subject to updates, changes, or fixes.

:::

## 1. Activate your Multisig Wallet

Firstly, you will need to [activate your multisig wallet](/guides/multisig-wallets#managing-multi-sig-wallets-with-camino-wallet).
To do this, log in to your wallet using your key phrase and navigate to the Manage Keys
section (or click the switch button at the top right).

If you are a member of a multisig wallet, an import wallets dialog box will appear. Click the
Import Wallets button to pull in the multisig wallets that you are a member of.

Next, click the small star icon on the right side of the multisigaddress to activate it.

For more detailed information, please refer to the [Multisig Wallets & Aliases](/guides/multisig-wallets) documentation.

## 2. Requirements

Before you begin the process of adding a validator node, there are a few requirements you must fulfill.
Below is a list of these requirements for the mainnet (`camino`) and testnet (`columbus`).

### Camino Mainnet & Columbus Testnet

- **NodeID**: This is the address of your node, similar to a regular wallet address.
- **Node's PrivateKey**: You will need this to prove ownership of the **NodeID**.<br/>
  Keep it safe and secure!
- **100,000 non-bonded CAMs** in your P-Chain wallet. And a few CAMs for paying for transaction fees.
- **Consortium Member**: Your wallet address must be a consortium member.<br/>
  If you are unsure about this, please reach out to us on [Discord](https://discord.gg/camino) for clarification. If you participated in the pre-sale, provided a wallet address, and are a travel-related company, you are already a Consortium Member.
- **KYC/KYB Verified**: You must be Know-Your-Customer (KYC) or Know-Your-Business (KYB) verified.

### Checking Requirements Using Camino Wallet

You can verify if you meet these requirements by accessing the Validator tab after logging in and activating the multisig wallet.

You will be presented with a page similar to this:

<figure>
<img class="zoom" src="/img/msig/val-0-requirements.png"/>
<figcaption align = "center"><b>Fig.1:</b> Requirements</figcaption>
</figure>

## 3. Retrieving Your Node's Private Key

To register your node to your consortium address, you need to prove that you own the node. Therefore, the wallet needs to sign the register node transaction with the node's private key. This is why you need to provide your node's private key to the wallet.

For more information on how to retrieve your node's private key, please refer to the [Retrieving Your Node's Private Key](/validator-guides/add-validator-with-curl#retrieving-your-nodes-private-key) guide.

## 4. Register Your Node with your Multisig Wallet

Once you have fulfilled the requirements outlined above, you can proceed to register your node. You should see a page as in the Fig.3 screenshot.

Simply enter your node's private key into the designated field and click on the `REGISTER VALIDATOR NODE` button.

<figure>
<img class="zoom" src="/img/msig/val-1-register-node-pk.png#center"/>
<figcaption align = "center"><b>Fig.2:</b> Enter Your Node's Private Key</figcaption>
</figure>

### Initiating the Register Node Transaction

After providing your private key, you will be presented with the initiate transaction dialog.
Here, you can verify the NodeID displayed with your node's ID to ensure that the provided private key is correct.

:::caution CAN NOT BE UNDONE

Pay close attention to the warnings displayed in the dialog box. Once the transaction is initiated, it cannot be
undone. It must either be signed by other members of the wallet and executed or it must be left to expire.

This effectively prevents you from initiating new transactions and using the multisig wallet.

Currently, the expiration time for pending transactions is two weeks and cannot be canceled or changed. However,
in the near future, it will be possible to cancel signature-pending transactions.

:::

<figure>
<img class="zoom" src="/img/msig/val-2-register-node-initiate-tx.png#center"/>
<figcaption align = "center"><b>Fig.3:</b> Initiate The Register Node Transaction</figcaption>
</figure>

### Multisig Confirmations Pending

Once you have initiated the transaction, it will be stored off-chain. The other members of the multisig wallet
can then sign the transaction by logging into the wallet and navigating to the Validator section.

:::tip TRESHOLD

Above the "execute transaction" button, you can view the threshold and the number of collected signatures.

:::

<figure>
<img class="zoom" src="/img/msig/val-3-confirmation-pending.png#center"/>
<figcaption align = "center"><b>Fig.4:</b> Confirmations Pending</figcaption>
</figure>

### Signing the Pending Transactions

If you are a member of a multisig wallet with a pending transaction, you can go to the Validator section to
access a similar page. This page allows you to sign the transaction and execute it if you choose to do so.
Alternatively, you may choose to leave the execution of the transaction to other members of the wallet.

<figure>
<img class="zoom" src="/img/msig/val-4-sign-tx.png#center"/>
<figcaption align = "center"><b>Fig.5:</b> Sign Pending Transaction</figcaption>
</figure>

And after it is signed:

<figure>
<img class="zoom" src="/img/msig/val-5-signed.png#center"/>
<figcaption align = "center"><b>Fig.6:</b> After it's signed by one more member</figcaption>
</figure>

### Execute the Register Node Transaction

Click the "execute transaction" button after the threshold has been satisfied. Once the transaction is included
in the blockchain, you can proceed with adding the validator node.

## 5. Adding your Node as a Validator

After you registered your node with your multisig wallet, you will be presented with the "Setting up a Validator Node"
section.

<figure>
<img class="zoom" src="/img/msig/val-6-add-validator-disabled.png#center"/>
<figcaption align = "center"><b>Fig.7:</b> Setting up a Validator</figcaption>
</figure>

### Set Validation & Transaction End Dates

Please note that the "**Confirm**" button under the duration is currently disabled. This is because the
validation end date must be at least 6 months in the future. Therefore, you will need to update this
date accordingly.

Additionally, please update the "**Transaction End Date**" field. The description of this field can be
misleading, as this is actually the date and time when the transaction will be executed. Therefore,
please choose a sensible date and time, taking into consideration that other members of the multisig
wallet will also need to sign the transaction.

:::caution NOTE ABOUT END DATES

Please note that it is important to set the validation and transaction end dates to appropriate values.

| **Validation End Date**  |    This should be set to a date that is at least 6 months (183 days) in the future.    |
| :----------------------: | :------------------------------------------------------------------------------------: |
| **Transaction End Date** | This should be set to a relatively short time in the future, such as 30 or 60 minutes. |

:::

Once you have set the appropriate dates, the page will appear as shown below. Click the **Confirm**
button to proceed.

<figure>
<img class="zoom" src="/img/msig/val-7-add-validator-enabled.png#center"/>
<figcaption align = "center"><b>Fig.8:</b> Setting up a Validator</figcaption>
</figure>

### Initiating the Add Validator Transaction

Afterward, you will be shown a summary of the transaction along with a warning that the action cannot
be undone. Review the details carefully, and if you are satisfied, click the **Submit** button to proceed.

<figure>
<img class="zoom" src="/img/msig/val-8-submit.png#center"/>
<figcaption align = "center"><b>Fig.9:</b> Click the Submit button to initiate the transaction</figcaption>
</figure>

### Collect Signatures

After initiating the transaction, you will be presented with a screen similar to the one shown below.
As with the Register Node transaction, you will need to collect enough signatures to execute the transaction.

<figure>
<img class="zoom" src="/img/msig/val-9-collect-signatures.png#center"/>
<figcaption align = "center"><b>Fig.10:</b> Collect Signatures</figcaption>
</figure>

### Signing the Pending Transaction

Next, the other members of the multisig wallet need to log in to the wallet and sign the transaction.
The following screen shows what a member would see:

<figure>
<img class="zoom" src="/img/msig/val-10-sign-screen.png#center"/>
<figcaption align = "center"><b>Fig.11:</b> Sign the Transaction</figcaption>
</figure>

And after it is signed:

<figure>
<img class="zoom" src="/img/msig/val-11-signed.png#center"/>
<figcaption align = "center"><b>Fig.12:</b> Signed Transaction</figcaption>
</figure>

### Executing the Transaction

At this point, any member of the multisig wallet can execute the transaction. After clicking the "Execute Transaction"
button and submitting the transaction for execution, you will see a screen similar to the one below, which indicates
when the transaction will be executed. Note that this is the date you previously selected.

<figure>
<img class="zoom" src="/img/msig/val-12-execution-waiting.png#center"/>
<figcaption align = "center"><b>Fig.13:</b> Pending Execution</figcaption>
</figure>

## 6. Verify that your Validator is online

Once the transaction execution time has been reached and the transaction has been executed, you should see a screen
similar to the one below:

<figure>
<img class="zoom" src="/img/msig/val-13-validator-running.png#center"/>
<figcaption align = "center"><b>Fig.14:</b> Your Validator Node is running.</figcaption>
</figure>

You may refer to [this documentation](/validator-guides/add-validator-with-wallet#51-check-camino-explorer) for more
information on how to check the status of your validator node using the Camino Explorer.
