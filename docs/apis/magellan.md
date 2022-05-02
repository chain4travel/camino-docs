---
description: "This API allows clients to interact with Magellan, the Camino indexer."
sidebar_position: 1
---

# Magellan API

### Format

This API uses GET HTTP requests using URL query parameters and returns JSON data.

### Versioning

Starting with API version 2, the request paths will be prefixed by a version tag, e.g. `http://localhost:8080/v2`.

The current version of the API is version 2. The [Legacy API](magellan.md#legacy-api) documentation has information about using the v1 API.

### Data Types

In addition to integers, strings, and booleans, the following data types are used throughout the API:

| Name       | Description                                                                 | Examples                                                             |
| :--------- | :-------------------------------------------------------------------------- | :------------------------------------------------------------------- |
| `id`       | A CB58 encoded object identifier, such as a chain, transaction, or asset ID | `2oYMBNV4eNHyqk2fjjV5nVQLDbtmNJzq5s3qs3Lo6ftnC6FByM`                 |
| `address`  | A bech-32 encoded address (used on the X-Chain and P-Chain)                 | `fuji1wycv8n7d2fg9aq6unp23pnj4q0arv03ysya8jw`                        |
| `datetime` | A Unix timestamp as an integer or an RFC3339 formatted string               | `1599696000`, `2022-01-09T00:00:00Z`                                 |
| `caddress` | A hex encoded address (used on the C-Chain)                                 | `0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7`                         |
| `chash`    | A hex encoded hash                                                          | `0xe5b935988317e8552e769ad92b6a2fd01ac8f0f90d8ffa4377e50fcb8d970077` |

### List Parameters

All endpoints for listing resources accept the following parameters:

| Name        | Type       | Description                                       | Default | Max    |
| :---------- | :--------- | :------------------------------------------------ | :------ | :----- |
| `limit`     | `int`      | The maximum number of items to return             | `5000`  | `5000` |
| `query`     | `string`   | An ID prefix to filter items by                   | None    | None   |
| `startTime` | `datetime` | Limits to items created on or after a given time  | `0`     | Now    |
| `endTime`   | `datetime` | Limits to items created on or before a given time | Now     | Now    |

## Available Endpoints

### Overview

The root of the API gives an overview of the constants for the active Camino network being indexed.

**Params**

None

**Example Call**

```text
curl "http://localhost:8080/v2"
```

**Example Response**

```json
{
  "network_id": 1,
  "chains": {
    "11111111111111111111111111111111LpoYY": {
      "chainID": "11111111111111111111111111111111LpoYY",
      "chainAlias": "p",
      "vm": "pvm",
      "avaxAssetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
      "networkID": 1
    },
    "2oYMBNV4eNHyqk2fjjV5nVQLDbtmNJzq5s3qs3Lo6ftnC6FByM": {
      "chainID": "2oYMBNV4eNHyqk2fjjV5nVQLDbtmNJzq5s3qs3Lo6ftnC6FByM",
      "chainAlias": "x",
      "vm": "avm",
      "avaxAssetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
      "networkID": 1
    }
  }
}
```

### Search

Find an address or a transaction by its ID.

**Params**

| Name    | Type     | Description                     | Default | Max  |
| :------ | :------- | :------------------------------ | :------ | :--- |
| `query` | `string` | An ID prefix to filter items by | None    | None |

**Example Call**

```text
curl "http://localhost:8080/v2/search?query=2jEugPDFN89KXLEXtf5"
```

**Example Response**

```json
{
  "count": 1,
  "results": [
    {
      "type": "transaction",
      "data": {
        "id": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX",
        "chainID": "11111111111111111111111111111111LpoYY",
        "type": "add_validator",
        "inputs": [
          {
            "output": {
              "id": "G2Jq9fj6atW1jvJDTXJKHSkMhRWdrsFuafPpR98DK3izZdfqT",
              "transactionID": "11111111111111111111111111111111LpoYY",
              "outputIndex": 14025,
              "assetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
              "outputType": 7,
              "amount": "2000000000000",
              "locktime": 0,
              "threshold": 1,
              "addresses": ["columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3"],
              "timestamp": "2022-01-09T00:00:00Z",
              "redeemingTransactionID": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX"
            },
            "credentials": [
              {
                "address": "columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3",
                "public_key": "AgSmTeCLGsNhKvSbRIi01jswlr2fV+C/tv3v86Ty4eDQ",
                "signature": "Ms5KquahoTfLGeIl5s6iP5r1fj15lm5MmrMahu8X7L0m5UTyRBRmcXnniURFaJP6X8dCL9f46t8zYawXscdgkQE="
              }
            ]
          }
        ],
        "outputs": [
          {
            "id": "U7M4jk3y7KGWPmSoeS4WhBX6qNHGtkDtQ5dSzYiaw4rmZ92yE",
            "transactionID": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX",
            "outputIndex": 0,
            "assetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
            "outputType": 7,
            "amount": "2000000000000",
            "locktime": 0,
            "threshold": 1,
            "addresses": ["columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3"],
            "timestamp": "2022-01-10T07:09:44Z",
            "redeemingTransactionID": ""
          }
        ],
        "memo": "AAAAAA==",
        "inputTotals": {
          "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP": "2000000000000"
        },
        "outputTotals": {
          "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP": "2000000000000"
        },
        "reusedAddressTotals": null,
        "timestamp": "2022-01-10T07:09:44Z",
        "txFee": 0,
        "genesis": false
      },
      "score": 0
    }
  ]
}
```

### Aggregate

Calculate aggregate transaction data over a time frame.

**Params**

| Name           | Type     | Description                                                      | Default | Max  |
| :------------- | :------- | :--------------------------------------------------------------- | :------ | :--- |
| `chainID`      | `id`     | A chain ID to filter results by. May be supplied multiple times. | None    | None |
| `assetID`      | `id`     | An asset ID to filter results by.                                | None    | None |
| `intervalSize` | `string` | Values 'minute', 'hour', 'day', 'week', 'month', 'year'          | None    | None |

**Example Call**

```text
curl "http://localhost:8080/v2/aggregates?startTime=2020-09-21T00:00:00Z&endTime=2020-10-21T00:00:00Z"
```

**Example Response**

```json
{
  "startTime": "2020-09-21T00:00:00Z",
  "endTime": "2020-10-21T00:00:00Z",
  "aggregates": {
    "startTime": "2020-09-21T00:00:00Z",
    "endTime": "2020-10-21T00:00:00Z",
    "transactionVolume": "1652211194850792239",
    "transactionCount": 135966,
    "addressCount": 19567,
    "outputCount": 283221,
    "assetCount": 180
  }
}
```

### TxFee Aggregate

AVAX Aggregate txfee

**Example Call**

```text
curl "http://localhost:8080/v2/txfeeAggregates?startTime=2020-09-21T00:00:00Z&endTime=2020-10-21T00:00:00Z"
```

**Example Response**

```json
{
  "aggregates": {
    "startTime": "2020-09-21T00:00:00Z",
    "endTime": "2020-10-21T00:00:00Z",
    "txfee": "134818000000"
  },
  "startTime": "2020-09-21T00:00:00Z",
  "endTime": "2020-10-21T00:00:00Z"
}
```

### Address Chain

Responds with the chains an address appears on.

**Params**

| Name      | Type      | Description                                                     | Default | Max  |
| :-------- | :-------- | :-------------------------------------------------------------- | :------ | :--- |
| `address` | `address` | A address to filter results by. May be supplied multiple times. | None    | None |

**Example Call**

```text
curl "http://localhost:8080/v2/addressChains?address=X-fujiABC"
```

**Example Response**

```json
{
  "addressChains": {
    "columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3": [
      "11111111111111111111111111111111LpoYY"
    ],
    "avax1y8cyrzn2kg4udccs5d625gkac7a99pe452cy5u": [
      "11111111111111111111111111111111LpoYY",
      "2oYMBNV4eNHyqk2fjjV5nVQLDbtmNJzq5s3qs3Lo6ftnC6FByM"
    ]
  }
}
```

### List Transactions

Find transactions that have been accepted.

**Params**

| Name      | Type      | Description                                                              | Default         | Max  |
| :-------- | :-------- | :----------------------------------------------------------------------- | :-------------- | :--- |
| `chainID` | `id`      | A chain ID to filter results by. May be supplied multiple times.         | None            | None |
| `assetID` | `id`      | An asset ID to filter results by.                                        | None            | None |
| `address` | `address` | An address to filter results by. May be supplied multiple times.         | None            | None |
| `sort`    | `string`  | A method to sort results by. May be `timestamp-asc` or `timestamp-desc`. | `timestamp-asc` | N/A  |

**Example Call**

```bash
curl "http://localhost:8080/v2/transactions?chainID=11111111111111111111111111111111LpoYY"
```

**Example Response**

```json
{
  "startTime": "0001-01-01T00:00:00Z",
  "endTime": "2020-11-16T04:18:07Z",
  "transactions": [
    {
      "id": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX",
      "chainID": "11111111111111111111111111111111LpoYY",
      "type": "add_validator",
      "inputs": [
        {
          "output": {
            "id": "G2Jq9fj6atW1jvJDTXJKHSkMhRWdrsFuafPpR98DK3izZdfqT",
            "transactionID": "11111111111111111111111111111111LpoYY",
            "outputIndex": 14025,
            "assetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
            "outputType": 7,
            "amount": "2000000000000",
            "locktime": 0,
            "threshold": 1,
            "addresses": ["columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3"],
            "timestamp": "2022-01-09T00:00:00Z",
            "redeemingTransactionID": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX"
          },
          "credentials": [
            {
              "address": "columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3",
              "public_key": "AgSmTeCLGsNhKvSbRIi01jswlr2fV+C/tv3v86Ty4eDQ",
              "signature": "Ms5KquahoTfLGeIl5s6iP5r1fj15lm5MmrMahu8X7L0m5UTyRBRmcXnniURFaJP6X8dCL9f46t8zYawXscdgkQE="
            }
          ]
        }
      ],
      "outputs": [
        {
          "id": "U7M4jk3y7KGWPmSoeS4WhBX6qNHGtkDtQ5dSzYiaw4rmZ92yE",
          "transactionID": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX",
          "outputIndex": 0,
          "assetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
          "outputType": 7,
          "amount": "2000000000000",
          "locktime": 0,
          "threshold": 1,
          "addresses": ["columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3"],
          "timestamp": "2022-01-10T07:09:44Z",
          "redeemingTransactionID": ""
        }
      ],
      "memo": "AAAAAA==",
      "inputTotals": {
        "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP": "2000000000000"
      },
      "outputTotals": {
        "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP": "2000000000000"
      },
      "reusedAddressTotals": null,
      "timestamp": "2022-01-10T07:09:44Z",
      "txFee": 0,
      "genesis": false
    }
  ]
}
```

### Get Transaction

Find a single transaction by its ID.

**Example Call**

```text
curl "http://localhost:8080/v2/transactions/2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX"
```

**Example Response**

```json
{
  "id": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX",
  "chainID": "11111111111111111111111111111111LpoYY",
  "type": "add_validator",
  "inputs": [
    {
      "output": {
        "id": "G2Jq9fj6atW1jvJDTXJKHSkMhRWdrsFuafPpR98DK3izZdfqT",
        "transactionID": "11111111111111111111111111111111LpoYY",
        "outputIndex": 14025,
        "assetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
        "outputType": 7,
        "amount": "2000000000000",
        "locktime": 0,
        "threshold": 1,
        "addresses": ["columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3"],
        "timestamp": "2022-01-09T00:00:00Z",
        "redeemingTransactionID": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX"
      },
      "credentials": [
        {
          "address": "columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3",
          "public_key": "AgSmTeCLGsNhKvSbRIi01jswlr2fV+C/tv3v86Ty4eDQ",
          "signature": "Ms5KquahoTfLGeIl5s6iP5r1fj15lm5MmrMahu8X7L0m5UTyRBRmcXnniURFaJP6X8dCL9f46t8zYawXscdgkQE="
        }
      ]
    }
  ],
  "outputs": [
    {
      "id": "U7M4jk3y7KGWPmSoeS4WhBX6qNHGtkDtQ5dSzYiaw4rmZ92yE",
      "transactionID": "2jEugPDFN89KXLEXtf5oKp5spsJawTht2zP4kKJjkQwwRsDdLX",
      "outputIndex": 0,
      "assetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
      "outputType": 7,
      "amount": "2000000000000",
      "locktime": 0,
      "threshold": 1,
      "addresses": ["columbus14q43wu6wp8fs745dt6y5s0a02vx57ypq4xc5s3"],
      "timestamp": "2022-01-10T07:09:44Z",
      "redeemingTransactionID": ""
    }
  ],
  "memo": "AAAAAA==",
  "inputTotals": {
    "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP": "2000000000000"
  },
  "outputTotals": {
    "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP": "2000000000000"
  },
  "reusedAddressTotals": null,
  "timestamp": "2022-01-10T07:09:44Z",
  "txFee": 0,
  "genesis": false
}
```

### List Addresses

Find addresses that have been referenced in accepted transactions.

**Params**

| Name      | Type      | Description                                                      | Default | Max  |
| :-------- | :-------- | :--------------------------------------------------------------- | :------ | :--- |
| `chainID` | `id`      | A chain ID to filter results by. May be supplied multiple times. | None    | None |
| `address` | `address` | An address to filter results by. May be supplied multiple times. | None    | None |

**Example Call**

```text
curl "http://localhost:8080/v2/addresses?address=X-avax1y8cyrzn2kg4udccs5d625gkac7a99pe452cy5u"
```

**Example Response**

```json
{
  "addresses": [
    {
      "address": "avax1y8cyrzn2kg4udccs5d625gkac7a99pe452cy5u",
      "publicKey": null,
      "assets": {
        "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP": {
          "id": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
          "transactionCount": 2,
          "utxoCount": 17,
          "balance": "39561999999996",
          "totalReceived": "39561999999996",
          "totalSent": "0"
        }
      }
    }
  ]
}
```

### Get Address

Find a single address by its ID.

**Example Call**

```text
curl "http://localhost:8080/v2/addresses/avax1y8cyrzn2kg4udccs5d625gkac7a99pe452cy5u"
```

**Example Response**

```json
{
  "address": "avax1y8cyrzn2kg4udccs5d625gkac7a99pe452cy5u",
  "publicKey": null,
  "assets": {
    "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP": {
      "id": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
      "transactionCount": 2,
      "utxoCount": 17,
      "balance": "39561999999996",
      "totalReceived": "39561999999996",
      "totalSent": "0"
    }
  }
}
```

### List Assets

Find assets that have been created on the X-chain.

**Example Call**

```text
curl "http://localhost:8080/v2/assets"
```

**Example Response**

```json
{
  "assets": [
    {
      "id": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
      "chainID": "2oYMBNV4eNHyqk2fjjV5nVQLDbtmNJzq5s3qs3Lo6ftnC6FByM",
      "name": "Camino",
      "symbol": "CAM",
      "alias": "CAM",
      "currentSupply": "10000000000000",
      "timestamp": "2022-01-10T00:00:00Z",
      "denomination": 9,
      "variableCap": 0,
      "nft": 1
    }
  ]
}
```

### Get Asset

Find a single asset by its ID.

**Example Call**

```text
curl "http://localhost:8080/v2/assets/2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP"
```

**Example Response**

```json
{
  "id": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
  "chainID": "2oYMBNV4eNHyqk2fjjV5nVQLDbtmNJzq5s3qs3Lo6ftnC6FByM",
  "name": "Camino",
  "symbol": "CAM",
  "alias": "CAM",
  "currentSupply": "100000000000",
  "timestamp": "2022-01-10T00:00:00Z",
  "denomination": 9,
  "variableCap": 0,
  "nft": 1
}
```

### List Outputs

Find outputs that have been created by an accepted transaction.

**Params**

| Name      | Type      | Description                                                                         | Default | Max  |
| :-------- | :-------- | :---------------------------------------------------------------------------------- | :------ | :--- |
| `chainID` | `id`      | A chain ID to filter results by. May be supplied multiple times.                    | None    | None |
| `address` | `address` | An address to filter results by. May be supplied multiple times.                    | None    | None |
| `spent`   | `bool`    | If set, results will be filtered by whether they're spent (true) or unspent (false) | None    | N/A  |

**Example Call**

```text
curl "http://localhost:8080/v2/outputs?address=X-avax1y8cyrzn2kg4udccs5d625gkac7a99pe452cy5u&spent=false"
```

**Example Response**

```json
{
  "outputs": [
    {
      "id": "114RMPhYM7do7cDX7KWSqFeLkbUXFrLKcqPL4GMdjTvemPzvc",
      "transactionID": "dhU8aMRrtMWvBWSh41aTxUbwArYootNUBcL3N3UJXVPL8H9ip",
      "outputIndex": 4,
      "assetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
      "outputType": 7,
      "amount": "2327176470588",
      "locktime": 0,
      "threshold": 1,
      "addresses": ["avax1y8cyrzn2kg4udccs5d625gkac7a99pe452cy5u"],
      "timestamp": "2022-01-09T00:00:00Z",
      "redeemingTransactionID": ""
    }
  ]
}
```

### Get Output

Find a single output by its ID.

**Example Call**

```text
curl "http://localhost:8080/v2/outputs/114RMPhYM7do7cDX7KWSqFeLkbUXFrLKcqPL4GMdjTvemPzvc"
```

**Example Response**

```json
{
  "id": "114RMPhYM7do7cDX7KWSqFeLkbUXFrLKcqPL4GMdjTvemPzvc",
  "transactionID": "dhU8aMRrtMWvBWSh41aTxUbwArYootNUBcL3N3UJXVPL8H9ip",
  "outputIndex": 4,
  "assetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP",
  "outputType": 7,
  "amount": "2327176470588",
  "locktime": 0,
  "threshold": 1,
  "addresses": ["avax1y8cyrzn2kg4udccs5d625gkac7a99pe452cy5u"],
  "timestamp": "2022-01-09T00:00:00Z",
  "redeemingTransactionID": ""
}
```

### Get a C-Chain Block

Find a single block by its number.

**Params**

| Name          | Type       | Description                     | Default | Max  |
| :------------ | :--------- | :------------------------------ | :------ | :--- |
| - | `number`   | blockHeight                     | Latest  | None |

**Example Call**

```text
curl "http://localhost:8080/v2/ctxdata/3"
```

**Example Response**

```json
{
  "header": {
    "parentHash": "0x87915667c9e47e6f9138effce5546c8f0b3d073463558f37308fbf6038c711da",
    "sha3Uncles": "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
    "miner": "0x0100000000000000000000000000000000000000",
    "stateRoot": "0x3b2ba2c59f78d93c378eec089224d2d7be450c97144062f89f1665459d4cac71",
    "transactionsRoot": "0xc695e252f1ce3d8069ce5ede6700cf67349d2cbf0aec17f7a167889b55527267",
    "receiptsRoot": "0x479ddd5a996ddbe30696a9e54dccbc118a6c34c67162ec7d3bbcc2edea0cad73",
    "logsBloom": "0x00000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000010002000000000000000000000000000000000000000000000000000000000000000000000000800020000000000000000000800000000000000000000000000000000000000100000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000008000000000000000020000000000000000000000000000000000000000000000000000000080000000000",
    "difficulty": "0x1",
    "number": "0x3",
    "gasLimit": "0x7a1200",
    "gasUsed": "0xcafb",
    "timestamp": "0x624d86a8",
    "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    "mixHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "nonce": "0x0000000000000000",
    "extDataHash": "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
    "baseFeePerGas": "0x5d21dba00",
    "extDataGasUsed": "0x0",
    "blockGasCost": "0x0",
    "hash": "0x211284bb27f7a4868e2de120b4893f10ed676050ddb6c18ea6a53da11ae01184"
  },
  "transactions": [{
      "type": 2,
      "block": "3",
      "hash": "0x0067ce3412147150da6080ca84c0fff7f80684214a41c931c647434081817087",
      "createdAt": "2022-04-06T12:25:12Z",
      "nonce": 1,
      "gasPrice": "52500000000",
      "maxFeePerGas": "52500000000",
      "maxPriorityFeePerGas": "2500000000",
      "gasLimit": 51963,
      "value": "0",
      "input": "0x731133e90000000000000000000000000e455a324ea5eed5b08d477c9ab7b18c6ab8715c0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000000",
      "fromAddr": "0x0e455a324ea5eed5b08d477c9ab7b18c6ab8715c",
      "toAddr": "0xb364f7079f08443c17624f3155f726f630a1ce45",
      "v": "1",
      "r": "7848259674290569612178007903153068353576567577059024438939139798842134023075",
      "s": "32789367706775747617212356724916593721336985469384907264868581499177067597785",
      "receipt": {
        "type": "0x2",
        "root": "0x",
        "status": "0x1",
        "cumulativeGasUsed": "0xcafb",
        "logsBloom": "0x00000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000010002000000000000000000000000000000000000000000000000000000000000000000000000800020000000000000000000800000000000000000000000000000000000000100000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000008000000000000000020000000000000000000000000000000000000000000000000000000080000000000",
        "logs": [{
            "address": "0xb364f7079f08443c17624f3155f726f630a1ce45",
            "topics": ["0xc3d58168c5ae7397731d063d5bbf3d657854427343f4c083240f7aacaa2d0f62", "0x0000000000000000000000000e455a324ea5eed5b08d477c9ab7b18c6ab8715c", "0x0000000000000000000000000000000000000000000000000000000000000000", "0x0000000000000000000000000e455a324ea5eed5b08d477c9ab7b18c6ab8715c"],
            "data": "0x0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000a",
            "blockNumber": "0x3",
            "transactionHash": "0x0067ce3412147150da6080ca84c0fff7f80684214a41c931c647434081817087",
            "transactionIndex": "0x0",
            "blockHash": "0x211284bb27f7a4868e2de120b4893f10ed676050ddb6c18ea6a53da11ae01184",
            "logIndex": "0x0",
            "removed": false
          }
        ],
        "transactionHash": "0x0067ce3412147150da6080ca84c0fff7f80684214a41c931c647434081817087",
        "contractAddress": "0x0000000000000000000000000000000000000000",
        "gasUsed": "0xcafb",
        "blockHash": "0x211284bb27f7a4868e2de120b4893f10ed676050ddb6c18ea6a53da11ae01184",
        "blockNumber": "0x3",
        "transactionIndex": "0x0"
      }
    }
  ]
}
```

### Blocks and Transactions overview

Get informatial lists of latest blocks and transaction on C-Chain

**Params**

| Name          | Type       | Description                     | Default | Max   |
| :------------ | :--------- | :------------------------------ | :------ | :---- |
| `limit`       | `number`   | limit of blocks                 | 0       | 10000 |
| `limit`       | `number`   | limit of transactions           | 0       | 10000 |
| `offset`      | `number`   | offset of blocks                | 0       | None |
| `offset`      | `number`   | offset of transaction           | 0       | None |

**Example Call**

```text
curl "http://localhost:8080/v2/cblocks?limit=1&limit=1"
```

**Example Response**

```json
{
  "blockCount": 6,
  "transactionCount": 4,
  "blocks": [{
      "hash": "0x5250dbfb39fa3d6b7ef8c7eb9ef2917396c0c3627a63cb55d15ccc1cb5b73347",
      "miner": "0x0100000000000000000000000000000000000000",
      "difficulty": "0x1",
      "number": "0x5",
      "gasLimit": "0x7a1200",
      "gasUsed": "0xe34a",
      "timestamp": "0x624dca9b",
      "baseFeePerGas": "0x5d21dba00",
      "extDataGasUsed": "0x0",
      "blockGasCost": "0x0",
      "evmTx": 1,
      "atomicTx": 0
    }
  ],
  "transactions": [{
      "type": "0x0",
      "block": "0x5",
      "index": "0x0",
      "hash": "0x2b04a8e89e89e1f79e675589b34e94f67bd53af4bb3bc3e123c66ded24726c0e",
      "nonce": "0x3",
      "gasPrice": "0x746a52880",
      "gas": "0xfa05",
      "value": "0x0",
      "fromAddr": "",
      "timestamp": "0x624dca9b",
      "status": "0x1",
      "gasUsed": "0xe34a"
    }
  ]
}
```

### List C-Chain Transactions

Find accepted C-Chain transactions.

**Params**

| Name          | Type       | Description                     | Default | Max  |
| :------------ | :--------- | :------------------------------ | :------ | :--- |
| `toAddress`   | `caddress` | address                         | None    | None |
| `fromAddress` | `caddress` | address                         | None    | None |
| `address`     | `caddress` | address (to or from)            | None    | None |
| `hash`        | `chash`    | transaction hash                | None    | None |
| `blockStart`  | `number`   | Starting block number inclusive | None    | N/A  |
| `blockEnd`    | `number`   | Ending block number exclusive   | None    | N/A  |

**Example Call**

```text
curl "http://localhost:8080/v2/ctransactions?toAddress=0x34ec164fd085ae43906eab6dffd1eae0a0855a2a&blockStart=797380&blockEnd=797381"
```

**Example Response**

```json
{
  "Transactions": [
    {
      "type": 2,
      "block": "3",
      "hash": "0x0067ce3412147150da6080ca84c0fff7f80684214a41c931c647434081817087",
      "createdAt": "2022-04-30T08:49:44.512674Z",
      "nonce": 1,
      "gasPrice": "52500000000",
      "maxFeePerGas": "52500000000",
      "maxPriorityFeePerGas": "2500000000",
      "gasLimit": 51963,
      "value": "0",
      "input": "0x731133e90000000000000000000000000e455a324ea5eed5b08d477c9ab7b18c6ab8715c0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000000",
      "fromAddr": "0x0e455a324ea5eed5b08d477c9ab7b18c6ab8715c",
      "toAddr": "0xb364f7079f08443c17624f3155f726f630a1ce45",
      "v": "1",
      "r": "7848259674290569612178007903153068353576567577059024438939139798842134023075",
      "s": "32789367706775747617212356724916593721336985469384907264868581499177067597785",
      "receipt": {
        "type": "0x2",
        "root": "0x",
        "status": "0x1",
        "cumulativeGasUsed": "0xcafb",
        "logsBloom": "0x00000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000010002000000000000000000000000000000000000000000000000000000000000000000000000800020000000000000000000800000000000000000000000000000000000000100000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000008000000000000000020000000000000000000000000000000000000000000000000000000080000000000",
        "logs": [{
            "address": "0xb364f7079f08443c17624f3155f726f630a1ce45",
            "topics": ["0xc3d58168c5ae7397731d063d5bbf3d657854427343f4c083240f7aacaa2d0f62", "0x0000000000000000000000000e455a324ea5eed5b08d477c9ab7b18c6ab8715c", "0x0000000000000000000000000000000000000000000000000000000000000000", "0x0000000000000000000000000e455a324ea5eed5b08d477c9ab7b18c6ab8715c"],
            "data": "0x0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000a",
            "blockNumber": "0x3",
            "transactionHash": "0x0067ce3412147150da6080ca84c0fff7f80684214a41c931c647434081817087",
            "transactionIndex": "0x0",
            "blockHash": "0x211284bb27f7a4868e2de120b4893f10ed676050ddb6c18ea6a53da11ae01184",
            "logIndex": "0x0",
            "removed": false
          }
        ],
        "transactionHash": "0x0067ce3412147150da6080ca84c0fff7f80684214a41c931c647434081817087",
        "contractAddress": "0x0000000000000000000000000000000000000000",
        "gasUsed": "0xcafb",
        "blockHash": "0x211284bb27f7a4868e2de120b4893f10ed676050ddb6c18ea6a53da11ae01184",
        "blockNumber": "0x3",
        "transactionIndex": "0x0"
      }
    }
  ],
  "startTime": "0001-01-01T00:00:00Z",
  "endTime": "2022-04-30T09:21:07Z"
}
```

### Get a Raw C-Chain Transaction

Get an accepted C-Chain transaction by its ID.

**Example Call**

```text
curl "http://localhost:8080/v2/rawtransaction/pxiBJkwnaKhaJdYkkfAVRZXrJj47jJF3QAvsasbYF2Rfweoog"
```

**Example Response**

```json
{
  "tx": "0x00000000000000000001ed5f38341..."
}
```

### Legacy API

Version 1 of the API was built to support only the X-chain, and it did not use a version prefix (`/v1`). It is available at the path `/x` off of the root, which is the Overview endpoint for only the X-chain:

**Example Call**

```text
curl "http://localhost:8080/x"
```

**Example Response**

```json
{
  "networkID": 1,
  "vm": "avm",
  "chainAlias": "x",
  "chainID": "2oYMBNV4eNHyqk2fjjV5nVQLDbtmNJzq5s3qs3Lo6ftnC6FByM",
  "avaxAssetID": "2KGdt2HpFKpTH5CtGZjYt5XPWs6Pv9DLoRBhiFfntbezdRvZWP"
}
```
The legacy API supports the same endpoints and parameters as version 2, except the chainID parameter for all endpoints defaults to the X-chain ID.
