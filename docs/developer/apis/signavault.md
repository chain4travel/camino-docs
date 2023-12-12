---
description: "This API allows clients to interact with Signavault, the middleware responsible for handling multisig transactions."
sidebar_position: 2
---

# Signavault API

### Format

This API uses GET, PUT and POST HTTP requests with either URL query parameters or JSON payloads and returns JSON data.

### Versioning

Starting with API version 1, the request paths will be prefixed by a version tag, e.g. `http://localhost:8080/v1/multisig`.

### Data Types

In addition to integers, strings, and booleans, the following data types are used throughout the API:

| Name           | Description                                                                 | Examples                                                                               |
| :------------- | :-------------------------------------------------------------------------- | :------------------------------------------------------------------------------------- |
| `id`           | A CB58 encoded object identifier, such as a chain, transaction, or asset ID | `2oYMBNV4eNHyqk2fjjV5nVQLDbtmNJzq5s3qs3Lo6ftnC6FByM`                                   |
| `address`      | A bech-32 encoded address (used on the X-Chain and P-Chain)                 | `fuji1wycv8n7d2fg9aq6unp23pnj4q0arv03ysya8jw`                                          |
| `timestamp`    | A Unix timestamp as a string                                                | `1599696000`                                                                           |
| `outputOwners` | An object consisted of the fields `{threshold, locktime, addresses[]}`      | `{threshold: 1, locktime: 0, ["P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68"]}` |

## Available Endpoints

### Create Multisig Transaction

This endpoint will create a new multisig transaction for collecting signatures. The client provides the alias, unsignedTx, and the signature.
The signature’s payload contains the unsigned transaction and is signed with the owner's private key.
The public key is used to verify that the creator of the transaction is an owner for this alias.
The response will return the same object with a list of the owners and the alias threshold as obtained from the Node API.
Note that an empty transactionId is denoting the fact that this is a pending transaction.

**Params**

| Name                | Type     | Description                                                                                 | Default | Optional |
| :------------------ | :------- | :------------------------------------------------------------------------------------------ | :------ | :------- |
| `unsignedTx`        | `string` | An unsigned transaction.                                                                    | None    | No       |
| `alias`             | `id`     | The multisig alias issuing the transaction.                                                 | None    | No       |
| `signature`         | `string` | The unsigned transaction signed with the owner's private key.                               | None    | No       |
| `outputOwners`      | `string` | A hex encoded representation of the object `outputOwners`                                   | None    | No       |
| `metadata`          | `string` | A string which can contain for example the signature of a node that wants to be registered. | None    | Yes      |
| `expiration`        | `int`    | A Unix timestamp as an integer                                                              | None    | Yes      |
| `parentTransaction` | `string` | A hex represantation of the parent transaction of the unsignedTx (not yet evaluated)        | None    | Yes      |

**Result Types**

| Name           | Description                                                   |
| :------------- | :------------------------------------------------------------ |
| `unsignedTx`   | Pending unsigned Tx                                           |
| `alias`        | Multisig Alias                                                |
| `signature`    | The unsigned transaction signed with the owner's private key. |
| `outputOwners` | A hex encoded representation of the object `outputOwners`     |
| `metadata`     | Metadata                                                      |

**Example Call**

```sh
curl -X POST --data '{
  "unsignedTx": "00000000200400003039010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e4a36162",
  "alias": "P-kopernikus1k4przmfu79ypp4u7y98glmdpzwk0u3sc7saazy",
  "signature": "83a657db18ff50438d418db9bde239a47bca2d910114aa0cc68ac736053c96c46b300f2c28d0ff6c8587ae916b66b5d575a731d8ecc37abee3c96bdc23dcd88b007c40d266",
  "outputOwners": "5b3e388c6da941fe35428251f2b6f3a8ba72f84b88b980126882ff11f083be85",
  "metadata": "602dac34ce89aec2ae19fa1a025ee6d8"
}' -H 'content-type:application/json;' http://localhost:8080/v1/multisig
```

**Example Response**

