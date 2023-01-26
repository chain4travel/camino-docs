---
sidebar_position: 3
title: Add a Validator Node with cURL
description: How to add a Validator Node with cURL
---

# How to add a Validator Node with cURL

This guide will walk you through the process of linking your wallet address with your node ID, and then adding that node as a validator on the Camino network.

:::info Assumptions

This guide assumes that you have a running Camino node on your local machine that you will run the given commands on.
The IP address and port for the `camino-node` are `127.0.0.1` and `9650`, respectively.

| CAMINO-NODE IP |  PORT  |
| :------------: | :----: |
|  `127.0.0.1`   | `9650` |

If your node is located on the cloud or on a remote server, you will need to login to that machine using SSH and run the commands from the shell.

:::

:::note Validator Staking Port: `9651`

Please note that while this guide will use the API port `9650` for requests, you will need to open your server's staking port `9651` for your validator to function correctly. This is typically done through a firewall or a router/modem if you are on a residential ISP.

:::

## Requirements

Before starting the process of adding a validator node, there are a few requirements you must satisfy. Below is a list of these requirements
for the mainnet (`camino`) and testnet (`columbus`). If you have any questions or get stuck at any step, please feel free to reach out to us
on our [Discord](https://discord.gg/camino) server for assistance.

Further below, you will find instructions about how to get these information by querying your node (where applicable).

### **Camino Mainnet** & **Columbus Testnet**

- **NodeID**: This is the address of your node, similar to a regular wallet address.
- **Node's PrivateKey**: You will need this to prove ownership of the **NodeID**.<br/>
  Keep it safe and secure!
- **Wallet address & private key**: You will need your wallet address and private key.<br/>
  Remember to keep your private key safe!
- **100,000 unlocked CAMs** in your P-Chain wallet.<br/>
  You can check this on the online [wallet](https://wallet.camino.network) to ensure that you have at least 100,000 unlocked tokens on the P-Chain.
- **Consortium Member**: Your wallet address must be a consortium member.<br/>
  If you are unsure about this, please reach out to us on [Discord](https://discord.gg/camino) for clarification. If you participated in the pre-sale, you are already a Consortium Member.
- **KYC/KYB Verified**: You must be Know-Your-Customer (KYC) and Know-Your-Business (KYB) verified.

:::note PRE-SALE PARTICIPANTS

Pre-sale participants have already been designated as Consortium Members on the mainnet and testnet, and they have also completed the Know-Your-Customer (KYC) verification process.

:::

## Retrieving Your Node's ID

When you first set up your node, your node's ID will be displayed in the terminal, depending on the installation method you used.
If you made note of it, you can simply use that ID. If you did not, you can retrieve that information by making a request to the `camino-node`'s Info API.

The following is an example of how to do so using `curl` commands.

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

## Retrieving Your Node's Private Key

You can retrieve your node's private key by making a request to the Admin API's `admin.getNodeSigner` method.

The following is an example of how to do so using `curl` command.

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

## Retrieving Your Wallet Private Key

If you already got your wallet address go to the [Camino Wallet](https://wallet.camino.network) and retrieve your private key from the Manage Keys menu.

If you don't know your address, when you created your wallet on the [Camino Wallet](https://wallet.camino.network), it prompted you to write down a key phrase.

By using this key phrase, you can recover your wallet address and extract your private key. Log in to your wallet and click **Manage Keys** from the menu.
Under **My Keys**, you will see your wallet address. There will be a button named **View C-Chain Private Key** right beside your address.

:::caution ON-GOING DEVELOPMENT

It's important to note that the **Camino Wallet** is undergoing heavy development and is subject to frequent updates and changes. As a result, the instructions provided above **may be outdated**.

:::

:::danger METHOD FOR EXTRACTING P-CHAIN PRIVATE KEY

This part is under development. Until then, please ask at [Discord](https://discord.gg/camino).

:::

## Transferring Tokens to the P-Chain

In order to stake for your validator, you will need to have **100,000 unlocked CAM** tokens on the P-Chain. If you do not already have them on the P-Chain, you will need to transfer them.

You can use the [Camino Wallet](https://wallet.camino.network) to perform this transfer. Simply click on **Cross Chain** in the main menu and follow the prompts in the user interface.

## Consortium Member

If you participated in the pre-sale and provided a wallet address, you are already designated as a **Consortium Member**.

If you are not or you wish to be added as one for the Camino Testnet `columbus`, please contact us through [Discord](https://discord.gg/camino).

## Know-Your-Customer & Know-Your-Business Verification

In order to complete a KYC (Know Your Customer) verification on Camino Network, you can log in to the [Camino Wallet](https://wallet.camino.network) and click the "KYC Verification" button.
A pop-up window will appear, prompting you to provide your email and phone number. Follow the instructions provided to complete the verification process, which will require you to submit some form of identification.

Additionally, the KYC process can be continued on your phone after starting it on a browser, allowing for greater convenience and flexibility. For more information on the KYC process, please refer to the [KYC](kyc.md) page.

Please note that the KYB process is currently in development and documentation will be updated soon. In the meantime, if you need assistance, please reach out to the Camino community on [Discord](https://discord.gg/camino) for help.

:::tip KYC/KYB Process & Privacy

Please be aware that the KYC/KYB process **will not expose** your private information on the blockchain. The process is completed off-chain, and your wallet address is only marked as _"kyc-verified"_ on the blockchain.

No private information is saved on the network.

:::

## Becoming a Validator

If you have all the necessary requirements and information to become a Validator, you can now commit this information to the blockchain.
To do this, you need to follow these steps:

Below is a summary of the steps you will take:

1. **Create user** on your node's _keystore_
2. **Import** your wallet and node's private key to the keystore
3. **Register your node** with your wallet address
4. **Add** your node **as a validator**
5. **Check the status** of the validator

Now let's see how you can complete these steps using `curl` API requests.

## Create User on Your Node

To interact with some of the API methods on your node, you will need to have a username and password. The first step in this process is to create a user.

Users are stored in the keystore on your node. It is important to note that for validation and delegation on the mainnet, it is recommended to use the [wallet on Camino Network](https://wallet.camino.network) to issue transactions. This ensures that private keys for your funds are not stored on your node, significantly reducing the risk in the event that the computer running the node is compromised.

:::note

If you already have a user that you created previously, you can skip this step.

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

As you can see, the password you provided is not secure enough to be accepted. It is important to provide a stronger password to ensure the security of your user account. A strong password typically includes a combination of uppercase and lowercase letters, numbers, and special characters, and is at least 8 characters long.

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

- Now that you have received a successful response, it is important to keep your password in a safe and secure location. It is highly recommended to use a password manager that provides encryption to protect your password.

:::

## Information About Keystores

:::tip WHAT IS A KEYSTORE

Every node has an integrated keystore. Clients can create users on the keystore, which serve as identities when interacting with the node's API methods. These interactions allow access to the blockchain and its features.

:::

:::caution KEYSTORE IS PRIVATE TO YOUR NODE

A keystore exists at the node level, so if you create a user on a node, it will exist **only** on that specific node. However, it is possible to import and export users using the API, allowing them to be used on multiple nodes.

:::

:::danger SECURITY - THIS IS VERY IMPORTANT

_**It is important to only create a keystore user on a node that you operate, as the node operator will have access to your plaintext passwords and private keys. Therefore, it is important to trust the operator of the node before creating a keystore user on it.**_

:::

## Import Wallet & Node Private Keys

In order to prove ownership of the wallet and the node, you will need to add your private keys to the keystore on the node. This process is also known as importing a private key, and it allows you to use the keystore user you created to interact with the node's API methods and access the blockchain.

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

Enter the private key associated with your wallet address into the `privateKey` field.

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

This is a successful response. It's important to note that the result field contains an `address`, which is the address that the private key you provided controls. You can use this to verify that the private key is correct and that it matches your wallet address. This helps to ensure that you have imported the correct private key and that you have successfully proven ownership of the wallet.

:::

:::note INFO ABOUT ADDRESSES

The addresses you see here will start with one of the following strings, depending on the network you are using:

- **mainnet**: `P-camino`
- **testnet**: `P-columbus`
- **devnet**: `P-kopernikus`

:::

Now that you have imported the private key for your wallet, you will need to import the private key for your node. This allows you to prove ownership of the node.

Please follow the same step as you did for importing your wallet private key, but this time using the **private key of your node**.

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

Note that, similar to when you imported your wallet's private key, the result field contains an `address` after importing your node's private key. In Camino, nodes also have addresses that can be used to send and receive funds. Users can also use their (node's) private keys to control these addresses.

:::

## Register Your Node

After importing your node's private key, it's now necessary to register your node with your wallet. This will establish a link between your node and wallet and enable you to interact with functions that require this feature, such as the `platform.addValidator` method.

To register your node, you will need to use the appropriate API method and provide the necessary information:

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

- **oldNodeID**: Enter your current node's ID (if you have one) in this field. This field can also be used to change your registered node in the future.
- **newNodeID**: Enter your new node's ID here.
- **consortiumMemberAddress**: Enter the address of your wallet in this field where you have imported the private key in the previous step. This will link your wallet with your node.

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

The response of this registration process will include two fields:

**txID**: This is the submitted transaction that will register the node. You can use this ID to check the status of the transaction on [Camino Explorer](https://explorer.camino.network/)
**changeAddr** is the address used to return any unspent tokens after the transaction is completed. In this case, it is not important.

:::

:::note MORE ABOUT NODE REGISTRATION

Node registration links your node with the wallet address you provided. This allows Camino to use wallet addresses, including **multi-signature wallets**, for operations related to the node, such as adding it as a validator. It's important to keep in mind that if your wallet is a multi-signature wallet, you will need to import all the private keys associated with it.

This way, all operations that require the node's signature will also require the signature of the linked wallet. This effectively creates _a multi-signature setup_, where multiple parties need to sign off on an action before it can be executed.

For example, if a voting operation is in place, to successfully vote, signatures from the linked wallet will also be required. This ensures that the node and wallet owner are both in agreement and have authorized the action before it is executed on the blockchain.

:::

## Make Your Node a Validator

Now that you have registered your node and linked it with your wallet, you are ready to make your node a validator.

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

- **nodeID**: Enter the ID of your node.

- **from**: Your wallet address. <br/>
  Note that this field is a list. So even if you are entering a single address, you need to enclose it with square brackets.

- **rewardAddress**: The address where the rewards earned by the validator will be sent.

- **startTime**: Starting time of the validation period for the node. <br/>
  This in **Unix Time** format, which is represented as the number of seconds since `1970-01-01 00:00:00 UTC`. <br/>
  To get this value, you can use the date command. In this example, we used _10 minutes in the future_ as the `startTime`. <br/>
  Change this as you like, but be sure that it has to be at least _20 seconds_ in the future.<br/>
  (Note: If you’re on a Mac, replace `date` with `gdate`. If you don’t have `gdate` installed, do `brew install coreutils`.)

- **endTime**: The time when the validation period ends. It is in the same format as `startTime`. In this example we used _2 days_ in the future.
  For Camino mainnet, the minimum `endTime` is **2 weeks** and maximum is **365 days**.

- **stakeAmount**: This is the _**fixed**_ amount of tokens to be staked. For Camino mainnet `camino` and testnet `columbus` it is `100000000000000` nCAMs (100,000 CAMs). (For devnet `kopernikus` it is 2000 CAMs)

- **delegationFeeRate**: This is the percentage fee that this validator charges when others delegate their stake to them.<br/>
  Up to 4 decimal places are allowed, additional decimal places are ignored. It must be between 0 and 100, inclusive.<br/>
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

This response shows the transaction ID for your `addValidator` request. You can use this ID to check the status of the transaction on the blockchain explorer, like [Camino Explorer](https://explorer.camino.network/).

Once the transaction is confirmed, your node will be registered as a validator and you will be able to participate in the consensus process and earn rewards.

:::

## Verify Your Validator

Now you can verify if you have completed the process correctly by querying the blockchain and checking the status of your node.

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

- **nodeIDs**: Enter your node's ID in this field.<br/>
  Alternatively, you can leave this field blank and simply enter `"nodeIDs":[]`. This will return information for all currently registered validators.

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

Here you can see that your node is now a **validator**! Congratulations!

It's important to note that this request should only be made after some time has passed to ensure that the `startTime` specified during the registration process has been reached. This will ensure that the node has been activated as a validator and its status can be properly determined.

:::

### If you get an empty response

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

It's possible that the `startTime` specified during the registration process has not yet been reached. **Please check next step where you can query for pending validators.**

It could also mean that the node is not yet a validator, the node id provided is incorrect or the node id provided is not registered as a validator.

It may be helpful to cross-reference the node id and other details with the information provided during the registration process. Please check the status of the transaction and ensure that the registration process was completed successfully and with the correct information.

:::

### Check Pending Validators

:::info REQUEST PENDING VALIDATORS

You can also check for pending validators to see if your node is waiting for the `startTime` to be reached before it can be activated as a validator.

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

Here you can see that your node is still listed among the pending validators. It is waiting for its `startTime` to be reached.

It is recommended to wait for the `startTime` to pass and then check again using the **[getCurrentValidators](#verify-your-validator)** method to confirm that your node has been activated as a validator.

:::

:::caution PENDING VALIDATORS

It's important to note that nodes that are pending validators have completed the registration process but have not yet reached the `startTime` specified during registration. Once the `startTime` is reached, the node will be activated as a validator on the blockchain.

:::

## Getting More Help

If you have any further questions about validators, you can refer to the [Validators FAQ](/faq/validator) section on our website or visit our [Discord](https://discord.gg/camino) server.
We are always happy to help and chat.

Please don't hesitate to reach out if you need any further assistance.
