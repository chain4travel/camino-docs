---
sidebar_position: 5
description: How to add a validator node
---

# How to add a Validator Node

This guide walks you through the process of linking your wallet address with your node ID and then adding that node
as a validator.

:::info Assumptions

This guide assumes you have a running `camino-node` on your local machine that you run the given commands on.

| CAMINO-NODE IP |  PORT  |
| :------------: | :----: |
|  `127.0.0.1`   | `9650` |

This machine may also be located on the cloud or on a remote server. In that situation, you need to login to that
machine with SSH and run the commands from the shell.

:::

:::note Validator Staking Port: 9651

In this guide we will use the **API port** `9650` for the requests. But, please keep in mind, for your validator
to work correctly, you need to open your server's **staking port** `9651`. This is generally done from a firewall, or from a router/modem if
on residential ISP.

:::

## Requirements

There are a few requirements you have to satisfy before you can start the process of adding a validator node.
Below is a list of these requirements for Camino Mainnet (`mainnet`) and Camino Testnet (`columbus`).

If you got stuck or have any questions about any of the steps, feel free to ask us at our [Discord](https://discord.gg/camino) server.

Further below, you will find instructions about how to get these information by querying your node (where applicable).

### Requirements: **Camino Mainnet**

You will need:

- **NodeID** of your node. <br/>
  Note that this actually is an address, just like a reqular wallet address.
- **PrivateKey** of your node. <br/>
  You will need this to prove that you own the **NodeID**. Keep it safe!
- **100k unlocked CAMs** in your P-Chain wallet. <br/>
  Check from online [wallet](https://wallet.camino.network) that you have the at least 100k unlocked tokens on P-Chain.
- **Wallet address & private key** <br/>
  You will need your wallet address and private key. Again, keep your private keys safe!
- **Consortium Member** <br/>
  Your wallet address needs to be consortium member. If you don't know what this is drop by [Discord](https://discord.gg/camino) and ask us. <br/>
  If you are a partner and participated the pre-sale, you are already a Consortium Member.
- **KYC/KYB Verified**
  You need to be KYC/KYB (Know-Your-Customer & Know-Your-Business) verified.

### Requirements: **Columbus Testnet**

- **NodeID** of your node. <br/>
  Note that this actually an address, just like a reqular wallet address.
- **PrivateKey** of your node. <br/>
  You will need this to prove that you own the **NodeID**. Keep it safe!
- **100k unlocked CAMs** in your P-Chain wallet. <br/>
  Check from online [wallet](https://wallet.camino.network) that you have the at least 100k tokens on P-Chain.
- **Wallet address & private key** <br/>
  You will need your wallet address and private key. Again, keep your private keys safe!
- **Consortium Member** <br/>
  Your wallet address needs to be consortium member. If you want to add your node for testing purposes, get into our [Discord](https://discord.gg/camino),
  say hi and tell us that you want to become a member and add a validator.
- **KYC/KYB Verified**
  You need to be KYC/KYB (Know-Your-Customer & Know-Your-Business) verified.

:::note PRE-SALE PARTICIPANTS

Pre-sale participants are already marked as Consortium Member on the `mainnet` and `testnet` and also are KYC verified.

:::

### How to get your node's ID

When you first installed your node, your node's ID is printed to the terminal, depending on the installation method. If you have noted that, you can
just use it. If you didn't, we can request that information from the `camino-node`'s **Info API**. Below is an example about how to do it with `curl` commands.

:::info Request

```sh
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"info.getNodeID"
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/info
```

:::

:::info Response

```json
{
  "jsonrpc": "2.0",
  "result": {
    "nodeID": "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
    "nodePOP": {}
  },
  "id": 1
}
```

In this example, your **NodeID** is `NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ`

:::

### How to get your node's private key

You can query your node's private key from the **Admin API**'s `admin.getNodeSigner` method. Below is an example how to do that using `curl` commands.

If you already have your node's private key, you can skip this step.

:::info Request

```sh
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.getNodeSigner",
    "params": {
    }
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/admin
```

:::

:::info Response

```json
{
  "jsonrpc": "2.0",
  "result": {
    "privateKey": "PrivateKey-2ZW6HUePBW2dP7dBGa5stjXe1uvK9LwEgrjebDwXEyL5bDMWWS",
    "publicKey": "D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ"
  },
  "id": 1
}
```

In this example your **Node**'s **PrivateKey** is `PrivateKey-2ZW6HUePBW2dP7dBGa5stjXe1uvK9LwEgrjebDwXEyL5bDMWWS`.

And you can also see your public key (your node's address, also known as `NodeID`)

:::

### Transfering Tokens to P-Chain

You need to have tokens on **P-Chain**. You will use these to stake for the validator. So, if you do not already have them on P-Chain, you need to transfer them.

For this you can use [Camino Wallet](https://wallet.camino.network) and click on **Cross Chain** and follow the menus in the UI.

### Wallet Address & Private Key

This you probably already have. When you created your wallet on [Camino Wallet](https://wallet.camino.network) it prompts you to write down your key phrase.

Using this key phrase you can recover your wallet and also extract your private key.

Login to your wallet. From the left panel click **Manage Keys**. Under **My Keys** you will see your wallet address.
Right side of your address there will be button named **Export Keys**.

:::caution ON-GOING DEVELOPMENT

**Camino Wallet** is under heavy development and changing fast. Keep in mind that instructions above **may be outdated**.

:::

:::danger METHOD FOR EXTRACTING PRIVATE KEY

This part is under development. Until then, please ask at [Discord](https://discord.gg/camino).

:::

### Consortium Member

If you participated to the pre-sale and provided a wallet address, you are probably already a **Consortium Member**.

If you are not or you want to be added as one for Camino Testnet `columbus`, please get in touch with us through [Discord](https://discord.gg/camino).

### Know-Your-Customer & Know-Your-Business Verification

KYC/KYB process is in the development stage. Documentation will be updated, check here soon! Until that time get help from [Discord](https://discord.gg/camino).

:::tip KYC/KYB Process & Privacy

Please note that KYC/KYB process **is not going** to expose your private information on the blockchain.
Process is finalized off-chain and your wallet address is only marked as "kyc-verified" on the blockchain.

No private information is saved on the network.

:::

## Becoming a Validator

Until now, you should have all the requirements & information to become a Validator. Now, you need to commit this information to the blockchain.
To do that, you need to follow some steps.

Below is a summary of the steps we will follow. They will be explained with examples through the document.

1. **Create user** on our node's _keystore_
2. **Import** our wallet and node's private key
3. **Register our node** with our wallet address
4. **Add** our node **as a validator**
5. **Check the status** of the validator

Now let's see how we can do these steps with `cURL` API requests.

### Create User on Your Node

In order to interact with some of your node's API methods, you need to have a username and password. For this, we first need to create that user.

Users are stored in your node's **keystore**.

For validation and delegation on the mainnet, you should issue transactions through [the wallet](https://wallet.camino.network).
That way private keys for your funds won't be stored on your node, which significantly lowers the risk, should a computer running a node be compromised.

:::note

If you already have a user, that you have created before, you can skip this step.

:::

:::info Request

```sh
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"keystore.createUser",
    "params" :{
        "username": "myUsername",
        "password": "myPassword"
    }
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/keystore
```

:::

:::caution Response

```json
{
  "jsonrpc": "2.0",
  "error": {
    "code": -32000,
    "message": "password is too weak",
    "data": null
  },
  "id": 1
}
```

:::

As you can see, the password we provided is too weak to be acceptable. you need to provide a stronger password:

:::info Request

```sh
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"keystore.createUser",
    "params" :{
        "username": "myUsername",
        "password": "ZMHiL8mTGJHu"
    }
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/keystore
```

- Please don't use the password you see here. :)

:::

:::info Response

```json
{
  "jsonrpc": "2.0",
  "result": {},
  "id": 1
}
```

- Now we have a successful response. Keep your password in a safe place. Ideally, use a password manager that does encryption.

:::

### Information About Keystores

:::tip WHAT IS A KEYSTORE

Every node has a _built-in_ keystore. Clients create users on the keystore, which act as identities to be used when interacting with the node's API methods.
Which interacts with blockchains.

:::

:::caution KEYSTORE IS PRIVATE TO YOUR NODE

A keystore exists at the node level, so if you create a user on a node it exists _**only**_ on that node. However, users may be imported and exported using this API.

:::

:::danger SECURITY - THIS IS VERY IMPORTANT

_**You should only create a keystore user on a node that you operate, as the node operator has access to your plaintext passwords & private keys.**_

:::

### Import Wallet & Node Private Keys

In order to prove that we own the wallet and the node, you need to add your private keys into the node's keystore.

:::info Request

```sh
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.importKey",
    "params" :{
        "username": "myUsername",
        "password": "ZMHiL8mTGJHu",
        "privateKey":"PrivateKey-ewoqjP7PxY4yr3iLTpLisriqt94hdyDFNgchSxGGztUrTXtNN"
    }
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/keystore
```

Enter the private key of your wallet address into the `privateKey` field.

:::

:::info Response

```json
{
  "jsonrpc": "2.0",
  "result": {
    "address": "P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68"
  },
  "id": 1
}
```

This is a successful response. Note the result field contains an `address`. This is the address that the private key we provided controls.
You can use this to verify that private key is correct. This should be your wallet address.

:::

:::note INFO ABOUT ADDRESSES

The addresses you see here will start with one of strings below depending on the network you are using.

- **mainnet**: `P-camino`
- **testnet**: `P-columbus`
- **devnet**: `P-kopernikus`

:::

Now you need to import your **node's private key**:

:::info Request

```sh
curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"platform.importKey",
    "params" :{
        "username": "myUsername",
        "password": "ZMHiL8mTGJHu",
        "privateKey":"PrivateKey-2ZW6HUePBW2dP7dBGa5stjXe1uvK9LwEgrjebDwXEyL5bDMWWS"
    }
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/keystore
```

Enter the private key of your node into the `privateKey` field.

:::

:::info Response

```json
{
  "jsonrpc": "2.0",
  "result": {
    "address": "P-kopernikus1swcam4a3vmd7vvzuytldtavsv4f9cnj3lynmrf"
  },
  "id": 1
}
```

Note that **again**, the result field contains an `address`. In Camino, node's also has addresses that can be used to send & receive funds.
Users can also use their (node's) private keys to control these addresses.

:::

### Register Your Node

Now you need to register your node with your wallet. This will link your node and wallet and enable you to interact with functions that require this feature
like the `platform.addValidator` method.

:::info Request

```sh
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.registerNode",
    "params": {
        "oldNodeID": "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
        "newNodeID": "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
        "consortiumMemberAddress": "P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68",
        "username": "myUsername",
        "password": "ZMHiL8mTGJHu"
    },
    "id": 1
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/bc/P
```

- **oldNodeID**: Enter your node's ID here. This field can also be used to change your registered node in future.
- **newNodeID**: Enter your node's ID here.
- **consortiumMemberAddress**: Enter your wallet address here that you have imported the private key in the previous step.

:::

:::info Response

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "dkcfLECeCiEDwidaWeXBkfB3ea6bYupcrReqbDg3cKrHy3MC1",
    "changeAddr": "P-kopernikus1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqv3qzan"
  },
  "id": 1
}
```

The response will have two fields. **txID** is the submited transaction that will register the node.
You can use this ID to check the status of the transaction from [Camino Explorer](https://explorer.camino.network/)

**changeAddr** is the address used to return unspend tokens. In this situation it is not important.

:::

:::note MORE ABOUT NODE REGISTRATION

Node registration links your node with the wallet address you provided. This allows Camino to use wallet addresses, which can be **multi signature wallets**, about things
related to the node operation. For example adding it as a validator. (So you need to import all your private keys if your wallet is **MultiSig**)

This way all operations that will require node's signature will also require linked wallet signature. And this effectively makes the **MultiSig**.

For example, let's say a voting operation is in place, to successfully vote, linked wallet's signatures are also needed.

:::

### Make Your Node a Validator

Now you are ready to make your node a validator.

:::info Request

```sh
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.addValidator",
    "params": {
        "nodeID":"NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
        "from": ["P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68"],
        "rewardAddress": "P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68",
        "startTime":'$(date --date="10 minutes" +%s)',
        "endTime":'$(date --date="2 days" +%s)',
        "stakeAmount":2000000000000,
        "delegationFeeRate":10,
        "username": "myUsername",
        "password": "ZMHiL8mTGJHu"
    },
    "id": 1
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/bc/P
```

- **nodeID**: Enter your node's ID

- **from**: Your wallet address. <br/>
  Note that this field is a list. So even if you are going to enter a single address, you need to enclose is with square brackets.

- **rewardAddress**: The address that the validator rewards will be sent to.

- **startTime**: Starting time of the validation period for the node. <br/>
  This in **Unix Time** format, it is `seconds since 1970-01-01 00:00:00 UTC`. <br/>
  To get this value we use `date` command. In this example we used **10 minutes** _in the future_ as the `startTime`. <br/>
  Change this as you like. Just be sure that it has to be at least _20 seconds_ in the future.<br/>
  (Note: If you’re on a Mac, replace `date` with `gdate`. If you don’t have `gdate` installed, do `brew install coreutils`.)

- **endTime**: The time that the validation period ends. It is the same format as `startTime`. In this example we used _2 days_ in the future.
  For Camino mainnet, you need minimum **2 weeks** and maximum **365 days** for the `endTime`.

- **stakeAmount**: This is the _**fixed**_ amount of tokens to stake. For Camino mainnet `camino` and testnet `columbus` it is `100000000000000` nCAMs (100k CAMs). (For devnet `kopernikus` it is 2k CAMs)

- **delegationFeeRate**: This is the percent fee this validator charges when others delegate stake to them.<br/>
  Up to 4 decimal places allowed; additional decimal places are ignored. Must be between 0 and 100, inclusive.<br/>
  For example, if `delegationFeeRate` is `1.2345` and someone delegates to this validator, then when the delegation period is over, `1.2345%` of the reward goes to the validator and the rest goes to the delegator.

:::

:::info Response

```json
{
  "jsonrpc": "2.0",
  "result": {
    "txID": "2m47Hp59WiqeYGvWcjgkB5a2Gz4PNJCyQZbuMQTCjJ6xVV85oo",
    "changeAddr": "P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68"
  },
  "id": 1
}
```

This response shows the transaction ID for your `addValidator` request. You can use this ID to check the status of the transaction.

:::

### Verify Your Validator

Now you can verify if you did everything correctly. To do this, you will query the blockchain and look for the status of your node.

:::info REQUEST

```sh
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getCurrentValidators",
    "params": {
        "subnetID":null,
        "nodeIDs":["NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ"]
    },
    "id": 1
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/bc/P
```

- **nodeIDs**: Enter your node ID here. You can also omit this and just enter as `"nodeIDs":[]`<br/>
  This way the response will return all the current validators.

:::

:::info Response

```json
{
  "jsonrpc": "2.0",
  "result": {
    "validators": [
      {
        "txID": "2m47Hp59WiqeYGvWcjgkB5a2Gz4PNJCyQZbuMQTCjJ6xVV85oo",
        "startTime": "1672836683",
        "endTime": "1678009764",
        "stakeAmount": "2000000000000",
        "nodeID": "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
        "rewardOwner": {
          "locktime": "0",
          "threshold": "1",
          "addresses": ["P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68"]
        },
        "validationRewardOwner": {
          "locktime": "0",
          "threshold": "1",
          "addresses": ["P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68"]
        },
        "delegationRewardOwner": {
          "locktime": "0",
          "threshold": "1",
          "addresses": ["P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68"]
        },
        "potentialReward": "0",
        "delegationFee": "0.0000",
        "uptime": "1.0000",
        "connected": true,
        "delegators": null
      }
    ]
  },
  "id": 1
}
```

Here you can see that your node is a **validator** now! Congragulations!

**Please note** that this request is done after some time have passed. (To be sure that the `startTime` is reached)

:::

#### If you get an empty response

:::caution EMPTY RESPONSE

If you get and empty response like this:

```json
{
  "jsonrpc": "2.0",
  "result": {
    "validators": []
  },
  "id": 1
}
```

It means either your `startTime` is not reached yet or you had some errors in the previous steps.

:::

#### Check Pending Validators

:::info REQUEST PENDING VALIDATORS

You can ask for pending validators, to check if your node is waiting for the `startTime`, as below:

```sh
curl -s -X POST --data '{
    "jsonrpc": "2.0",
    "method": "platform.getPendingValidators",
    "params": {
        "subnetID": null,
        "nodeIDs": []
    },
    "id": 1
}' -H 'content-type:application/json;' http://127.0.0.1:9650/ext/bc/P
```

:::

:::info RESPONSE

```json
{
  "jsonrpc": "2.0",
  "result": {
    "validators": [
      {
        "txID": "2m47Hp59WiqeYGvWcjgkB5a2Gz4PNJCyQZbuMQTCjJ6xVV85oo",
        "startTime": "1672836683",
        "endTime": "1678009764",
        "stakeAmount": "2000000000000",
        "nodeID": "NodeID-D1LbWvUf9iaeEyUbTYYtYq4b7GaYR5tnJ",
        "delegationFee": "0.0000",
        "connected": true,
        "delegators": null
      }
    ],
    "delegators": []
  },
  "id": 1
}
```

Here you can see that your node is still in pending validators list. It waits for its `startTime`.

Wait for the `startTime` to pass and check again with **[getCurrentValidators](#verify-your-validator)**

:::

## Getting More Help

If you have more questions about Validators, you can check [Validators FAQ](../../faq/validator.md) or walk by our [Discord](https://discord.gg/camino) server and say hi! We love to chat!
