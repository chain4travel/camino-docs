---
sidebar_position: 2
---

# Platform Chain (P-Chain) API

This API allows clients to interact with the P-Chain, which maintains Camino’s validator set and handles blockchain creation.

## Endpoint

```
/ext/P
```

## Format

This API uses the `json 2.0` RPC format.

## Methods

### platform&#46;addDelegator

Add a delegator to the Primary Network.

A delegator stakes CAM and specifies a validator (the delegatee) to validate on their behalf. The delegatee has an increased probability of being sampled by other validators (weight) in proportion to the stake delegated to them.

The delegatee charges a fee to the delegator; the former receives a percentage of the delegator’s validation reward (if any.) A transaction that delegates stake has no fee.

The delegation period must be a subset of the period that the delegatee validates the Primary Network.

Note that once you issue the transaction to add a node as a delegator, there is no way to change the parameters. **You can’t remove a stake early or change the stake amount, node ID, or reward address.** Please make sure you’re using the correct values.

**Signature**

```sh
platform.addDelegator(
    {
        nodeID: string,
        startTime: int,
        endTime: int,
        stakeAmount: int,
        rewardAddress: string,
        from: []string, //optional
        changeAddr: string, //optional
        username: string,
        password: string
    }
) ->
{
    txID: string,
    changeAddr: string
}
```

- `nodeID` is the ID of the node to delegate to.
- `startTime` is the Unix time when the delegator starts delegating.
- `endTime` is the Unix time when the delegator stops delegating (and staked CAM is returned).
- `stakeAmount` is the amount of nCAM the delegator is staking.
- `rewardAddress` is the address the validator reward goes to, if there is one.
- `from` are the addresses that you want to use for this operation. If omitted, uses any of your addresses as needed.
- `changeAddr` is the address any change will be sent to. If omitted, change is sent to one of the addresses controlled by the user.
- `username` is the user that pays the transaction fee.
- `password` is `username`‘s password.
- `txID` is the transaction ID

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.addDelegator",
    "params": {
        "nodeID":"NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
        "rewardAddress":"P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy",
        "startTime":1594102400,
        "endTime":1604102400,
        "stakeAmount":100000,
        "from": ["P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy"],
        "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u",
        "username":"myUsername",
        "password":"myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "6pB3MtHUNogeHapZqMUBmx6N38ii3LzytVDrXuMovwKQFTZLs",
    "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u"
  },
  "id": 1
}
```

### platform&#46;addValidator

Add a validator to the Primary Network. You must stake CAM to do this. If the node is sufficiently correct and responsive while validating, you receive a reward when end of staking period is reached. The validator’s probability of being sampled by other validators during consensus is in proportion to the amount of CAM staked.

The validator charges a fee to delegators; the former receives a percentage of the delegator’s validation reward (if any.) The minimum delegation fee is 2%. A transaction that adds a validator has no fee.

The validation period must be between 2 weeks and 1 year.

There is a maximum total weight imposed on validators. This means that no validator will ever have more CAM staked and delegated to it than this value. This value will initially be set to `min(5 * amount staked, 3M CAM)`. The total value on a validator is 3 million CAM.

Note that once you issue the transaction to add a node as a validator, there is no way to change the parameters. **You can’t remove stake early or change the stake amount, node ID, or reward address.** Please make sure you’re using the correct values. If you’re not sure, ask for help on [Discord.](https://discord.gg/camino)

**Signature**

```sh
platform.addValidator(
    {
        nodeID: string,
        startTime: int,
        endTime: int,
        stakeAmount: int,
        rewardAddress: string,
        delegationFeeRate: float,
        from: []string, //optional
        changeAddr: string, //optional
        username: string,
        password: string
    }
) ->
{
    txID: string,
    changeAddr: string
}
```

- `nodeID` is the node ID of the validator being added.
- `startTime` is the Unix time when the validator starts validating the Primary Network.
- `endTime` is the Unix time when the validator stops validating the Primary Network (and staked CAM is returned).
- `stakeAmount` is the amount of nCAM the validator is staking.
- `rewardAddress` is the address the validator reward will go to, if there is one.
- `delegationFeeRate` is the percent fee this validator charges when others delegate stake to them. Up to 4 decimal places allowed; additional decimal places are ignored. Must be between 0 and 100, inclusive. For example, if `delegationFeeRate` is `1.2345` and someone delegates to this validator, then when the delegation period is over, 1.2345% of the reward goes to the validator and the rest goes to the delegator.
- `from` are the addresses that you want to use for this operation. If omitted, uses any of your addresses as needed.
- `changeAddr` is the address any change will be sent to. If omitted, change is sent to one of the addresses controlled by the user.
- `username` is the user that pays the transaction fee.
- `password` is `username`‘s password.
- `txID` is the transaction ID

:::info Stake Amount is Fixed
Please keep in mind that Camino has fixed `stakeAmount` for validators.<br/>
**testnet**: `2000000000000` nCAM (2000 CAM)<br/>
**mainnet**: `100000000000000` nCAM (100k CAM)
:::

:::caution YOU NEED TO REGISTER YOUR NODE
`platform.addValidator` method will fail if you did not register your node with your wallet address. Please see [platform.registerNode](#platformregisternode)
:::

**Example Call**

In this example, we use shell command `date` to compute Unix times 10 minutes and 2 days in the future. (Note: If you’re on a Mac, replace `$(date` with `$(gdate`. If you don’t have `gdate` installed, do `brew install coreutils`.)

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.addValidator",
    "params": {
        "nodeID":"NodeID-ARCLrphAHZ28xZEBfUL7SVAmzkTZNe1LK",
        "rewardAddress":"P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy",
        "from": ["P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy"],
        "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u",
        "startTime":'$(date --date="10 minutes" +%s)',
        "endTime":'$(date --date="2 days" +%s)',
        "stakeAmount":1000000,
        "delegationFeeRate":10,
        "username":"myUsername",
        "password":"myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "6pb3mthunogehapzqmubmx6n38ii3lzytvdrxumovwkqftzls",
    "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u"
  },
  "id": 1
}
```

### platform&#46;addSubnetValidator

Add a validator to a subnet other than the Primary Network. The Validator must validate the Primary Network for the entire duration they validate this subnet.

**Signature**

```sh
platform.addSubnetValidator(
    {
        nodeID: string,
        subnetID: string,
        startTime: int,
        endTime: int,
        weight: int,
        from: []string, //optional
        changeAddr: string, //optional
        username: string,
        password: string
    }
) ->
{
    txID: string,
    changeAddr: string,
}
```

- `nodeID` is the node ID of the validator.
- `subnetID` is the subnet they will validate.
- `startTime` is the unix time when the validator starts validating the subnet.
- `endTime` is the unix time when the validator stops validating the subnet.
- `weight` is the validator’s weight used for sampling.
- `from` are the addresses that you want to use for this operation. If omitted, uses any of your addresses as needed.
- `changeAddr` is the address any change will be sent to. If omitted, change is sent to one of the addresses controlled by the user.
- `username` is the user that pays the transaction fee.
- `password` is `username`‘s password.
- `txID` is the transaction ID.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.addSubnetvalidator",
    "params": {
        "nodeID":"NodeID-AK7sPBsZM9rQwse23aLhEEBPHZD5gkLrL",
        "subnetID":"zbfoww1ffkpvrfywpj1cvqrfnyesepdfc61hmu2n9jnghduel",
        "startTime":1583524047,
        "endTime":1604102399,
        "weight":1,
        "from": ["P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy"],
        "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u",
        "username":"myUsername",
        "password":"myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "txID": "2exafyvRNSE5ehwjhafBVt6CTntot7DFjsZNcZ54GSxBbVLcCm",
    "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u"
  }
}
```

### platform&#46;createAddress

Create a new address controlled by the given user.

**Signature**

```sh
platform.createAddress({
    username: string,
    password: string
}) -> {address: string}
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.createAddress",
    "params": {
        "username":"myUsername",
        "password":"myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "address": "P-columbus12lqey27sfujqq6mc5a3jr5av56cjsu8hg2d3hx"
  },
  "id": 1
}
```

### platform&#46;createBlockchain

Create a new blockchain. Currently only supports the creation of new instances of the AVM and the Timestamp VM.

**Signature**

```sh
platform.createBlockchain(
    {
        subnetID: string,
        vmID: string,
        name: string,
        genesisData: string,
        encoding: string, //optional
        from: []string, //optional
        changeAddr: string, //optional
        username: string,
        password: string
    }
) ->
{
    txID: string,
    changeAddr: string
}
```

- `subnetID` is the ID of the Subnet that validates the new blockchain. The Subnet must exist and can’t be the Primary Network.
- `vmID` is the ID of the Virtual Machine the blockchain runs. Can also be an alias of the Virtual Machine.
- `name` is a human-readable name for the new blockchain. Not necessarily unique.
- `genesisData` is the byte representation of the genesis state of the new blockchain encoded in the format specified by the `encoding` parameter.
- `encoding` specifies the format to use for `genesisData`. Can be either "cb58" or "hex". Defaults to "cb58". Virtual Machines should have a static API method named `buildGenesis` that can be used to generate `genesisData`
- `from` are the addresses that you want to use for this operation. If omitted, uses any of your addresses as needed.
- `changeAddr` is the address any change will be sent to. If omitted, change is sent to one of the addresses controlled by the user.
- `username` is the user that pays the transaction fee. This user must have a sufficient number of the subnet’s control keys.
- `password` is `username`‘s password.
- `txID` is the transaction ID.

**Example Call**

In this example we’re creating a new instance of the Timestamp Virtual Machine. `genesisData` came from calling `timestamp.buildGenesis`.

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.createBlockchain",
    "params" : {
        "vmID":"timestamp",
        "subnetID":"2bRCr6B4MiEfSjidDwxDpdCyviwnfUVqB2HGwhm947w9YYqb7r",
        "name":"My new timestamp",
        "genesisData": "45oj4CqFViNHUtBxJ55TZfqCAMFwMRMj2XkHVqUYjJYoTaEM",
        "encoding": "cb58",
        "from": ["P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy"],
        "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u",
        "username":"myUsername",
        "password":"myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "2TBnyFmST7TirNm6Y6z4863zusRVpWi5Cj1sKS9bXTUmu8GfeU",
    "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u"
  },
  "id": 1
}
```

