---
sidebar_position: 6
---

# Admin API

This API can be used for measuring node health and debugging.

:::info DISABLED BY DEFAULT

Note that the Admin API is disabled by default for security reasons.

To run a node with the Admin API enabled, use [config flag](/camino-node/configuration/flags-arguments#--api-admin-enabled-secret-string) **`--api-admin-enabled-secret=<string>`**

:::

## Format

This API uses the `json 2.0` RPC format. For details, see [here](issuing-api-calls.md).

## Endpoint

```text
/ext/admin
```

## API Methods

### admin&#46;alias

Assign an API endpoint an alias, a different endpoint for the API. The original endpoint will still work. This change only affects this node; other nodes will not know about this alias.

**Signature**

```text
admin.alias({endpoint:string, alias:string}) -> {success:bool}
```

- `endpoint` is the original endpoint of the API. `endpoint` should only include the part of the endpoint after `/ext/`.
- The API being aliased can now be called at `ext/alias`.
- `alias` can be at most 512 characters.

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.alias",
    "params": {
        "secret": "<ADMIN-SECRET>",
        "alias" :"myAlias",
        "endpoint":"bc/X"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "success": true
  }
}
```

Now, calls to the X-Chain can be made to either `/ext/bc/X` or, equivalently, to `/ext/myAlias`.

### admin&#46;aliasChain

Give a blockchain an alias, a different name that can be used any place the blockchain’s ID is used.

**Signature**

```text
admin.aliasChain(
    {
        chain:string,
        alias:string
    }
) -> {success:bool}
```

- `chain` is the blockchain’s ID.
- `alias` can now be used in place of the blockchain’s ID (in API endpoints, for example.)

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.aliasChain",
    "params": {
        "secret": "<ADMIN-SECRET>",
        "chain":"sV6o671RtkGBcno1FiaDbVcFv2sG5aVXMZYzKdP4VQAWmJQnM",
        "alias":"myBlockchainAlias"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "success": true
  }
}
```

Now, instead of interacting with the blockchain whose ID is `sV6o671RtkGBcno1FiaDbVcFv2sG5aVXMZYzKdP4VQAWmJQnM` by making API calls to `/ext/bc/sV6o671RtkGBcno1FiaDbVcFv2sG5aVXMZYzKdP4VQAWmJQnM`, one can also make calls to `ext/bc/myBlockchainAlias`.

### admin&#46;getChainAliases

Returns the aliases of the chain

**Signature**

```text
admin.getChainAliases(
    {
        chain:string
    }
) -> {aliases:string[]}
```

- `chain` is the blockchain’s ID.

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.getChainAliases",
    "params": {
        "secret": "<ADMIN-SECRET>",
        "chain":"sV6o671RtkGBcno1FiaDbVcFv2sG5aVXMZYzKdP4VQAWmJQnM"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "aliases": [
      "X",
      "avm",
      "2eNy1mUFdmaxXNj1eQHUe7Np4gju9sJsEtWQ4MX3ToiNKuADed"
    ]
  },
  "id": 1
}
```

### admin&#46;getLoggerLevel

Returns log and display levels of loggers.

**Signature**

```text
admin.getLoggerLevel(
    {
        loggerName:string // optional
    }
) -> {
        loggerLevels: {
            loggerName: {
                    logLevel: string,
                    displayLevel: string
            }
        }
    }
```

- `loggerName` is the name of the logger to be returned. This is an optional argument. If not specified, it returns all possible loggers.

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.getLoggerLevel",
    "params": {
        "secret": "<ADMIN-SECRET>",
        "loggerName": "C"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "loggerLevels": {
      "C": {
        "logLevel": "DEBUG",
        "displayLevel": "INFO"
      }
    }
  },
  "id": 1
}
```

### admin&#46;getNodeSigner

Returns node's private & public key

**Signature**

```text
admin.getNodeSigner() -> {
        privateKey: string,
        publicKey: string
    }
```

**Example Call**

```sh
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.getNodeSigner",
    "params": {
        "secret": "<ADMIN-SECRET>"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

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

### admin&#46;loadVMs

Dynamically loads any virtual machines installed on the node as plugins.

**Signature**

```text
admin.loadVMs() -> {
    newVMs: map[string][]string,
    failedVMs: map[string]string
}
```

- `failedVMs` is only included in the response if at least one virtual machine fails to be loaded.

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.loadVMs",
    "params" :{
        "secret": "<ADMIN-SECRET>"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "result": {
    "newVMs": {
      "tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH": ["foovm"]
    },
    "failedVMs": {
      "rXJsCSEYXg2TehWxCEEGj6JU2PWKTkd6cBdNLjoe2SpsKD9cy": "error message"
    }
  },
  "id": 1
}
```

### admin&#46;lockProfile

Writes a profile of mutex statistics to `lock.profile`.

**Signature**

```text
admin.lockProfile() -> {success:bool}
```

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.lockProfile",
    "params" :{
        "secret": "<ADMIN-SECRET>"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "success": true
  }
}
```

### admin&#46;memoryProfile

Writes a memory profile of the to `mem.profile`.

**Signature**

```text
admin.memoryProfile() -> {success:bool}
```

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.memoryProfile",
    "params" :{
        "secret": "<ADMIN-SECRET>"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "success": true
  }
}
```

### admin&#46;setLoggerLevel

Sets log and display levels of loggers.

**Signature**

```text
admin.setLoggerLevel(
    {
        loggerName: string, // optional
        logLevel: string, // optional
        displayLevel: string, // optional
    }
) -> {success:bool}
```

- `loggerName` is the logger's name to be changed. This is an optional parameter. If not specified, it changes all possible loggers.
- `logLevel` is the log level of written logs, can be omitted.
- `displayLevel` is the log level of displayed logs, can be omitted.

`logLevel` and `displayLevel` cannot be omited at the same time.

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.setLoggerLevel",
    "params": {
        "secret": "<ADMIN-SECRET>",
        "loggerName": "C",
        "logLevel": "DEBUG",
        "displayLevel": "INFO"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "success": true
  }
}
```

### admin&#46;startCPUProfiler

Start profiling the CPU utilization of the node. To stop, call `admin.stopCPUProfiler`. On stop, writes the profile to `cpu.profile`.

**Signature**

```text
admin.startCPUProfiler() -> {success:bool}
```

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.startCPUProfiler",
    "params" :{
        "secret": "<ADMIN-SECRET>"
    }
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "success": true
  }
}
```

### admin&#46;stopCPUProfiler

Stop the CPU profile that was previously started.

**Signature**

```text
admin.stopCPUProfiler() -> {success:bool}
```

**Example Call**

```bash
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"admin.stopCPUProfiler"
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/admin
```

**Example Response**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {
    "success": true
  }
}
```