```json
{
  "id": 25,
  "unsignedTx": "00000000200400003039010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e4a36162",
  "alias": "P-kopernikus1k4przmfu79ypp4u7y98glmdpzwk0u3sc7saazy",
  "threshold": 2,
  "transactionId": "",
  "owners": [
    {
      "address": "P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68",
      "signature": "0x83a657db18ff50438d418db9bde239a47bca2d910114aa0cc68ac736053c96c46b300f2c28d0ff6c8587ae916b66b5d575a731d8ecc37abee3c96bdc23dcd88b007c40d266"
    },
    {
      "address": "P-kopernikus1g65uqn6t77p656w64023nh8nd9updzmxh8ttv3",
      "signature": ""
    }
  ],
  "outputOwners": "5b3e388c6da941fe35428251f2b6f3a8ba72f84b88b980126882ff11f083be85",
  "metadata": "602dac34ce89aec2ae19fa1a025ee6d8"
}
```

### Get Multisig Transactions

This endpoint will return an array of all pending transactions for the alias specified with the path parameter **:alias**

**Params**

| Name        | Type        | Description                                                                                                                                                                                           | Default |
| :---------- | :---------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------ |
| `alias`     | `string`    | Multisig alias                                                                                                                                                                                        |
| `signature` | `string`    | The payload that will be signed must contain the alias and the timestamp. <br/>The values are concatenated together as a string and then signed with the owner’s private key composing the signature. | None    |
| `timestamp` | `timestamp` | Unix epoc h as string                                                                                                                                                                                 | None    |

Example signature:

```text
signature = alias + timestamp
"P-kopernikus1k4przmfu79ypp4u7y98glmdpzwk0u3sc7saazy" + "1678877386" = "P-kopernikus1k4przmfu79ypp4u7y98glmdpzwk0u3sc7saazy1678877386"
```

**Result Types**

| Name            | Description                                               |
| :-------------- | :-------------------------------------------------------- |
| `id `           | Signavault's Id for the Tx                                |
| `unsignedTx`    | Pending unsigned Tx                                       |
| `alias`         | Multisig Alias                                            |
| `threshold`     | Threshold                                                 |
| `transactionId` | Transaction ID                                            |
| `owners`        | Array of Owners consisting of address and signature       |
| `outputOwners`  | A hex encoded representation of the object `outputOwners` |
| `metadata`      | Metadata                                                  |

**Example Call**

```text
curl http://localhost:8080/v1/multisig/P-kopernikus1k4przmfu79ypp4u7y98glmdpzwk0u3sc7saazy?signature=0x0a37aad4c335126640cc45b90943bcd39d0a17e0f06679dfd02b31fc0b09317c35f6e0cd6f9851966f73eccfaca6558824145cfb52bfffb68e562344c3a7db3d0040efa909&timestamp=1678877386
```

**Example Response**

```json
[
  {
    "id": 25,
    "unsignedTx": "00000000200400003039010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e4a36162",
    "alias": "P-kopernikus1k4przmfu79ypp4u7y98glmdpzwk0u3sc7saazy",
    "threshold": 2,
    "transactionId": "",
    "owners": [
      {
        "address": "P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68",
        "signature": "0x83a657db18ff50438d418db9bde239a47bca2d910114aa0cc68ac736053c96c46b300f2c28d0ff6c8587ae916b66b5d575a731d8ecc37abee3c96bdc23dcd88b007c40d266"
      },
      {
        "address": "P-kopernikus1g65uqn6t77p656w64023nh8nd9updzmxh8ttv3",
        "signature": ""
      }
    ],
    "outputOwners": "5b3e388c6da941fe35428251f2b6f3a8ba72f84b88b980126882ff11f083be85",
    "metadata": "602dac34ce89aec2ae19fa1a025ee6d8"
  }
]
```

### Sign Multisig Transaction

This endpoint will add a new signer on an existing Multisig transaction identified by the :id

**Params**