### platform&#46;createSubnet

Create a new subnet.

The subnet’s ID is the same as this transaction’s ID.

**Signature**

```sh
platform.createSubnet(
    {
        controlKeys: []string,
        threshold: int,
        from: []string, //optional
        changeAddr: string, //optional
        username: string,
        password: string
    }
) ->
{
    txID: string,
    changeAddr: string
}
```

- In order to add a validator to this subnet, `threshold` signatures are required from the addresses in `controlKeys`
- `from` are the addresses that you want to use for this operation. If omitted, uses any of your addresses as needed.
- `changeAddr` is the address any change will be sent to. If omitted, change is sent to one of the addresses controlled by the user.
- `username` is the user that pays the transaction fee.
- `password` is `username`‘s password.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.createSubnet",
    "params": {
        "controlKeys":[
            "P-columbus13xqjvp8r2entvw5m29jxxjhmp3hh6lz8laep9m",
            "P-columbus165mp4efnel8rkdeqe5ztggspmw4v40j7pfjlhu"
        ],
        "threshold":2,
        "from": ["P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy"],
        "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u",
        "username":"myUsername",
        "password":"myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "hJfC5xGhtjhCGBh1JWn3vZ51KJP696TZrsbadPHNbQG2Ve5yd"
  },
  "id": 1
}
```

### platform&#46;exportAVAX

Send CAM from an address on the P-Chain to an address on the X-Chain. After issuing this transaction, you must call the X-Chain’s [`avm.import`](x-chain.mdx#avmimport) method with assetID `CAM` to complete the transfer.

**Signature**

```sh
platform.exportAVAX(
    {
        amount: int,
        from: []string, //optional
        to: string,
        changeAddr: string, //optional
        username: string,
        password: string
    }
) ->
{
    txID: string,
    changeAddr: string
}
```

- `amount` is the amount of nCAM to send.
- `to` is the address on the X-Chain to send the CAM to
- `from` are the addresses that you want to use for this operation. If omitted, uses any of your addresses as needed.
- `changeAddr` is the address any change will be sent to. If omitted, change is sent to one of the addresses controlled by the user.
- `username` is the user sending the CAM and paying the transaction fee.
- `password` is `username`‘s password.
- `txID` is the ID of this transaction.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.exportAVAX",
    "params": {
        "to":"X-columbus1yv8cwj9kq3527feemtmh5gkvezna5xys08mxet",
        "amount":1,
        "from": ["P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy"],
        "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u",
        "username":"myUsername",
        "password":"myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "2Kz69TNBSeABuaVjKa6ZJCTLobbe5xo9c5eU8QwdUSvPo2dBk3",
    "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u"
  },
  "id": 1
}
```

### platform&#46;exportKey

Get the private key that controls a given address.  
The returned private key can be added to a user with [`platform.importKey`](p-chain.md#platformimportkey).

**Signature**

```sh
platform.exportKey({
    username: string,
    password: string,
    address: string
}) -> {privateKey: string}
```

- `username` is the user that controls `address`.
- `password` is `username`‘s password.
- `privateKey` is the string representation of the private key that controls `address`.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.exportKey",
    "params" :{
        "username" :"myUsername",
        "password": "myPassword",
        "address": "P-columbus1zwp96clwehpwm57r9ftzdm7rnuslrunj68ua3r"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "privateKey": "PrivateKey-Lf49kAJw3CbaL783vmbeAJvhscJqC7vi5yBYLxw2XfbzNS5RS"
  }
}
```

### platform&#46;getAddressStates

Get the states bitmask applied to an address.

**Signature**

```sh
platform.getAddressStates({
    address: string,
}) -> string
```

- `address` is the address to get states for.

**Possible values for `state`**

```sh
    AddressStateRoleAdmin    = uint8(0)
    AddressStateRoleKyc      = uint8(1)

    AddressStateKycVerified    = uint8(32)
    AddressStateKycExpired     = uint8(33)

    AddressStateConsortium      = uint8(38)
    AddressStateNodeDeferred    = uint8(39)
```

**Example Call**

```sh
curl -X POST --data '{
  "jsonrpc":"2.0",
  "id"     : 1,
  "method" :"platform.getAddressStates",
  "params" :{
      "address":"P-columbus1m8wnvtqvthsxxlrrsu3f43kf9wgch5tyfx4nmf"
  }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": "12345",
  "id": 1
}
```

### platform&#46;getAllDepositOffers

Get all deposit offers for a given unix `timestamp`. The method returns only deposit offers that are active at the given `timestamp`.

**Signature**

```sh
platform.getAllDepositOffers({
    timestamp: int
}) ->
{
    depositOffers: []{
        ID: string,
        InterestRateNominator: int,
        Start: int,
        End: int
        MinAmount: int,
        MinDuration: int,
        MaxDuration: int
        UnlockPeriodDuration: int,
        NoRewardsPeriodDuration: int,
        Memo: string
        Flags: int,
    }
}
```

- `ID` is the ID of the deposit offer.
- `InterestRateNominator` is the nominator of the interest rate.
- `Start` is the Unix time when this offer starts to be valid.
- `End` is the Unix time when this offer stops to be valid.
- `MinAmount` is the minimum amount of CAM that can be deposited.
- `MinDuration` is the minimum duration of the deposit in seconds.
- `MaxDuration` is the maximum duration of the deposit in seconds.
- `UnlockPeriodDuration` is the duration of the unlock period in seconds.
- `NoRewardsPeriodDuration` is the duration of the no rewards period in seconds.
- `Memo` is base64 encoded string of a description of the deposit offer.
- `Flags` is a parameter describing the status of the deposit offer.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getAllDepositOffers",
    "params": {
      "timestamp": 1696303193
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "depositOffers": [
      {
        "ID": "2GcJSMiaRACwrKDYV8Sa17AoFce8k4WHHXFyZL5eFH2CtZBAKy",
        "InterestRateNominator": 210000,
        "Start": 1676374487,
        "End": 1739450087,
        "MinAmount": 1,
        "MinDuration": 86400,
        "MaxDuration": 31536000,
        "UnlockPeriodDuration": 43200,
        "NoRewardsPeriodDuration": 43200,
        "Memo": "MHg2NDY1NzA2ZjczNjk3NDRmNjY2NjY1NzIyMDc0NjU3Mzc0MjMzMjIwMmQyMDcwNjk2MzZiNjE2MjZjNjUyMDYxNjY3NDY1NzIyMDZlNjU3NDc3NmY3MjZiMjA2MzcyNjU2MTc0Njk2ZjZlMjA2MTZlNjQyMDZlNmY3NDIwNjk2ZTIwNjc2NTZlNjU3MzY5NzMyMDYxNzMyMDY0NzU3MjYxNzQ2OTZmNmUyMDY5NzMyMDZlNmY3NDIwNjM2ODZmNmY3MzYxNjI2YzY1MjA3MDY1NzIyMDYxNmM2YzZmNjM2MTc0Njk2ZjZlMjE1MjhiMTMzYg==",
        "Flags": 0
      },
      {
        "ID": "2t8eBizuEpdGfXbuQxw57PHmtBpmkZeLtzDJ3q5tmju6HhDDaG",
        "InterestRateNominator": 110000,
        "Start": 1676374487,
        "End": 1739450087,
        "MinAmount": 1,
        "MinDuration": 60,
        "MaxDuration": 31536000,
        "UnlockPeriodDuration": 0,
        "NoRewardsPeriodDuration": 0,
        "Memo": "MHg2NDY1NzA2ZjczNjk3NDRmNjY2NjY1NzIyMDc0NjU3Mzc0MjMzMTIwMmQyMDcwNjk2MzZiNjE2MjZjNjUyMDYxNjY3NDY1NzIyMDZlNjU3NDc3NmY3MjZiMjA2MzcyNjU2MTc0Njk2ZjZlMjA2MTZlNjQyMDZlNmY3NDIwNjk2ZTIwNjc2NTZlNjU3MzY5NzMyMDYxNzMyMDY0NzU3MjYxNzQ2OTZmNmUyMDY5NzMyMDZlNmY3NDIwNjM2ODZmNmY3MzYxNjI2YzY1MjA3MDY1NzIyMDYxNmM2YzZmNjM2MTc0Njk2ZjZlMjEyOGZiMzE0ZQ==",
        "Flags": 0
      }
    ]
  },
  "id": 1
}
```

