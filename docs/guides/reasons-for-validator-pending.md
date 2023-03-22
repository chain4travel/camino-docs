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
