---
sidebar_position: 5
description: This is a step by step guide to set a running node as a Validator
---

# Adding Validator Node

Here is a step by step guide to set a running node as a Validator

## Requirements

#### **Camino Mainnet**

- Get the NODE-ID from a running camino node.
- Have at least 100,000 Camino (CAM) tokens in your wallet on P-Chain balance to be staked
- Is KYC / KYB verified
- Has been admitted as a validator by the validator consortium via a vote. The last condition is omitted for Validators who secure the network from the start.

#### **Columbus Testnet**

- Get the NODE-ID from a running camino node.
- Have at least 2,000 Camino (CAM) tokens in your wallet on P-Chain balance to be staked
- You can request CAM tokens on testnet by sending us your X-Address of your wallet via [Discord](https://discord.gg/camino) or Email

## Transferring Tokens from X-Chain to P-Chain

To transfer your CAM tokens on your [Camino Wallet](https://wallet.camino.foundation) from X-Chain balance to P-Chain balance, follow these steps:

1. Access your wallet from [Camino Wallet](https://wallet.camino.foundation)
2. Click on “Cross Chain” tap on the left
3. Choose Source Chain: “X-Chain”
4. Choose Destination Chain: “P-Chain”
5. Put the amount of CAM you want to transfer
6. Click on “Confirm” , then Click on ”Transfer”
   ![Cross Chain](/img/validator/crosschain-steps.png)

## Add Validator

Next you need to stake an amount of CAM token and set a node as validator. To do so, follow these steps:

1. Click on “Earn” tap on the left
2. Click on “ADD VALIDATOR”
   ![Add Validator 1](/img/validator/add-validator-1.png)

3. Write the NODE-ID you got from camino-node. You can get the Node-ID by using [info.getNodeID](../../developer/apis/camino-node-apis/info.md#infogetnodeid)
4. Put the amount of CAM tokens you want to stake.
5. Choose your staking End Date (Min: 2 Weeks, Max: 1 Year)
6. Click “Confirm”, then click "Submit"
   ![Add Validator 2](/img/validator/add-validator-2.png)

If you have more questions about Validators, you can check [Validators FAQ](../../faq/validator.md)