### platform&#46;getBalance

Get the balance of CAM controlled by given addresses.

**Signature**

```sh
platform.getBalance({
    addresses: string[]
}) -> {
    balances: {id: string},
    unlockedOutputs: {id: string},
    bondedOutputs: {id: string},
    depositedOutputs: {id: string},
    bondedDepositedOutputs: {id: string},
    utxoIDs: []{
        txID: string,
        outputIndex: int
    }
}
```

- `addresses` is the list of addresses to get the balance of.
- `balances` is the total balance, in nCAM. Response is a map as `{ assedID: balance }`. See [platform.getConfiguration](#platformgetconfiguration) for more info.
- `unlockedOutputs` is the unlocked balance, in nCAM.
- `bondedOutputs` is the bonded balance, in nCAM.
- `depositedOutputs` is the deposited balance, in nCAM.
- `bondedDepositedOutputs` is the bonded and deposited balance, in nCAM.
- `utxoIDs` are the IDs of the UTXOs that reference `address`.

:::info DEPOSITS & BONDS

For more info about deposits and bonds please visit [Deposits & Bonds](/guides/deposits-and-bonds) page.

:::

**Example Call**

```sh
curl -X POST --data '{
  "jsonrpc":"2.0",
  "id"     : 1,
  "method" :"platform.getBalance",
  "params" :{
      "addresses":["P-columbus1m8wnvtqvthsxxlrrsu3f43kf9wgch5tyfx4nmf"]
  }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "balances": {
      "2qD5UA8E5a3rCyVGrxWHp4pwP14d8WicgCfM9KzdyWQ6AyK3w8": "104901417112028"
    },
    "unlockedOutputs": {
      "2qD5UA8E5a3rCyVGrxWHp4pwP14d8WicgCfM9KzdyWQ6AyK3w8": "4901417112028"
    },
    "bondedOutputs": {},
    "depositedOutputs": {},
    "bondedDepositedOutputs": {
      "2qD5UA8E5a3rCyVGrxWHp4pwP14d8WicgCfM9KzdyWQ6AyK3w8": "100000000000000"
    },
    "utxoIDs": [
      {
        "txID": "22cFMeT6vJKEw4CADLGMFeHMyogn7TSE44ZtZjGNFi7W6m2GyV",
        "outputIndex": 0
      },
      {
        "txID": "k91svvCsKQHQbuezUqiWtBT3PkGwtinrM4biuAv5CbfT7BjUG",
        "outputIndex": 0
      }
    ]
  },
  "id": 1
}
```

### platform&#46;getBlock

Get a block by its ID.

**Signature**

```sh
platform.getBlock({
    blockID: string
    encoding: string // optional
}) -> {
    block: string,
    encoding: string
}
```

**Request**

- `blockID` is the block ID. It should be in cb58 format.
- `encoding` is the encoding format to use. Can be either `cb58`, `hex`, or `json`. Defaults to `cb58`.

**Response**

- `block` is the transaction encoded to `encoding`.
- `encoding` is the `encoding`.

#### CB58 Example

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getBlock",
    "params": {
        "blockID": "d7WYmb8VeZNHsny3EJCwMm6QA37s1EHwMxw1Y71V3FqPZ5EFG",
        "encoding": "cb58"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "block": "11111BwoDGdFYQfsbfJ35VKjMP6z5dtggBJqFay7KN33GdqpU8ZFAvaSVegwfADYFipsCpTft27TA8h99krBjsMvFZ5TgFYrQCNN2DkyXQSVuGadYh8UhZ6Ptp3HwVYvXWHaDwjt3mEs9fkoS5JiTDfrrp3w6ws2LTksv3LGtb66iWjWgnHU46WgY2wVqnwrit2x7mYGTgJpXeziLCY66Hnnu1jAy5hYhK2Ek37XhvBcd1UeTcPAFsEtFdLr8Ku19K2dYYNvvuz7YnJjuqxUjtNoC61UcKrtTyJCqRuyA85NRFD7ZYVKwSd13CevyZWuBiBWZkukUpLhJwTcWnFnzbntKDCMdip4kAtQueDkjYnrXu2AWS3SXiJTSmZm55iwn4iE9sqBs6Rj1CnrakGi7sCcXg1UyYu5scmb5RVDKDtZPNLr5Vb6oTWaM4egHfwgT98koZ28rSw8otJfv4q1BH9vrS4N7pUJxh9grnksG9TQDtjBjD9tmhxC8iSLYTwGNxitAqjZd7SGE9",
    "encoding": "cb58"
  },
  "id": 1
}
```

#### Hex Example

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getBlock",
    "params": {
        "blockID": "d7WYmb8VeZNHsny3EJCwMm6QA37s1EHwMxw1Y71V3FqPZ5EFG",
        "encoding": "hex"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "block": "0x00000000000309473dc99a0851a29174d84e522da8ccb1a56ac23f7b0ba79f80acce34cf576900000000000f4241000000010000001200000001000000000000000000000000000000000000000000000000000000000000000000000000000000011c4c57e1bcb3c567f9f03caa75563502d1a21393173c06d9d79ea247b20e24800000000021e67317cbc4be2aeb00677ad6462778a8f52274b9d605df2591b23027a87dff000000050000000338e0465f0000000100000000000000000427d4b22a2a78bcddd456742caf91b56badbff985ee19aef14573e7343fd6520000000121e67317cbc4be2aeb00677ad6462778a8f52274b9d605df2591b23027a87dff000000070000000338d1041f0000000000000000000000010000000195a4467dd8f939554ea4e6501c08294386938cbf000000010000000900000001c79711c4b48dcde205b63603efef7c61773a0eb47efb503fcebe40d21962b7c25ebd734057400a12cce9cf99aceec8462923d5d91fffe1cb908372281ed738580119286dde",
    "encoding": "hex"
  },
  "id": 1
}
```

