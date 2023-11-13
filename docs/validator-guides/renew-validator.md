---
sidebar_position: 33
title: Renew Validation Period
description: A guide on how to renew the validation period after expiration.
---

# Renewing the Validation Period

Once the validation period for a validator concludes, it is removed from the current validators, and the
corresponding node transitions to an API node. The validator's owner must then initiate a new validation
period and reintegrate the validator to resume validation activities.

As the consortium member address already has its validator registered, the owner simply needs to add the
validator back to the network; registering the node again is not necessary.

Below is a step-by-step guide on how to proceed with this process.

## 1. Activate your Multisig Wallet

:::info SINGLETON WALLETS

If you are using a non-multisig wallet, please proceed to the next section. There is no need to import multisig
aliases for singleton wallets.

:::

Firstly, you will need to [activate your multisig wallet](/guides/multisig-wallets#managing-multi-sig-wallets-with-camino-wallet).
To do this, log in to your wallet using your key phrase and navigate to the Manage Keys
section (or click the switch button at the top right).

If you are a member of a multisig wallet, an import wallets dialog box will appear. Click the
Import Wallets button to pull in the multisig wallets that you are a member of.

Next, click the small star icon on the right side of the multisigaddress to activate it.

For more detailed information, please refer to the [Multisig Wallets & Aliases](/guides/multisig-wallets) documentation.

<figure>
<img class="zoom" src="/img/msig/msig-0-import-wallets-dialog.png#center"/>
<figcaption align = "center"><b>Fig.1:</b> Import Wallets Dialog</figcaption>
</figure>

<figure>
<img class="zoom" src="/img/msig/msig-1-import-wallets-dialog-switcher.png#center"/>
<figcaption align = "center"><b>Fig.2:</b> Wallet Switcher Dialog</figcaption>
</figure>

## 2. Adding your Node as a Validator

Navigate to the 'Validator' section in the Camino Wallet, where you will find the "Setting up a Validator Node" section.

<figure>
<img class="zoom" src="/img/msig/val-6-add-validator-disabled.png#center"/>
<figcaption align = "center"><b>Fig.3:</b> Setting up a Validator</figcaption>
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
<figcaption align = "center"><b>Fig.4:</b> Setting up a Validator</figcaption>
</figure>

### Initiating the Add Validator Transaction

Afterward, you will be shown a summary of the transaction along with a warning that the action cannot
be undone. Review the details carefully, and if you are satisfied, click the **Submit** button to proceed.

<figure>
<img class="zoom" src="/img/msig/val-8-submit.png#center"/>
<figcaption align = "center"><b>Fig.5:</b> Click the Submit button to initiate the transaction</figcaption>
</figure>

:::info SINGLETON WALLETS

The sections below are intended for multisig wallets. If you have a singleton wallet, you can directly execute the transaction.

:::

### Collect Signatures

Once you initiate the transaction, a screen similar to the one depicted below will appear. Since this involves
a multisig wallet, it is necessary to gather a sufficient number of signatures to execute the transaction.

<figure>
<img class="zoom" src="/img/msig/val-9-collect-signatures.png#center"/>
<figcaption align = "center"><b>Fig.6:</b> Collect Signatures</figcaption>
</figure>

### Signing the Pending Transaction

Next, the other members of the multisig wallet need to log in to the wallet and sign the transaction.
The following screen shows what a member would see:

<figure>
<img class="zoom" src="/img/msig/val-10-sign-screen.png#center"/>
<figcaption align = "center"><b>Fig.7:</b> Sign the Transaction</figcaption>
</figure>

And after it is signed:

<figure>
<img class="zoom" src="/img/msig/val-11-signed.png#center"/>
<figcaption align = "center"><b>Fig.8:</b> Signed Transaction</figcaption>
</figure>

### Executing the Transaction

At this point, any member of the multisig wallet can execute the transaction. After clicking the "Execute Transaction"
button and submitting the transaction for execution, you will see a screen similar to the one below, which indicates
when the transaction will be executed. Note that this is the date you previously selected.

<figure>
<img class="zoom" src="/img/msig/val-12-execution-waiting.png#center"/>
<figcaption align = "center"><b>Fig.9:</b> Pending Execution</figcaption>
</figure>

## 3. Verify that your Validator is online

Once the transaction execution time has been reached and the transaction has been executed, you should see a screen
similar to the one below:

<figure>
<img class="zoom" src="/img/msig/val-13-validator-running.png#center"/>
<figcaption align = "center"><b>Fig.10:</b> Your Validator Node is running.</figcaption>
</figure>

You may refer to [this documentation](/validator-guides/add-validator-with-wallet#51-check-camino-explorer) for more
information on how to check the status of your validator node using the Camino Explorer.
