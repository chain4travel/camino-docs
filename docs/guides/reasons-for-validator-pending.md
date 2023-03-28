---
sidebar_position: 41
title: Reasons for Validator Pending
---

# Reasons for Validator Pending

In Camino Network, validators have a staking timeframe, which includes a start and end date that
are provided when adding a validator to the network. The start date must be at least 20 seconds
into the future, but can be any date desired by the validator owner.

If the start date for a validator has not yet been reached, it will remain in the pending validators
list. This is the only reason a validator may be in a pending state.

If you wish to learn how to query the network for pending validators,
please refer to [this document](/guides/add-validator-with-curl#check-pending-validators).

:::tip PENDING VALIDATORS

It's important to note that nodes that are pending validators have completed the registration process
but have not yet reached the specified start time that was set during registration. Once the start time
is reached, the node will be activated as a validator on the blockchain.

:::

:::info Setting up a Validator in Wallet

- When adding a validator through your wallet, you won't be required to specify a start time. The wallet
  automatically assumes that you want to add the validator immediately and sets the start time to be +5
  minutes in the future.

- After submitting your transaction, you will receive a message as below. This can take some time to finish.
  Wallet is checking if the transaction is committed.

![](/img/add-validator/z_setting_up_validator_please_wait.png)

:::