#### JSON Example

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getBlock",
    "params": {
        "blockID": "d7WYmb8VeZNHsny3EJCwMm6QA37s1EHwMxw1Y71V3FqPZ5EFG",
        "encoding": "json"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "block": {
      "parentID": "5615di9ytxujackzaXNrVuWQy5y8Yrt8chPCscMr5Ku9YxJ1S",
      "height": 1000001,
      "txs": [
        {
          "unsignedTx": {
            "inputs": {
              "networkID": 1,
              "blockchainID": "11111111111111111111111111111111LpoYY",
              "outputs": [],
              "inputs": [
                {
                  "txID": "DTqiagiMFdqbNQ62V2Gt1GddTVLkKUk2caGr4pyza9hTtsfta",
                  "outputIndex": 0,
                  "assetID": "o8seyjX6WupqJ1CE8CeaozK13kqVgc4DFvdvc4crfacLFBauW",
                  "fxID": "spdxUxVJQbX85MGxMHbKw1sHxMnSqJ3QBzDyDYEP3h6TLuxqQ",
                  "input": {
                    "amount": 13839124063,
                    "signatureIndices": [0]
                  }
                }
              ],
              "memo": "0x"
            },
            "destinationChain": "2q9e4r6Mu3U68nU1fYjgbR6JvwrRx36CohpAX5UQxse55x1Q5",
            "exportedOutputs": [
              {
                "assetID": "o8seyjX6WupqJ1CE8CeaozK13kqVgc4DFvdvc4crfacLFBauW",
                "fxID": "spdxUxVJQbX85MGxMHbKw1sHxMnSqJ3QBzDyDYEP3h6TLuxqQ",
                "output": {
                  "addresses": [
                    "P-columbus1jkjyvlwclyu42n4yuegpczpfgwrf8r9lyj0d3c"
                  ],
                  "amount": 13838124063,
                  "locktime": 0,
                  "threshold": 1
                }
              }
            ]
          },
          "credentials": [
            {
              "signatures": [
                "0xc79711c4b48dcde205b63603efef7c61773a0eb47efb503fcebe40d21962b7c25ebd734057400a12cce9cf99aceec8462923d5d91fffe1cb908372281ed7385801"
              ]
            }
          ]
        }
      ]
    },
    "encoding": "json"
  },
  "id": 1
}
```

### platform&#46;getBlockchains

Get all the blockchains that exist (excluding the P-Chain).

**Signature**

```sh
platform.getBlockchains() ->
{
    blockchains: []{
        id: string,
        name:string,
        subnetID: string,
        vmID: string
    }
}
```

- `blockchains` is all of the blockchains that exists on the Camino network.
- `name` is the human-readable name of this blockchain.
- `id` is the blockchain’s ID.
- `subnetID` is the ID of the Subnet that validates this blockchain.
- `vmID` is the ID of the Virtual Machine the blockchain runs.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getBlockchains",
    "params": {},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "blockchains": [
      {
        "id": "28Pp3JZJBABUmFQcC9ZXPjuDS6WVX8LeQP9y3DvpCXGiNiTQFV",
        "name": "X-Chain",
        "subnetID": "11111111111111111111111111111111LpoYY",
        "vmID": "jvYyfQTxGMJLuGWa55kdP2p2zSUYsQ5Raupu4TW34ZAUBAbtq"
      },
      {
        "id": "fnVV12Px5y6FGM5Ua8moqmTPCQT2im18SZEW2xgMDGurimFZg",
        "name": "C-Chain",
        "subnetID": "11111111111111111111111111111111LpoYY",
        "vmID": "mgj786NP7uDwBCcq6YwThhaN8FLyybkCa4zBWTQbNgmK6k9A6"
      },
      {
        "id": "2SMYrx4Dj6QqCEA3WjnUTYEFSnpqVTwyV3GPNgQqQZbBbFgoJX",
        "name": "Timestamp VM",
        "subnetID": "11111111111111111111111111111111LpoYY",
        "vmID": "tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH"
      }
    ]
  },
  "id": 1
}
```

### platform&#46;getBlockchainStatus

Get the status of a blockchain.

**Signature**

```sh
platform.getBlockchainStatus(
    {
        blockchainID: string
    }
) -> {status: string}
```

`status` is one of:

- `Validating`: The blockchain is being validated by this node.
- `Created`: The blockchain exists but isn’t being validated by this node.
- `Preferred`: The blockchain was proposed to be created and is likely to be created but the transaction isn’t yet accepted.
- `Syncing`: This node is participating in this blockchain as a non-validating node.
- `Unknown`: The blockchain either wasn’t proposed or the proposal to create it isn’t preferred. The proposal may be resubmitted.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getBlockchainStatus",
    "params":{
        "blockchainID":"fnVV12Px5y6FGM5Ua8moqmTPCQT2im18SZEW2xgMDGurimFZg"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "status": "Created"
  },
  "id": 1
}
```

### platform&#46;getConfiguration

Returns platformVM configuration.

**Signature**

```sh
platform.getConfiguration() -> {
    networkID: int,
    assetID: string,
    assetSymbol: string,
    hrp: string,
    blockchains: [
      {
        id: string,
        name: string,
        subnetID: string,
        vmID: string
      },
      ...
    ],
    minStakeDuration: int,
    maxStakeDuration: int,
    minValidatorStake: int,
    maxValidatorStake: int,
    minDelegationFee: int,
    minDelegatorStake: int,
    minConsumptionRate: int,
    maxConsumptionRate: int,
    supplyCap: int,
    codecVersion: int,
    verifyNodeSignature: bool,
    lockModeBondDeposit: bool
}
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.getConfiguration"
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "networkID": "1002",
    "assetID": "iTV3Gh5EY2aUqt6JyhKkHSH4thSsUUhGC8GhxwDrTxgmREpr1",
    "assetSymbol": "CAM",
    "hrp": "kopernikus",
    "blockchains": [
      {
        "id": "2emXuWNR9Gn9Hbe5k3iwyBax8sQhGHv2BJwhDJwMrvXYAotBeL",
        "name": "C-Chain",
        "subnetID": "11111111111111111111111111111111LpoYY",
        "vmID": "mgj786NP7uDwBCcq6YwThhaN8FLyybkCa4zBWTQbNgmK6k9A6"
      },
      {
        "id": "2o3ApqF7hQCjBofo8hD8i8GLHhAkMv96Hu7kjd5NqsScraoZ1x",
        "name": "X-Chain",
        "subnetID": "11111111111111111111111111111111LpoYY",
        "vmID": "jvYyfQTxGMJLuGWa55kdP2p2zSUYsQ5Raupu4TW34ZAUBAbtq"
      }
    ],
    "minStakeDuration": "86400000000000",
    "maxStakeDuration": "31536000000000000",
    "minValidatorStake": "2000000000000",
    "maxValidatorStake": "2000000000000",
    "minDelegationFee": "0",
    "minDelegatorStake": "0",
    "minConsumptionRate": "0",
    "maxConsumptionRate": "0",
    "supplyCap": "1000000000000000000",
    "codecVersion": "0",
    "verifyNodeSignature": true,
    "lockModeBondDeposit": true
  },
  "id": 1
}
```

### platform&#46;getCurrentSupply

Returns an upper bound on the number of CAM that exist. This is an upper bound because it does not account for burnt tokens, including transaction fees.

**Signature**

```sh
platform.getCurrentSupply() -> {supply: int}
```

- `supply` is an upper bound on the number of CAM that exist, denominated in nCAM.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getCurrentSupply",
    "params": {},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "supply": "365865167637779183"
  },
  "id": 1
}
```

The response in this example indicates that CAM’s supply is at most 365.865 million.

### platform&#46;getCurrentValidators

List the current validators of the given Subnet.

The top level field `delegators` was deprecated as of v1.0.1, and removed in v1.0.6. Instead, each element of `validators` now contains the list of delegators for that validator.

**Signature**

```sh
platform.getCurrentValidators({
    subnetID: string, //optional
    nodeIDs: string[], //optional
}) -> {
    validators: []{
        txID: string,
        startTime: string,
        endTime: string,
        stakeAmount: string, //optional
        nodeID: string,
        weight: string, //optional
        rewardOwner: {
            locktime: string,
            threshold: string,
            addresses: string[]
        },
        potentialReward: string,
        delegationFee: string,
        uptime: string,
        connected: bool,
        delegators: []{
            txID: string,
            startTime: string,
            endTime: string,
            stakeAmount: string, //optional
            nodeID: string,
            rewardOwner: {
                locktime: string,
                threshold: string,
                addresses: string[]
            },
            potentialReward: string,
        }
    }
}
```

- `subnetID` is the subnet whose current validators are returned. If omitted, returns the current validators of the Primary Network.
- `nodeIDs` is a list of the nodeIDs of current validators to request. If omitted, all current validators are returned. If a specified nodeID is not in the set of current validators, it will not be included in the response.
- `validators`:
  - `txID` is the validator transaction.
  - `startTime` is the Unix time when the validator starts validating the Subnet.
  - `endTime` is the Unix time when the validator stops validating the Subnet.
  - `stakeAmount` is the amount of nCAM this validator staked. Omitted if `subnetID` is not the Primary Network.
  - `nodeID` is the validator’s node ID.
  - `weight` is the validator’s weight when sampling validators. Omitted if `subnetID` is the Primary Network.
  - `rewardOwner` is an `OutputOwners` output which includes `locktime`, `threshold` and array of `addresses`.
  - `potentialReward` is the potential reward earned from staking
  - `delegationFeeRate` is the percent fee this validator charges when others delegate stake to them.
  - `uptime` is the % of time the queried node has reported the peer as online.
  - `connected` is if the node is connected to the network
  - `delegators` is the list of delegators to this validator:
    - `txID` is the delegator transaction.
    - `startTime` is the Unix time when the delegator started.
    - `endTime` is the Unix time when the delegator stops.
    - `stakeAmount` is the amount of nCAM this delegator staked. Omitted if `subnetID` is not the Primary Network.
    - `nodeID` is the validating node’s node ID.
    - `rewardOwner` is an `OutputOwners` output which includes `locktime`, `threshold` and array of `addresses`.
    - `potentialReward` is the potential reward earned from staking