| Name        | Type     | Description                                                                                           | Default |
| :---------- | :------- | :---------------------------------------------------------------------------------------------------- | :------ |
| `id `       | `id`     | Signavault's Id for the Tx                                                                            | None    |
| `signature` | `string` | The signature’s payload contains the unsigned transaction and is signed with the owner's private key. | None    |

**Result Types**

| Name            | Description                                               |
| :-------------- | :-------------------------------------------------------- |
| `id `           | Signavault's Id for the Tx                                |
| `unsignedTx`    | Pending unsigned Tx                                       |
| `alias`         | Multisig Alias                                            |
| `threshold`     | Threshold                                                 |
| `transactionId` | Transaction ID                                            |
| `owners`        | Array of Owners consisting of address and signature       |
| `outputOwners`  | A hex encoded representation of the object `outputOwners` |
| `metadata`      | Metadata                                                  |

**Example Call**

```sh
curl -X PUT --data '{
    "signature": "0x26f7774da6795a209beec22d85c4d02f5b69a3058cb2ceac056b91ec0c63ed3a5fca5e0d82ce5dab3a2ab734a043d4073badd27cd13d1d81110cd213ada4d0e401491f1648"
}' -H 'content-type:application/json;' http://localhost:8080/v1/multisig/19
```

**Example Response**

```json
{
  "id": 19,
  "unsignedTx": "0x00000000200400003039010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e4a36162",
  "alias": "P-kopernikus1k4przmfu79ypp4u7y98glmdpzwk0u3sc7saazy",
  "threshold": 2,
  "transactionId": "",
  "owners": [
    {
      "address": "P-kopernikus18jma8ppw3nhx5r4ap8clazz0dps7rv5uuvjh68",
      "signature": "0x83a657db18ff50438d418db9bde239a47bca2d910114aa0cc68ac736053c96c46b300f2c28d0ff6c8587ae916b66b5d575a731d8ecc37abee3c96bdc23dcd88b007c40d266"
    },
    {
      "address": "P-kopernikus1lnk637g0edwnqc2tn8tel39652fswa3x3cfu56",
      "signature": "0x26f7774da6795a209beec22d85c4d02f5b69a3058cb2ceac056b91ec0c63ed3a5fca5e0d82ce5dab3a2ab734a043d4073badd27cd13d1d81110cd213ada4d0e401491f1648"
    }
  ],
  "outputOwners": "5b3e388c6da941fe35428251f2b6f3a8ba72f84b88b980126882ff11f083be85",
  "metadata": "602dac34ce89aec2ae19fa1a025ee6d8"
}
```

### Issue Multisig Transaction

This endpoint is used as a proxy between the wallet and the node. The wallet will send the complete signed transaction bytes and SignaVault will forward it to the node. If the transaction is successfully executed, SignaVault will also update the corresponding database entry with the generated txID and it notify the wallet as well. On transaction failure SignaVault will return the error back to the wallet accordingly.

**Params**

| Name        | Type     | Description                                                                                           | Default |
| :---------- | :------- | :---------------------------------------------------------------------------------------------------- | :------ |
| `signedTx`  | `tx`     | The complete signedTx object encoded in hex.                                                          | None    |
| `signature` | `string` | The signature’s payload contains the unsigned transaction and is signed with the owner's private key. | None    |

**Result Types**

| Name    | Description    |
| :------ | :------------- |
| `txID ` | Transaction ID |

**Example Call**

```sh
curl -X POST --data '{
    "signedTx": "0x00000000200400003039010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e4a36162",
    "signature": "0x26f7774da6795a209beec22d85c4d02f5b69a3058cb2ceac056b91ec0c63ed3a5fca5e0d82ce5dab3a2ab734a043d4073badd27cd13d1d81110cd213ada4d0e401491f1648"
}' -H 'content-type:application/json;' http://localhost:8080/v1/multisig/issue
```

**Example Response**

```json
{
  "txID": "2wKRJ8XKh8h7g2BKaDPXGjBwDJ3fMCuXrdCaeUgqpisJMwAui8"
}
```
