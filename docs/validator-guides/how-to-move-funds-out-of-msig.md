---
sidebar_position: 50
title: How to Transfer Funds from a Multisig Wallet?
description: This guide provides instructions on how to transfer funds from a multisig wallet.
---

# How to Transfer Funds from a Multisig Wallet?

:::info What is a Multisig Wallet?

To learn more about multisig wallets please refer to the 
[Multisig Wallets](/guides/multisig-wallets.md) documentation.

:::

:::danger WARNING: Do not send funds to the C-Chain address of a multisig wallet

Please be advised that the functionality of sending funds from another wallet to a multisig 
wallet's C-Chain address is still under development. We strongly advise against doing so, 
as your funds may become stuck and irretrievable.

:::

## Objective

You own a multisig wallet, which has one or multiple owners with a threshold of one or higher. 
You wish to use the funds in this wallet on the C-Chain, which is an Ethereum-compatible smart 
contract chain.

To accomplish this, you must first transfer funds from the multisig wallet to a regular 
(singlesig) wallet, and then perform a cross-chain transfer to the C-Chain.

Once your funds are on the C-Chain, you can utilize them with Metamask for transferring funds 
to other addresses, deploying and interacting with smart contracts, and other operations.

## Outline

1. Initiate a P-Chain to P-Chain transfer from the multisig wallet.
2. If the multisig wallet's threshold is higher than one, have one or more of the other owner wallets sign the initiated transaction.
3. Execute the multisig P > P transaction.
4. Verify that you have received the funds on the singlesig wallet.
5. Perform a cross-chain transfer from the singlesig wallet.
6. Verify that you now have the funds on the C-Chain.

### 1. Initiate The Transfer

#### Retrieve the P-Chain Address of the Singlesig Wallet

To begin, you must obtain the P-Chain address of your singlesig wallet. Log in to the wallet and 
copy its P-Chain address.

<figure>
<img class="zoom" src="/img/msig-to-ssig/1-ssig-p-address.png#center"/>
<figcaption align = "center"><b>Fig.1:</b> Retrieve the P-Chain Address of the Singlesig Wallet</figcaption>
</figure> 

#### Initiate the P > P Transfer

Now, log in to your wallet, which is one of the owners of the multisig wallet. Then, proceed to 
the "Send" section of the wallet. Select P as the source chain, and fill in the fields for "Amount" 
and "To Address". Finally, click on "Confirm".

<figure>
<img class="zoom" src="/img/msig-to-ssig/2-msig-p-transfer-initiate.png#center"/>
<figcaption align = "center"><b>Fig.2:</b> Fill in the Form and Click Confirm</figcaption>
</figure> 

#### Send the Transaction

After filling in the necessary information, you will need to confirm the transaction by 
clicking on the "Send Transaction" button.

<figure>
<img class="zoom" src="/img/msig-to-ssig/3-msig-p-transfer-send-txn.png#center"/>
<figcaption align = "center"><b>Fig.3:</b> Click Send Transaction to Confirm Again</figcaption>
</figure> 

Once you have completed the previous step, you should see the following screen. The transaction 
has now been initiated and is awaiting signatures from other owners of the wallet.

<figure>
<img class="zoom" src="/img/msig-to-ssig/4-msig-p-transfer-abort-txn.png#center"/>
<figcaption align = "center"><b>Fig.4</b> Transaction Initiated & Waits for Signatures</figcaption>
</figure> 

### 2. Sign the Transaction

At this point, another owner of the multisig wallet needs to log in and navigate to the "Send" 
section of the wallet. The transaction should be available for signature.

<figure>
<img class="zoom" src="/img/msig-to-ssig/5-msig-sign-txn.png#center"/>
<figcaption align = "center"><b>Fig.5</b> Sign the Transaction with another Owner</figcaption>
</figure> 

Once you click on the "Sign" button, you will either see the "Execute Transaction" button as 
shown below, or if the multisig wallet's threshold is greater than two, you will need to log 
in to another wallet and sign from there until the threshold is satisfied.

### 3. Execute the P > P Transaction

Click the "Execute" button to send your transaction to the network for execution.

<figure>
<img class="zoom" src="/img/msig-to-ssig/6-msig-execute-txn.png#center"/>
<figcaption align = "center"><b>Fig.6</b> Execute the Transaction</figcaption>
</figure> 

### 4. Verify Receipt of Funds in Singlesig Wallet

Log in to your singlesig wallet again to verify that you have received the funds on P-Chain. 
To do so, click on the "Show Breakdown" button.

:::info Refresh Balance

If the balance is not updated, click on the refresh button located at the top right corner 
of the total balance.

:::

<figure>
<img class="zoom" src="/img/msig-to-ssig/7-ssig-received-funds-on-p-chain.png#center"/>
<figcaption align = "center"><b>Fig.7</b> Verify Balance </figcaption>
</figure> 

### 5. Cross-Chain Transfer from P-Chain to C-Chain

Navigate to the "Cross Chain" section of the wallet. Select "P Chain" as the source chain 
and "C Chain" as the destination chain. Enter the desired transfer amount and click "Confirm".

<figure>
<img class="zoom" src="/img/msig-to-ssig/8-ssig-cross-chain-confirm.png#center"/>
<figcaption align = "center"><b>Fig.8</b> Do the Cross-Chain Transfer P > C</figcaption>
</figure> 

Click Transfer button.

<figure>
<img class="zoom" src="/img/msig-to-ssig/9-ssig-cross-transfer.png#center"/>
<figcaption align = "center"><b>Fig.9</b> Click Transfer Button</figcaption>
</figure> 

If the transaction is successful, you will be presented with a screen similar to the one below.

<figure>
<img class="zoom" src="/img/msig-to-ssig/10-ssig-cross-chain-success.png#center"/>
<figcaption align = "center"><b>Fig.10</b> Transaction Successfull</figcaption>
</figure> 


### 6. Verify You Have Funds on C-Chain

After completing the cross-chain transfer, check the breakdown balance to ensure that the funds 
have been successfully transferred to the C-Chain. You can now use these funds to interact with 
smart contracts or perform other operations on the C-Chain. Enjoy!