- `delegators`: (**deprecated as of v1.0.1. See note at top of method documentation.**)

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getCurrentValidators",
    "params": {},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "validators": [
      {
        "txID": "2NNkpYTGfTFLSGXJcHtVv6drwVU2cczhmjK2uhvwDyxwsjzZMm",
        "startTime": "1600368632",
        "endTime": "1602960455",
        "stakeAmount": "2000000000000",
        "nodeID": "NodeID-5mb46qkSBj81k9g9e4VFjGGSbaaSLFRzD",
        "rewardOwner": {
          "locktime": "0",
          "threshold": "1",
          "addresses": ["P-columbus18jma8ppw3nhx5r4ap8clazz0dps7rv5u00z96u"]
        },
        "potentialReward": "117431493426",
        "delegationFee": "10.0000",
        "uptime": "0.0000",
        "connected": false,
        "delegators": [
          {
            "txID": "Bbai8nzGVcyn2VmeYcbS74zfjJLjDacGNVuzuvAQkHn1uWfoV",
            "startTime": "1600368523",
            "endTime": "1602960342",
            "stakeAmount": "25000000000",
            "nodeID": "NodeID-5mb46qkSBj81k9g9e4VFjGGSbaaSLFRzD",
            "rewardOwner": {
              "locktime": "0",
              "threshold": "1",
              "addresses": ["P-columbus18jma8ppw3nhx5r4ap8clazz0dps7rv5u00z96u"]
            },
            "potentialReward": "11743144774"
          }
        ]
      }
    ]
  },
  "id": 1
}
```

### platform&#46;getHeight

Returns the height of the last accepted block.

**Signature**

```sh
platform.getHeight() ->
{
    height: int,
}
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getHeight",
    "params": {},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "height": "56"
  },
  "id": 1
}
```

### platform&#46;getMaxStakeAmount

Returns the maximum amount of nCAM staking to the named node during a particular time period.

**Signature**

```sh
platform.getMaxStakeAmount(
    {
        subnetID: string,
        nodeID: string,
        startTime: int,
        endTime: int
    }
) ->
{
    amount: uint64
}
```

- `subnetID` is a Buffer or cb58 string representing subnet
- `nodeID` is a string representing ID of the node whose stake amount is required during the given duration
- `startTime` is a big number denoting start time of the duration during which stake amount of the node is required.
- `endTime` is a big number denoting end time of the duration during which stake amount of the node is required.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getMaxStakeAmount",
    "params": {
        "subnetID":"11111111111111111111111111111111LpoYY",
        "nodeID":"NodeID-AK7sPBsZM9rQwse23aLhEEBPHZD5gkLrL",
        "startTime": 1644240334,
        "endTime": 1644240634
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "amount": "2000000000000000"
  },
  "id": 1
}
```

### platform&#46;getMinStake

Get the minimum amount of CAM required to validate the Primary Network and the minimum amount of CAM that can be delegated.

**Signature**

```sh
platform.getMinStake() ->
{
    minValidatorStake : uint64,
    minDelegatorStake : uint64
}
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.getMinStake"
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "minValidatorStake": "2000000000000",
    "minDelegatorStake": "25000000000"
  },
  "id": 1
}
```

### platform&#46;getPendingValidators

List the validators in the pending validator set of the specified Subnet. Each validator is not currently validating the Subnet but will in the future.

**Signature**

```sh
platform.getPendingValidators({
    subnetID: string, //optional
    nodeIDs: string[], //optional
}) -> {
    validators: []{
        txID: string,
        startTime: string,
        endTime: string,
        stakeAmount: string, //optional
        nodeID: string,
        delegationFee: string,
        connected: bool,
        weight: string, //optional
    },
    delegators: []{
        txID: string,
        startTime: string,
        endTime: string,
        stakeAmount: string,
        nodeID: string
    }
}
```

- `subnetID` is the subnet whose current validators are returned. If omitted, returns the current validators of the Primary Network.
- `nodeIDs` is a list of the nodeIDs of pending validators to request. If omitted, all pending validators are returned. If a specified nodeID is not in the set of pending validators, it will not be included in the response.
- `validators`:
  - `txID` is the validator transaction.
  - `startTime` is the Unix time when the validator starts validating the Subnet.
  - `endTime` is the Unix time when the validator stops validating the Subnet.
  - `stakeAmount` is the amount of nCAM this validator staked. Omitted if `subnetID` is not the Primary Network.
  - `nodeID` is the validator’s node ID.
  - `connected` if the node is connected.
  - `weight` is the validator’s weight when sampling validators. Omitted if `subnetID` is the Primary Network.
- `delegators`:
  - `txID` is the delegator transaction.
  - `startTime` is the Unix time when the delegator starts.
  - `endTime` is the Unix time when the delegator stops.
  - `stakeAmount` is the amount of nCAM this delegator staked. Omitted if `subnetID` is not the Primary Network.
  - `nodeID` is the validating node’s node ID.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getPendingValidators",
    "params": {},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "validators": [
      {
        "txID": "2NNkpYTGfTFLSGXJcHtVv6drwVU2cczhmjK2uhvwDyxwsjzZMm",
        "startTime": "1600368632",
        "endTime": "1602960455",
        "stakeAmount": "200000000000",
        "nodeID": "NodeID-5mb46qkSBj81k9g9e4VFjGGSbaaSLFRzD",
        "delegationFee": "10.0000",
        "connected": false
      }
    ],
    "delegators": [
      {
        "txID": "Bbai8nzGVcyn2VmeYcbS74zfjJLjDacGNVuzuvAQkHn1uWfoV",
        "startTime": "1600368523",
        "endTime": "1602960342",
        "stakeAmount": "20000000000",
        "nodeID": "NodeID-AK7sPBsZM9rQwse23aLhEEBPHZD5gkLrL"
      }
    ]
  },
  "id": 1
}
```

### platform&#46;getRewardUTXOs

Returns the UTXOs that were rewarded after the provided transaction's staking or delegation period ended.

**Signature**

```sh
platform.getRewardUTXOs({
    txID: string,
    encoding: string //optional
}) -> {
    numFetched: integer,
    utxos: []string,
    encoding: string
}
```

- `txID` is the ID of the staking or delegating transaction
- `numFetched` is the number of returned UTXOs
- `utxos` is an array of encoded reward UTXOs
- `encoding` specifies the format for the returned UTXOs. Can be either "cb58" or "hex" and defaults to "cb58".

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getRewardUTXOs",
    "params": {
        "txID": "2nmH8LithVbdjaXsxVQCQfXtzN9hBbmebrsaEYnLM9T32Uy2Y5"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "numFetched": "2",
    "utxos": [
      "11Zf8cc55Qy1rVgy3t87MJVCSEu539whRSwpdbrtHS6oh5Hnwv1gz8G3BtLJ73MPspLkD83cygZufT4TPYZCmuxW5cRdPrVMbZAHfb6uyGM1jNGBhBiQAgQ6V1yceYf825g27TT6WU4bTdbniWdECDWdGdi84hdiqSJH2y",
      "11Zf8cc55Qy1rVgy3t87MJVCSEu539whRSwpdbrtHS6oh5Hnwv1NjNhqZnievVs2kBD9qTrayBYRs81emGTtmnu2wzqpLstbAPJDdVjf3kjwGWywNCdjV6TPGojVR5vHpJhBVRtHTQXR9VP9MBdHXge8zEBsQJAoZhTbr2"
    ],
    "encoding": "cb58"
  },
  "id": 1
}
```

### platform&#46;getStakingAssetID

Retrieve an assetID for a subnet’s staking asset. Currently, this only returns the Primary Network’s staking assetID.

**Signature**

```sh
platform.getStakingAssetID({
    subnetID: string //optional
}) -> {
    assetID: string
}
```

- `subnetID` is the subnet whose assetID is requested.
- `assetID` is the assetID for a subnet’s staking asset.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getStakingAssetID",
    "params": {
        "subnetID": "11111111111111111111111111111111LpoYY"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "assetID": "o8seyjX6WupqJ1CE8CeaozK13kqVgc4DFvdvc4crfacLFBauW"
  },
  "id": 1
}
```

### platform&#46;getSubnets

Get info about the Subnets.

**Signature**

```sh
platform.getSubnets(
    {ids: []string}
) ->
{
    subnets: []{
        id: string,
        controlKeys: []string,
        threshold: string
    }
}
```

- `ids` are the IDs of the subnets to get information about. If omitted, gets information about all subnets.
- `id` is the Subnet’s ID.
- `threshold` signatures from addresses in `controlKeys` are needed to add a validator to the subnet.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getSubnets",
    "params": {"ids":["hW8Ma7dLMA7o4xmJf3AXBbo17bXzE7xnThUd3ypM4VAWo1sNJ"]},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
    "jsonrpc": "2.0",
    "result": {
        "subnets": [
            {
                "id": "hW8Ma7dLMA7o4xmJf3AXBbo17bXzE7xnThUd3ypM4VAWo1sNJ",
                "controlKeys": [
                    "KNjXsaA1sZsaKCD1cd85YXauDuxshTes2",
                    "Aiz4eEt5xv9t4NCnAWaQJFNz5ABqLtJkR"
                ],
                "threshold": "2"
            }
        ]
    },
    "id": 1
}'
```

### platform&#46;getStake

Get the amount of nCAM staked by a set of addresses. The amount returned does not include staking rewards.

**Signature**

```sh
platform.getStake({addresses: []string}) -> {staked: int}
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getStake",
    "params": {
        "addresses": [
            "P-everest1g3ea9z5kmkzwnxp8vr8rpjh6lqw4r0ufec460d",
            "P-everest12un03rm579fewele99c4v53qnmymwu46dv3s5v"
        ]
    },
    "id": 1
}
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "staked": "5000000"
  },
  "id": 1
}
```

### platform&#46;getTimestamp

Get the current P-Chain timestamp.

**Signature**

```sh
platform.getTimestamp() -> {time: string}
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getTimestamp",
    "params": {},
    "id": 1
}
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "timestamp": "2021-09-07T00:00:00-04:00"
  },
  "id": 1
}
```

### platform&#46;getTotalStake

Get the total amount of nCAM staked on the Primary Network.

**Signature**

```sh
platform.getTotalStake() -> {stake: int}
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getTotalStake",
    "params": {},
    "id": 1
}
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "stake": "279825917679866811"
  },
  "id": 1
}
```

### platform&#46;getTx

Gets a transaction by its ID.

Optional `encoding` parameter to specify the format for the returned transaction. Can be either "cb58", "hex", or "json". Defaults to "cb58".

**Signature**

```sh
platform.getTx({
    txID: string,
    encoding: string //optional
}) -> {
    tx: string,
    encoding: string,
}
```

**CB58 Example**

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getTx",
    "params": {
        "txID":"2Eug3Y6j1yD745y5bQ9bFCf5nvU2qT1eB53GSpD15EkGUfu8xh",
        "encoding": "cb58"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "tx": "111117ukQs6mcsKobtCH2jrVemXbPL2SgZTxJ4Lg7zazMjo4Kyyo33YNwnwhUJToHRk7zmCFXbL6BieJWpLch9Aa8opKr7qJeWPjSWhriX9TQLBt5jxq9ijX9JB3dwNG7MtY5KXS6EWF3w3tHBL5GTfL36F2b1PJfcWQQoTgeQWoe8MJXM27LGjnkhTMEzuNpTyrEcranPgXwdy9nNVZiLGMyYpzXbnmV2JUkGZXap8Ye3faWBwNg1La4aCXFKZ7ADMSiQUgqWYDMGZkDEg3yXNifSsBiAvqeCTx8kKp4B5W1vsgf3Tko2XW6A3SrkNVFVmbqCNjPKPpKeoSPnAC5Wmrb9zTMSZqYG9F6E7myow4o7tubbeDU3FC6fSws5ytQAnFseKUUT94jBGFGDD9pAuXExFwdwgRRUUS228ai4AZMqEF7KW5J9FhFQCUxMyprLxdPEUrjw3jW",
    "encoding": "cb58"
  },
  "id": 1
}
```

**JSON Example**

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getTx",
    "params": {
        "txID":"2Eug3Y6j1yD745y5bQ9bFCf5nvU2qT1eB53GSpD15EkGUfu8xh",
        "encoding": "json"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "tx": {
      "unsignedTx": {
        "inputs": {
          "networkID": 5,
          "blockchainID": "11111111111111111111111111111111LpoYY",
          "outputs": [],
          "inputs": [
            {
              "txID": "2QYG5yR6YW55ixmBvR4zXLCZKV9we9bmSWHHiGppF4Ko17bTPn",
              "outputIndex": 0,
              "assetID": "U8iRqJoiJm8xZHAacmvYyZVwqQx6uDNtQeP3CQ6fcgQk3JqnK",
              "fxID": "spdxUxVJQbX85MGxMHbKw1sHxMnSqJ3QBzDyDYEP3h6TLuxqQ",
              "input": {
                "amount": 1998000000,
                "signatureIndices": [0]
              }
            }
          ],
          "memo": "0x"
        },
        "destinationChain": "yH8D7ThNJkxmtkuv2jgBa4P1Rn3Qpr4pPr7QYNfcdoS6k6HWp",
        "exportedOutputs": [
          {
            "assetID": "U8iRqJoiJm8xZHAacmvYyZVwqQx6uDNtQeP3CQ6fcgQk3JqnK",
            "fxID": "spdxUxVJQbX85MGxMHbKw1sHxMnSqJ3QBzDyDYEP3h6TLuxqQ",
            "output": {
              "addresses": [
                "P-columbus1yhem6kev6gkfsyse3m5z09e6qsuxujz0arpw8v"
              ],
              "amount": 1997000000,
              "locktime": 0,
              "threshold": 1
            }
          }
        ]
      },
      "credentials": [
        {
          "signatures": [
            "0xdbc03ebd7d06927baacf7aea85cdebd7e0b95cf5b57715a09981fd5a75dac2cb610636bf3657ba4ca47dad4beed2e7f0ec692e7f12f1bbc9f3c34fc5c18ae35d01"
          ]
        }
      ]
    },
    "encoding": "json"
  },
  "id": 1
}
```

### platform&#46;getTxStatus

Gets a transaction’s status by its ID. If the transaction was dropped, response will include a `reason` field with more information why the transaction was dropped.

**Signature**

```sh
platform.getTxStatus({
    txID: string
}) -> {status: string}
```

`status` is one of:

- `Committed`: The transaction is (or will be) accepted by every node
- `Processing`: The transaction is being voted on by this node
- `Dropped`: The transaction will never be accepted by any node in the network, check `reason` field for more information
- `Unknown`: The transaction hasn’t been seen by this node

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getTxStatus",
    "params": {
        "txID":"TAG9Ns1sa723mZy1GSoGqWipK6Mvpaj7CAswVJGM6MkVJDF9Q"
   },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "status": "Committed"
  },
  "id": 1
}
```

### platform&#46;getUTXOs

Gets the UTXOs that reference a given set of addresses.

**Signature**

```sh
platform.getUTXOs(
    {
        addresses: []string,
        limit: int, //optional
        startIndex: { //optional
            address: string,
            utxo: string
        },
        sourceChain: string, //optional
        encoding: string, //optional
    },
) ->
{
    numFetched: int,
    utxos: []string,
    endIndex: {
        address: string,
        utxo: string
    },
    encoding: string,
}
```

- `utxos` is a list of UTXOs such that each UTXO references at least one address in `addresses`.
- At most `limit` UTXOs are returned. If `limit` is omitted or greater than 1024, it is set to 1024.
- This method supports pagination. `endIndex` denotes the last UTXO returned. To get the next set of UTXOs, use the value of `endIndex` as `startIndex` in the next call.
- If `startIndex` is omitted, will fetch all UTXOs up to `limit`.
- When using pagination (ie when `startIndex` is provided), UTXOs are not guaranteed to be unique across multiple calls. That is, a UTXO may appear in the result of the first call, and then again in the second call.
- When using pagination, consistency is not guaranteed across multiple calls. That is, the UTXO set of the addresses may have changed between calls.
- `encoding` specifies the format for the returned UTXOs. Can be either "cb58" or "hex" and defaults to "cb58".

#### **Example**

Suppose we want all UTXOs that reference at least one of `P-columbus1s994jad0rtwvlfpkpyg2yau9nxt60qqfv023qx` and `P-columbus1fquvrjkj7ma5srtayfvx7kncu7um3ym73ztydr`.

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.getUTXOs",
    "params" :{
        "addresses":["P-columbus1s994jad0rtwvlfpkpyg2yau9nxt60qqfv023qx", "P-columbus1fquvrjkj7ma5srtayfvx7kncu7um3ym73ztydr"],
        "limit":5,
        "encoding": "cb58"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

This gives response:

```json
{
  "jsonrpc": "2.0",
  "result": {
    "numFetched": "5",
    "utxos": [
      "11PQ1sNw9tcXjVki7261souJnr1TPFrdVCu5JGZC7Shedq3a7xvnTXkBQ162qMYxoerMdwzCM2iM1wEQPwTxZbtkPASf2tWvddnsxPEYndVSxLv8PDFMwBGp6UoL35gd9MQW3UitpfmFsLnAUCSAZHWCgqft2iHKnKRQRz",
      "11RCDVNLzFT8KmriEJN7W1in6vB2cPteTZHnwaQF6kt8B2UANfUkcroi8b8ZSEXJE74LzX1mmBvtU34K6VZPNAVxzF6KfEA8RbYT7xhraioTsHqxVr2DJhZHpR3wGWdjUnRrqSSeeKGE76HTiQQ8WXoABesvs8GkhVpXMK",
      "11GxS4Kj2od4bocNWMQiQhcBEHsC3ZgBP6edTgYbGY7iiXgRVjPKQGkhX5zj4NC62ZdYR3sZAgp6nUc75RJKwcvBKm4MGjHvje7GvegYFCt4RmwRbFDDvbeMYusEnfVwvpYwQycXQdPFMe12z4SP4jXjnueernYbRtC4qL",
      "11S1AL9rxocRf2NVzQkZ6bfaWxgCYch7Bp2mgzBT6f5ru3XEMiVZM6F8DufeaVvJZnvnHWtZqocoSRZPHT5GM6qqCmdbXuuqb44oqdSMRvLphzhircmMnUbNz4TjBxcChtks3ZiVFhdkCb7kBNLbBEmtuHcDxM7MkgPjHw",
      "11Cn3i2T9SMArCmamYUBt5xhNEsrdRCYKQsANw3EqBkeThbQgAKxVJomfc2DE4ViYcPtz4tcEfja38nY7kQV7gGb3Fq5gxvbLdb4yZatwCZE7u4mrEXT3bNZy46ByU8A3JnT91uJmfrhHPV1M3NUHYbt6Q3mJ3bFM1KQjE"
    ],
    "endIndex": {
      "address": "P-columbus1fquvrjkj7ma5srtayfvx7kncu7um3ym73ztydr",
      "utxo": "kbUThAUfmBXUmRgTpgD6r3nLj7rJUGho6xyht5nouNNypH45j"
    },
    "encoding": "cb58"
  },
  "id": 1
}
```

Since `numFetched` is the same as `limit`, we can tell that there may be more UTXOs that were not fetched. We call the method again, this time with `startIndex`:

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.getUTXOs",
    "params" :{
        "addresses":["P-columbus1fquvrjkj7ma5srtayfvx7kncu7um3ym73ztydr"],
        "limit":5,
        "startIndex": {
            "address": "P-columbus1fquvrjkj7ma5srtayfvx7kncu7um3ym73ztydr",
            "utxo": "kbUThAUfmBXUmRgTpgD6r3nLj7rJUGho6xyht5nouNNypH45j"
        },
        "encoding": "cb58"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

This gives response:

```json
{
  "jsonrpc": "2.0",
  "result": {
    "numFetched": "4",
    "utxos": [
      "115ZLnNqzCsyugMY5kbLnsyP2y4se4GJBbKHjyQnbPfRBitqLaxMizsaXbDMU61fHV2MDd7fGsDnkMzsTewULi94mcjk1bfvP7aHYUG2i3XELpV9guqsCtv7m3m3Kg4Ya1m6tAWqT7PhvAaW4D3fk8W1KnXu5JTWvYBqD2",
      "11QASUuhw9M1r52maTFUZ4fnuQby9inX77VYxePQoNavEyCPuHN5cCWPQnwf8fMrydFXVMPAcS4UJAcLjSFskNEmtVPDMY4UyHwh2MChBju6Y7V8yYf3JBmYt767NPsdS3EqgufYJMowpud8fNyH1to4pAdd6A9CYbD8KG",
      "11MHPUWT8CsdrtMWstYpFR3kobsvRrLB4W8tP9kDjhjgLkCJf9aaJQM832oPcvKBsRhCCxfKdWr2UWPztRCU9HEv4qXVwRhg9fknAXzY3a9rXXPk9HmArxMHLzGzRECkXpXb2dAeqaCsZ637MPMrJeWiovgeAG8c5dAw2q",
      "11K9kKhFg75JJQUFJEGiTmbdFm7r1Uw5zsyDLDY1uVc8zo42WNbgcpscNQhyNqNPKrgtavqtRppQNXSEHnBQxEEh5KbAEcb8SxVZjSCqhNxME8UTrconBkTETSA23SjUSk8AkbTRrLz5BAqB6jo9195xNmM3WLWt7mLJ24"
    ],
    "endIndex": {
      "address": "P-columbus1fquvrjkj7ma5srtayfvx7kncu7um3ym73ztydr",
      "utxo": "21jG2RfqyHUUgkTLe2tUp6ETGLriSDTW3th8JXFbPRNiSZ11jK"
    },
    "encoding": "cb58"
  },
  "id": 1
}
```

Since `numFetched` is less than `limit`, we know that we are done fetching UTXOs and don’t need to call this method again.

Suppose we want to fetch the UTXOs exported from the X Chain to the P Chain in order to build an ImportTx. Then we need to call GetUTXOs with the sourceChain argument in order to retrieve the atomic UTXOs:

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.getUTXOs",
    "params" :{
        "addresses":["P-columbus1fquvrjkj7ma5srtayfvx7kncu7um3ym73ztydr"],
        "sourceChain": "X",
        "encoding": "cb58"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

This gives response:

```json
{
  "jsonrpc": "2.0",
  "result": {
    "numFetched": "1",
    "utxos": [
      "115P1k9aSVFBfi9siZZz135jkrBCdEMZMbZ82JaLLuML37cgVMvGwefFXr2EaH2FML6mZuCehMLDdXSVE5aBwc8ePn8WqtZgDv9W641JZoLQhWY8fmvitiBLrc3Zd1aJPDxPouUVXFmLEbmcUnQxfw1Hyz1jpPbWSioowb"
    ],
    "endIndex": {
      "address": "P-columbus1fquvrjkj7ma5srtayfvx7kncu7um3ym73ztydr",
      "utxo": "S5UKgWoVpoGFyxfisebmmRf8WqC7ZwcmYwS7XaDVZqoaFcCwK"
    },
    "encoding": "cb58"
  },
  "id": 1
}
```

### platform&#46;getValidatorsAt

Get the validators and their weights of a subnet or the Primary Network at a given P-Chain height.

**Signature**

```sh
platform.getValidatorsAt(
    {
        height: int,
        subnetID: string, // optional
    }
)
```

- `height` is the P-Chain height to get the validator set at.
- `subnetID` is the subnet ID to get the validator set of. If not given, gets validator set of the Primary Network.

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getValidatorsAt",
    "params": {
        "height":1
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "validators": {
      "NodeID-AK7sPBsZM9rQwse23aLhEEBPHZD5gkLrL": 2000000000000000,
      "NodeID-5ZUdznHckQcqucAnNf3vzXnPF97tfRtfn": 2000000000000000,
      "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ": 2000000000000000,
      "NodeID-PM2LqrGsxudhZSP49upMonevbQvnvAciv": 2000000000000000,
      "NodeID-EoYFkbokZEukfWrUovo74YkTFnAMaqTG7": 2000000000000000
    }
  },
  "id": 1
}
```

### platform&#46;importAVAX

Complete a transfer of CAM from the X-Chain to the P-Chain.

Before this method is called, you must call the X-Chain’s [`avm.export`](x-chain.mdx#avmexport) method with assetID `CAM` to initiate the transfer.

**Signature**

```sh
platform.importAVAX(
    {
        from: []string, //optional
        to: string,
        changeAddr: string, //optional
        username: string,
        password: string
    }
) ->
{
    tx: string,
    changeAddr: string
}
```

- `to` is the ID of the address the CAM is imported to. This must be the same as the `to` argument in the corresponding call to the X-Chain’s `export`.
- `from` are the addresses that you want to use for this operation. If omitted, uses any of your addresses as needed.
- `changeAddr` is the address any change will be sent to. If omitted, change is sent to one of the addresses controlled by the user.
- `username` is the user that controls from and change addresses.
- `password` is `username`‘s password.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.importAVAX",
    "params": {
        "to": "P-columbus1apzq2zt0uaaatum3wdz83u4z7dv4st7l5m5n2a",
        "from": ["P-columbus1gss39m5sx6jn7wlyzeqzm086yfq2l02xkvmecy"],
        "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u",
        "username": "myUsername",
        "password": "myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "P63NjowXaQJXt5cmspqdoD3VcuQdXUPM5eoZE2Vcg63aVEx8R",
    "changeAddr": "P-columbus103y30cxeulkjfe3kwfnpt432ylmnxux8r73r8u"
  },
  "id": 1
}
```

### platform&#46;importKey

Give a user control over an address by providing the private key that controls the address.

**Signature**

```sh
platform.importKey({
    username: string,
    password: string,
    privateKey:string
}) -> {address: string}
```

- Add `privateKey` to `username`‘s set of private keys. `address` is the address `username` now controls with the private key.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.importKey",
    "params" :{
        "username": "myUsername",
        "password": "myPassword",
        "privateKey": "PrivateKey-2w4XiXxPfQK4TypYqnohRL8DRNTz9cGiGmwQ1zmgEqD9c9KWLq"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "address": "P-columbus19hwpvkx2p5q99w87dlpfhqpt3czyh8ywasfaym"
  }
}
```

### platform&#46;issueTx

Issue a transaction to the Platform Chain.

**Signature**

```sh
platform.issueTx({
    tx: string,
    encoding: string, //optional
}) -> {txID: string}
```

- `tx` is the byte representation of a transaction.
- `encoding` specifies the encoding format for the transaction bytes. Can be either "cb58" or "hex". Defaults to "cb58".
- `txID` is the transaction’s ID.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.issueTx",
    "params": {
        "tx":"111Bit5JNASbJyTLrd2kWkYRoc96swEWoWdmEhuGAFK3rCAyTnTzomuFwgx1SCUdUE71KbtXPnqj93KGr3CeftpPN37kVyqBaAQ5xaDjr7wVBTUYi9iV7kYJnHF61yovViJF74mJJy7WWQKeRMDRTiPuii5gsd11gtNahCCsKbm9seJtk2h1wAPZn9M1eL84CGVPnLUiLP",
        "encoding": "cb58"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "G3BuH6ytQ2averrLxJJugjWZHTRubzCrUZEXoheG5JMqL5ccY"
  },
  "id": 1
}
```

### platform&#46;listAddresses

List addresses controlled by the given user.

**Signature**

```sh
platform.listAddresses({
    username: string,
    password: string
}) -> {addresses: []string}
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.listAddresses",
    "params": {
        "username":"myUsername",
        "password":"myPassword"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "addresses": ["P-columbus1ffksh2m592yjzwfp2xmdxe3z4ushln9s09z5p0"]
  },
  "id": 1
}
```

### platform&#46;registerNode

Register a node with the consortium member address. So it can be used in other methods. (ex: [platform.addValidator](#platformaddvalidator))

**Signature**

```sh
platform.registerNode(
    {
        oldNodeID: string,
        newNodeID: string,
        consortiumMemberAddress: string,
        username: string,
        password: string
    }
) ->
{
    txID: string,
    changeAddr: string
}
```

- `oldNodeID` is node ID to change from `oldNodeID` to `newNodeID`. If there is none, same node ID can be provided as the new one.
- `newNodeID` is the node ID to be resgistered with the address.
- `consortiumMemberAddress` is the address of consortium member.
- `username` is the user name from keystore of the `camino-node`.
- `password` is the password of the user in the keystore.

:::info ONLY ONE NODE PER CONSORTIUM MEMBER
Please note that one Consortium Member (address) can be registered with **one and only one** `NodeID`.
:::

:::caution YOU NEED TO ADD PRIVATE KEYS
Please keep in mind that you need to import **private keys** of `consortiumMemberAddress` and `newNodeID` to your API node's keystore. Please see: [platform.importKey](#platformimportkey)
:::

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.registerNode",
    "params": {
        "oldNodeID": "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
        "newNodeID": "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
        "consortiumMemberAddress": "P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68",
        "username": "username",
        "password": "passw0rd"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "krj1ix5PEeHmd2C7son7uTDGMTr4DGFfCdzMdCbZfUstT3Fk2",
    "changeAddr": "P-kopernikus1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqv3qzan"
  },
  "id": 1
}
```

### platform&#46;sampleValidators

Sample validators from the specified Subnet.

**Signature**

```sh
platform.sampleValidators(
    {
        size: int,
        subnetID: string, //optional
    }
) ->
{
    validators: []string
}
```

- `size` is the number of validators to sample.
- `subnetID` is the Subnet to sampled from. If omitted, defaults to the Primary Network.
- Each element of `validators` is the ID of a validator.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.sampleValidators",
    "params" :{
        "size":2
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "validators": [
      "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
      "NodeID-PM2LqrGsxudhZSP49upMonevbQvnvAciv"
    ]
  }
}
```

### platform&#46;setAddressState

Issues an AddressStateTx transaction which assigns state to an address

**Signature**

```sh
platform.setAddressStateTx({
    from: []string, //optional
    changeAddr: string, //optional
    username: string,
    password: string


    address: string,
    state: int,
    remove: bool,
}) -> {
    txID: string
}
```

- `from` are the addresses that you want to use for this operation. If omitted, uses any of your addresses as needed.
- `changeAddr` is the address any change will be sent to. If omitted, UTXO's owner is not changed.
- `username` is the keystore user where `from` signing keys are fetched from.
- `password` is `username`‘s password.
- `address` is the address to change state for.
- `state` is the to set or unset (see remove).
- `remove` specifies if the state should be set or unset.

**Possible values for `state`**

```sh
    AddressStateRoleAdmin    = uint8(0)
    AddressStateRoleKyc      = uint8(1)

    AddressStateKycVerified    = uint8(32)
    AddressStateKycExpired     = uint8(33)

    AddressStateConsortium      = uint8(38)
    AddressStateNodeDeferred    = uint8(39)
```

:::info
Only signers with `AddressStateRoleAdmin` state are allowed to grant / revoke new roles.  
Only signers with `AddressStateRoleKyc` state are allowed to change KYC state flags.  
Only signers with `AddressStateRoleValidator` state are allowed to change Validator state flags.
:::

**Example Call**

```sh
curl -X POST --data '{
  "jsonrpc":"2.0",
  "id"     : 1,
  "method" :"platform.setAddressState",
  "params" :{
      "from":["P-columbus1m8wnvtqvthsxxlrrsu3f43kf9wgch5tyfx4nmf"],
      "username":"myUsername",
      "password":"myPassword",
      "address":"P-columbus1m8wnvtqvthsxxlrrsu3f43kf9wgch5tyfx4nmf",
      "state": 1,
      "remove": false
  }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/bc/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "2Kz69TNBSeABuaVjKa6ZJCTLobbe5xo9c5eU8QwdUSvPo2dBk3"
  },
  "id": 1
}
```

### platform&#46;validatedBy

Get the Subnet that validates a given blockchain.

**Signature**

```sh
platform.validatedBy(
    {
        blockchainID: string
    }
) -> {subnetID: string}
```

- `blockchainID` is the blockchain’s ID.
- `subnetID` is the ID of the Subnet that validates the blockchain.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.validatedBy",
    "params": {
        "blockchainID": "KDYHHKjM4yTJTT8H8qPs5KXzE6gQH5TZrmP1qVr1P6qECj3XN"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "subnetID": "2bRCr6B4MiEfSjidDwxDpdCyviwnfUVqB2HGwhm947w9YYqb7r"
  },
  "id": 1
}
```

### platform&#46;validates

Get the IDs of the blockchains a Subnet validates.

**Signature**

```sh
platform.validates(
    {
        subnetID: string
    }
) -> {blockchainIDs: []string}
```

- `subnetID` is the Subnet’s ID.
- Each element of `blockchainIDs` is the ID of a blockchain the Subnet validates.

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.validates",
    "params": {
        "subnetID":"2bRCr6B4MiEfSjidDwxDpdCyviwnfUVqB2HGwhm947w9YYqb7r"
    },
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/P
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "blockchainIDs": [
      "KDYHHKjM4yTJTT8H8qPs5KXzE6gQH5TZrmP1qVr1P6qECj3XN",
      "2TtHFqEAAJ6b33dromYMqfgavGPF3iCpdG3hwNMiart2aB5QHi"
    ]
  },
  "id": 1
}
```
