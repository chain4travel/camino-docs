---
sidebar_position: 5
title: Flags & Arguments
description: Camino Node CLI & Config File Flags
---

# Camino Node Flags & Arguments

### --add-primary-network-delegator-fee [uint]

Transaction fee, in nAVAX, for transactions that add new primary network delegators

Argument: `uint`

**Command Line Flag:**

```
--add-primary-network-delegator-fee [uint]
```

**Config File Flag:**

```json
"add-primary-network-delegator-fee": "<uint>"
```

### --add-primary-network-validator-fee [uint]

Transaction fee, in nAVAX, for transactions that add new primary network validators

Argument: `uint`

**Command Line Flag:**

```
--add-primary-network-validator-fee [uint]
```

**Config File Flag:**

```json
"add-primary-network-validator-fee": "<uint>"
```

### --add-subnet-delegator-fee [uint]

Transaction fee, in nAVAX, for transactions that add new subnet delegators (default 1000000)

Argument: `uint`

**Command Line Flag:**

```
--add-subnet-delegator-fee [uint]
```

**Config File Flag:**

```json
"add-subnet-delegator-fee": "<uint>"
```

### --add-subnet-validator-fee [uint]

Transaction fee, in nAVAX, for transactions that add new subnet validators (default 1000000)

Argument: `uint`

**Command Line Flag:**

```
--add-subnet-validator-fee [uint]
```

**Config File Flag:**

```json
"add-subnet-validator-fee": "<uint>"
```

### --api-admin-enabled-secret [string]

If not empty, this node exposes the Admin API. The secret must be passed for every call

Argument: `string`

**Command Line Flag:**

```
--api-admin-enabled-secret [string]
```

**Config File Flag:**

```json
"api-admin-enabled-secret": "<string>"
```

### --api-auth-password [string]

Specifies password for API authorization tokens

Argument: `string`

**Command Line Flag:**

```
--api-auth-password [string]
```

**Config File Flag:**

```json
"api-auth-password": "<string>"
```

### --api-auth-password-file [string]

Password file used to initially create/validate API authorization tokens. Ignored if api-auth-password is specified. Leading and trailing whitespace is removed from the password. Can be changed via API call

Argument: `string`

**Command Line Flag:**

```
--api-auth-password-file [string]
```

**Config File Flag:**

```json
"api-auth-password-file": "<string>"
```

### --api-auth-required

Require authorization token to call HTTP APIs

**Command Line Flag:**

```
--api-auth-required
```

**Config File Flag:**

```json
"api-auth-required": "true" or "false"
```

### --api-health-enabled

If true, this node exposes the Health API (default true)

**Command Line Flag:**

```
--api-health-enabled
```

**Config File Flag:**

```json
"api-health-enabled": "true" or "false"
```

### --api-info-enabled

If true, this node exposes the Info API (default true)

**Command Line Flag:**

```
--api-info-enabled
```

**Config File Flag:**

```json
"api-info-enabled": "true" or "false"
```

### --api-ipcs-enabled

If true, IPCs can be opened

**Command Line Flag:**

```
--api-ipcs-enabled
```

**Config File Flag:**

```json
"api-ipcs-enabled": "true" or "false"
```

### --api-keystore-enabled

If true, this node exposes the Keystore API

**Command Line Flag:**

```
--api-keystore-enabled
```

**Config File Flag:**

```json
"api-keystore-enabled": "true" or "false"
```

### --api-metrics-enabled

If true, this node exposes the Metrics API (default true)

**Command Line Flag:**

```
--api-metrics-enabled
```

**Config File Flag:**

```json
"api-metrics-enabled": "true" or "false"
```

### --benchlist-duration [duration]

Max amount of time a peer is benchlisted after surpassing the threshold (default 15m0s)

Argument: `duration`

**Command Line Flag:**

```
--benchlist-duration [duration]
```

**Config File Flag:**

```json
"benchlist-duration": "<duration>"
```

### --benchlist-fail-threshold [int]

Number of consecutive failed queries before benchlisting a node (default 10)

Argument: `int`

**Command Line Flag:**

```
--benchlist-fail-threshold [int]
```

**Config File Flag:**

```json
"benchlist-fail-threshold": "<int>"
```

### --benchlist-min-failing-duration [duration]

Minimum amount of time messages to a peer must be failing before the peer is benched (default 2m30s)

Argument: `duration`

**Command Line Flag:**

```
--benchlist-min-failing-duration [duration]
```

**Config File Flag:**

```json
"benchlist-min-failing-duration": "<duration>"
```

### --bootstrap-ancestors-max-containers-received [uint]

This node reads at most this many containers from an incoming Ancestors message (default 2000)

Argument: `uint`

**Command Line Flag:**

```
--bootstrap-ancestors-max-containers-received [uint]
```

**Config File Flag:**

```json
"bootstrap-ancestors-max-containers-received": "<uint>"
```

### --bootstrap-ancestors-max-containers-sent [uint]

Max number of containers in an Ancestors message sent by this node (default 2000)

Argument: `uint`

**Command Line Flag:**

```
--bootstrap-ancestors-max-containers-sent [uint]
```

**Config File Flag:**

```json
"bootstrap-ancestors-max-containers-sent": "<uint>"
```

### --bootstrap-beacon-connection-timeout [duration]

Timeout before emitting a warn log when connecting to bootstrapping beacons (default 1m0s)

Argument: `duration`

**Command Line Flag:**

```
--bootstrap-beacon-connection-timeout [duration]
```

**Config File Flag:**

```json
"bootstrap-beacon-connection-timeout": "<duration>"
```

### --bootstrap-ids [string]

Comma separated list of bootstrap peer ids to connect to. Example: NodeID-JR4dVmy6ffUGAKCBDkyCbeZbyHQBeDsET,NodeID-8CrVPQZ4VSqgL8zTdvL14G8HqAfrBr4z

Argument: `string`

**Command Line Flag:**

```
--bootstrap-ids [string]
```

**Config File Flag:**

```json
"bootstrap-ids": "<string>"
```

### --bootstrap-ips [string]

Comma separated list of bootstrap peer ips to connect to. Example: 127.0.0.1:9630,127.0.0.1:9631

Argument: `string`

**Command Line Flag:**

```
--bootstrap-ips [string]
```

**Config File Flag:**

```json
"bootstrap-ips": "<string>"
```

### --bootstrap-max-time-get-ancestors [duration]

Max Time to spend fetching a container and its ancestors when responding to a GetAncestors (default 50ms)

Argument: `duration`

**Command Line Flag:**

```
--bootstrap-max-time-get-ancestors [duration]
```

**Config File Flag:**

```json
"bootstrap-max-time-get-ancestors": "<duration>"
```

### --bootstrap-retry-enabled

Specifies whether bootstrap should be retried (default true)

**Command Line Flag:**

```
--bootstrap-retry-enabled
```

**Config File Flag:**

```json
"bootstrap-retry-enabled": "true" or "false"
```

### --bootstrap-retry-warn-frequency [int]

Specifies how many times bootstrap should be retried before warning the operator (default 50)

Argument: `int`

**Command Line Flag:**

```
--bootstrap-retry-warn-frequency [int]
```

**Config File Flag:**

```json
"bootstrap-retry-warn-frequency": "<int>"
```

### --chain-aliases-file [string]

Specifies a JSON file that maps blockchainIDs with custom aliases. Ignored if chain-config-content is specified (default "$AVALANCHEGO_DATA_DIR/configs/chains/aliases.json")

Argument: `string`

**Command Line Flag:**

```
--chain-aliases-file [string]
```

**Config File Flag:**

```json
"chain-aliases-file": "<string>"
```

### --chain-aliases-file-content [string]

Specifies base64 encoded map from blockchainID to custom aliases

Argument: `string`

**Command Line Flag:**

```
--chain-aliases-file-content [string]
```

**Config File Flag:**

```json
"chain-aliases-file-content": "<string>"
```

### --chain-config-content [string]

Specifies base64 encoded chains configurations

Argument: `string`

**Command Line Flag:**

```
--chain-config-content [string]
```

**Config File Flag:**

```json
"chain-config-content": "<string>"
```

### --chain-config-dir [string]

Chain specific configurations parent directory. Ignored if chain-config-content is specified (default "$AVALANCHEGO_DATA_DIR/configs/chains")

Argument: `string`

**Command Line Flag:**

```
--chain-config-dir [string]
```

**Config File Flag:**

```json
"chain-config-dir": "<string>"
```

### --chain-data-dir [string]

Chain specific data directory (default "$AVALANCHEGO_DATA_DIR/chainData")

Argument: `string`

**Command Line Flag:**

```
--chain-data-dir [string]
```

**Config File Flag:**

```json
"chain-data-dir": "<string>"
```

### --config-file [string]

Specifies a config file. Ignored if config-file-content is specified

Argument: `string`

**Command Line Flag:**

```
--config-file [string]
```

**Config File Flag:**

```json
"config-file": "<string>"
```

### --config-file-content [string]

Specifies base64 encoded config content

Argument: `string`

**Command Line Flag:**

```
--config-file-content [string]
```

**Config File Flag:**

```json
"config-file-content": "<string>"
```

### --config-file-content-type [string]

Specifies the format of the base64 encoded config content. Available values: 'json', 'yaml', 'toml' (default "json")

Argument: `string`

**Command Line Flag:**

```
--config-file-content-type [string]
```

**Config File Flag:**

```json
"config-file-content-type": "<string>"
```

### --consensus-accepted-frontier-gossip-non-validator-size [uint]

Number of non-validators to gossip to when gossiping accepted frontier

Argument: `uint`

**Command Line Flag:**

```
--consensus-accepted-frontier-gossip-non-validator-size [uint]
```

**Config File Flag:**

```json
"consensus-accepted-frontier-gossip-non-validator-size": "<uint>"
```

### --consensus-accepted-frontier-gossip-peer-size [uint]

Number of peers to gossip to when gossiping accepted frontier (default 15)

Argument: `uint`

**Command Line Flag:**

```
--consensus-accepted-frontier-gossip-peer-size [uint]
```

**Config File Flag:**

```json
"consensus-accepted-frontier-gossip-peer-size": "<uint>"
```

### --consensus-accepted-frontier-gossip-validator-size [uint]

Number of validators to gossip to when gossiping accepted frontier

Argument: `uint`

**Command Line Flag:**

```
--consensus-accepted-frontier-gossip-validator-size [uint]
```

**Config File Flag:**

```json
"consensus-accepted-frontier-gossip-validator-size": "<uint>"
```

### --consensus-app-gossip-non-validator-size [uint]

Number of non-validators to gossip an AppGossip message to

Argument: `uint`

**Command Line Flag:**

```
--consensus-app-gossip-non-validator-size [uint]
```

**Config File Flag:**

```json
"consensus-app-gossip-non-validator-size": "<uint>"
```

### --consensus-app-gossip-peer-size [uint]

Number of peers (which may be validators or non-validators) to gossip an AppGossip message to

Argument: `uint`

**Command Line Flag:**

```
--consensus-app-gossip-peer-size [uint]
```

**Config File Flag:**

```json
"consensus-app-gossip-peer-size": "<uint>"
```

### --consensus-app-gossip-validator-size [uint]

Number of validators to gossip an AppGossip message to (default 10)

Argument: `uint`

**Command Line Flag:**

```
--consensus-app-gossip-validator-size [uint]
```

**Config File Flag:**

```json
"consensus-app-gossip-validator-size": "<uint>"
```

### --consensus-gossip-frequency [duration]

Frequency of gossiping accepted frontiers (default 10s)

Argument: `duration`

**Command Line Flag:**

```
--consensus-gossip-frequency [duration]
```

**Config File Flag:**

```json
"consensus-gossip-frequency": "<duration>"
```

### --consensus-on-accept-gossip-non-validator-size [uint]

Number of non-validators to gossip to each accepted container to

Argument: `uint`

**Command Line Flag:**

```
--consensus-on-accept-gossip-non-validator-size [uint]
```

**Config File Flag:**

```json
"consensus-on-accept-gossip-non-validator-size": "<uint>"
```

### --consensus-on-accept-gossip-peer-size [uint]

Number of peers to gossip to each accepted container to (default 10)

Argument: `uint`

**Command Line Flag:**

```
--consensus-on-accept-gossip-peer-size [uint]
```

**Config File Flag:**

```json
"consensus-on-accept-gossip-peer-size": "<uint>"
```

### --consensus-on-accept-gossip-validator-size [uint]

Number of validators to gossip to each accepted container to

Argument: `uint`

**Command Line Flag:**

```
--consensus-on-accept-gossip-validator-size [uint]
```

**Config File Flag:**

```json
"consensus-on-accept-gossip-validator-size": "<uint>"
```

### --consensus-shutdown-timeout [duration]

Timeout before killing an unresponsive chain (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--consensus-shutdown-timeout [duration]
```

**Config File Flag:**

```json
"consensus-shutdown-timeout": "<duration>"
```

### --create-asset-tx-fee [uint]

Transaction fee, in nAVAX, for transactions that create new assets (default 1000000)

Argument: `uint`

**Command Line Flag:**

```
--create-asset-tx-fee [uint]
```

**Config File Flag:**

```json
"create-asset-tx-fee": "<uint>"
```

### --create-blockchain-tx-fee [uint]

Transaction fee, in nAVAX, for transactions that create new blockchains (default 100000000)

Argument: `uint`

**Command Line Flag:**

```
--create-blockchain-tx-fee [uint]
```

**Config File Flag:**

```json
"create-blockchain-tx-fee": "<uint>"
```

### --create-subnet-tx-fee [uint]

Transaction fee, in nAVAX, for transactions that create new subnets (default 100000000)

Argument: `uint`

**Command Line Flag:**

```
--create-subnet-tx-fee [uint]
```

**Config File Flag:**

```json
"create-subnet-tx-fee": "<uint>"
```

### --dao-proposal-bond-amount [uint]

Amount, in nAVAX, required to place a DAO proposal (default 100000000000)

Argument: `uint`

**Command Line Flag:**

```
--dao-proposal-bond-amount [uint]
```

**Config File Flag:**

```json
"dao-proposal-bond-amount": "<uint>"
```

### --data-dir [string]

Sets the base data directory where default sub-directories will be placed unless otherwise specified. (default "$HOME/.caminogo")

Argument: `string`

**Command Line Flag:**

```
--data-dir [string]
```

**Config File Flag:**

```json
"data-dir": "<string>"
```

### --db-config-file [string]

Path to database config file. Ignored if db-config-file-content is specified

Argument: `string`

**Command Line Flag:**

```
--db-config-file [string]
```

**Config File Flag:**

```json
"db-config-file": "<string>"
```

### --db-config-file-content [string]

Specifies base64 encoded database config content

Argument: `string`

**Command Line Flag:**

```
--db-config-file-content [string]
```

**Config File Flag:**

```json
"db-config-file-content": "<string>"
```

### --db-dir [string]

Path to database directory (default "$AVALANCHEGO_DATA_DIR/db")

Argument: `string`

**Command Line Flag:**

```
--db-dir [string]
```

**Config File Flag:**

```json
"db-dir": "<string>"
```

### --db-type [string]

Database type to use. Should be one of {leveldb, memdb} (default "leveldb")

Argument: `string`

**Command Line Flag:**

```
--db-type [string]
```

**Config File Flag:**

```json
"db-type": "<string>"
```

### --fd-limit [uint]

Attempts to raise the process file descriptor limit to at least this value and error if the value is above the system max (default 32768)

Argument: `uint`

**Command Line Flag:**

```
--fd-limit [uint]
```

**Config File Flag:**

```json
"fd-limit": "<uint>"
```

### --genesis [string]

Specifies a genesis config file (ignored when running standard networks or if genesis-content is specified)

Argument: `string`

**Command Line Flag:**

```
--genesis [string]
```

**Config File Flag:**

```json
"genesis": "<string>"
```

### --genesis-content [string]

Specifies base64 encoded genesis content

Argument: `string`

**Command Line Flag:**

```
--genesis-content [string]
```

**Config File Flag:**

```json
"genesis-content": "<string>"
```

### --health-check-averager-halflife [duration]

Halflife of averager when calculating a running average in a health check (default 10s)

Argument: `duration`

**Command Line Flag:**

```
--health-check-averager-halflife [duration]
```

**Config File Flag:**

```json
"health-check-averager-halflife": "<duration>"
```

### --health-check-frequency [duration]

Time between health checks (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--health-check-frequency [duration]
```

**Config File Flag:**

```json
"health-check-frequency": "<duration>"
```

### --http-allowed-origins [string]

Origins to allow on the HTTP port. Defaults to _ which allows all origins. Example: https://_.avax.network (default "\*")

Argument: `string`

**Command Line Flag:**

```
--http-allowed-origins [string]
```

**Config File Flag:**

```json
"http-allowed-origins": "<string>"
```

### --http-host [string]

Address of the HTTP server (default "127.0.0.1")

Argument: `string`

**Command Line Flag:**

```
--http-host [string]
```

**Config File Flag:**

```json
"http-host": "<string>"
```

### --http-idle-timeout [duration]

Maximum duration to wait for the next request when keep-alives are enabled. If http-idle-timeout is zero, the value of http-read-timeout is used. If both are zero, there is no timeout. (default 2m0s)

Argument: `duration`

**Command Line Flag:**

```
--http-idle-timeout [duration]
```

**Config File Flag:**

```json
"http-idle-timeout": "<duration>"
```

### --http-port [uint]

Port of the HTTP server (default 9650)

Argument: `uint`

**Command Line Flag:**

```
--http-port [uint]
```

**Config File Flag:**

```json
"http-port": "<uint>"
```

### --http-read-header-timeout [duration]

Maximum duration to read request headers. The connection's read deadline is reset after reading the headers. If http-read-header-timeout is zero, the value of http-read-timeout is used. If both are zero, there is no timeout. (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--http-read-header-timeout [duration]
```

**Config File Flag:**

```json
"http-read-header-timeout": "<duration>"
```

### --http-read-timeout [duration]

Maximum duration for reading the entire request, including the body. A zero or negative value means there will be no timeout (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--http-read-timeout [duration]
```

**Config File Flag:**

```json
"http-read-timeout": "<duration>"
```

### --http-shutdown-timeout [duration]

Maximum duration to wait for existing connections to complete during node shutdown (default 10s)

Argument: `duration`

**Command Line Flag:**

```
--http-shutdown-timeout [duration]
```

**Config File Flag:**

```json
"http-shutdown-timeout": "<duration>"
```

### --http-shutdown-wait [duration]

Duration to wait after receiving SIGTERM or SIGINT before initiating shutdown. The /health endpoint will return unhealthy during this duration (default 0s)

Argument: `duration`

**Command Line Flag:**

```
--http-shutdown-wait [duration]
```

**Config File Flag:**

```json
"http-shutdown-wait": "<duration>"
```

### --http-tls-cert-file [string]

TLS certificate file for the HTTPs server. Ignored if http-tls-cert-file-content is specified

Argument: `string`

**Command Line Flag:**

```
--http-tls-cert-file [string]
```

**Config File Flag:**

```json
"http-tls-cert-file": "<string>"
```

### --http-tls-cert-file-content [string]

Specifies base64 encoded TLS certificate for the HTTPs server

Argument: `string`

**Command Line Flag:**

```
--http-tls-cert-file-content [string]
```

**Config File Flag:**

```json
"http-tls-cert-file-content": "<string>"
```

### --http-tls-enabled

Upgrade the HTTP server to HTTPs

**Command Line Flag:**

```
--http-tls-enabled
```

**Config File Flag:**

```json
"http-tls-enabled": "true" or "false"
```

### --http-tls-key-file [string]

TLS private key file for the HTTPs server. Ignored if http-tls-key-file-content is specified

Argument: `string`

**Command Line Flag:**

```
--http-tls-key-file [string]
```

**Config File Flag:**

```json
"http-tls-key-file": "<string>"
```

### --http-tls-key-file-content [string]

Specifies base64 encoded TLS private key for the HTTPs server

Argument: `string`

**Command Line Flag:**

```
--http-tls-key-file-content [string]
```

**Config File Flag:**

```json
"http-tls-key-file-content": "<string>"
```

### --http-write-timeout [duration]

Maximum duration before timing out writes of the response. It is reset whenever a new request's header is read. A zero or negative value means there will be no timeout. (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--http-write-timeout [duration]
```

**Config File Flag:**

```json
"http-write-timeout": "<duration>"
```

### --inbound-connection-throttling-cooldown [duration]

Upgrade an inbound connection from a given IP at most once per this duration. If 0, don't rate-limit inbound connection upgrades (default 10s)

Argument: `duration`

**Command Line Flag:**

```
--inbound-connection-throttling-cooldown [duration]
```

**Config File Flag:**

```json
"inbound-connection-throttling-cooldown": "<duration>"
```

### --inbound-connection-throttling-max-conns-per-sec [float]

Max number of inbound connections to accept (from all peers) per second (default 256)

Argument: `float`

**Command Line Flag:**

```
--inbound-connection-throttling-max-conns-per-sec [float]
```

**Config File Flag:**

```json
"inbound-connection-throttling-max-conns-per-sec": "<float>"
```

### --index-allow-incomplete

If true, allow running the node in such a way that could cause an index to miss transactions. Ignored if index is disabled

**Command Line Flag:**

```
--index-allow-incomplete
```

**Config File Flag:**

```json
"index-allow-incomplete": "true" or "false"
```

### --index-enabled

If true, index all accepted containers and transactions and expose them via an API

**Command Line Flag:**

```
--index-enabled
```

**Config File Flag:**

```json
"index-enabled": "true" or "false"
```

### --ipcs-chain-ids [string]

Comma separated list of chain ids to add to the IPC engine. Example: 11111111111111111111111111111111LpoYY,4R5p2RXDGLqaifZE4hHWH9owe34pfoBULn1DrQTWivjg8o4aH

Argument: `string`

**Command Line Flag:**

```
--ipcs-chain-ids [string]
```

**Config File Flag:**

```json
"ipcs-chain-ids": "<string>"
```

### --ipcs-path [string]

The directory (Unix) or named pipe name prefix (Windows) for IPC sockets

Argument: `string`

**Command Line Flag:**

```
--ipcs-path [string]
```

**Config File Flag:**

```json
"ipcs-path": "<string>"
```

### --log-dir [string]

Logging directory for Avalanche (default "$AVALANCHEGO_DATA_DIR/logs")

Argument: `string`

**Command Line Flag:**

```
--log-dir [string]
```

**Config File Flag:**

```json
"log-dir": "<string>"
```

### --log-disable-display-plugin-logs

Disables displaying plugin logs in stdout.

**Command Line Flag:**

```
--log-disable-display-plugin-logs
```

**Config File Flag:**

```json
"log-disable-display-plugin-logs": "true" or "false"
```

### --log-display-level [string]

The log display level. If left blank, will inherit the value of log-level. Otherwise, should be one of {verbo, debug, trace, info, warn, error, fatal, off}

Argument: `string`

**Command Line Flag:**

```
--log-display-level [string]
```

**Config File Flag:**

```json
"log-display-level": "<string>"
```

### --log-format [string]

The structure of log format. Defaults to 'auto' which formats terminal-like logs, when the output is a terminal. Otherwise, should be one of {auto, plain, colors, json} (default "auto")

Argument: `string`

**Command Line Flag:**

```
--log-format [string]
```

**Config File Flag:**

```json
"log-format": "<string>"
```

### --log-level [string]

The log level. Should be one of {verbo, debug, trace, info, warn, error, fatal, off} (default "info")

Argument: `string`

**Command Line Flag:**

```
--log-level [string]
```

**Config File Flag:**

```json
"log-level": "<string>"
```

### --log-rotater-compress-enabled

Enables the compression of rotated log files through gzip.

**Command Line Flag:**

```
--log-rotater-compress-enabled
```

**Config File Flag:**

```json
"log-rotater-compress-enabled": "true" or "false"
```

### --log-rotater-max-age [uint]

The maximum number of days to retain old log files based on the timestamp encoded in their filename. 0 means retain all old log files.

Argument: `uint`

**Command Line Flag:**

```
--log-rotater-max-age [uint]
```

**Config File Flag:**

```json
"log-rotater-max-age": "<uint>"
```

### --log-rotater-max-files [uint]

The maximum number of old log files to retain. 0 means retain all old log files. (default 7)

Argument: `uint`

**Command Line Flag:**

```
--log-rotater-max-files [uint]
```

**Config File Flag:**

```json
"log-rotater-max-files": "<uint>"
```

### --log-rotater-max-size [uint]

The maximum file size in megabytes of the log file before it gets rotated. (default 8)

Argument: `uint`

**Command Line Flag:**

```
--log-rotater-max-size [uint]
```

**Config File Flag:**

```json
"log-rotater-max-size": "<uint>"
```

### --max-stake-duration [duration]

Maximum staking duration (default 8760h0m0s)

Argument: `duration`

**Command Line Flag:**

```
--max-stake-duration [duration]
```

**Config File Flag:**

```json
"max-stake-duration": "<duration>"
```

### --max-validator-stake [uint]

Maximum stake, in nAVAX, that can be placed on a validator on the primary network (default 3000000000000000)

Argument: `uint`

**Command Line Flag:**

```
--max-validator-stake [uint]
```

**Config File Flag:**

```json
"max-validator-stake": "<uint>"
```

### --meter-vms-enabled

Enable Meter VMs to track VM performance with more granularity (default true)

**Command Line Flag:**

```
--meter-vms-enabled
```

**Config File Flag:**

```json
"meter-vms-enabled": "true" or "false"
```

### --min-delegation-fee [uint]

Minimum delegation fee, in the range [0, 1000000], that can be charged for delegation on the primary network (default 20000)

Argument: `uint`

**Command Line Flag:**

```
--min-delegation-fee [uint]
```

**Config File Flag:**

```json
"min-delegation-fee": "<uint>"
```

### --min-delegator-stake [uint]

Minimum stake, in nAVAX, that can be delegated on the primary network (default 25000000000)

Argument: `uint`

**Command Line Flag:**

```
--min-delegator-stake [uint]
```

**Config File Flag:**

```json
"min-delegator-stake": "<uint>"
```

### --min-stake-duration [duration]

Minimum staking duration (default 24h0m0s)

Argument: `duration`

**Command Line Flag:**

```
--min-stake-duration [duration]
```

**Config File Flag:**

```json
"min-stake-duration": "<duration>"
```

### --min-validator-stake [uint]

Minimum stake, in nAVAX, required to validate the primary network (default 2000000000000)

Argument: `uint`

**Command Line Flag:**

```
--min-validator-stake [uint]
```

**Config File Flag:**

```json
"min-validator-stake": "<uint>"
```

### --network-allow-private-ips

Allows the node to initiate outbound connection attempts to peers with private IPs (default true)

**Command Line Flag:**

```
--network-allow-private-ips
```

**Config File Flag:**

```json
"network-allow-private-ips": "true" or "false"
```

### --network-compression-enabled

If true, compress certain outbound messages. This node will be able to parse compressed inbound messages regardless of this flag's value (default true)

**Command Line Flag:**

```
--network-compression-enabled
```

**Config File Flag:**

```json
"network-compression-enabled": "true" or "false"
```

### --network-health-max-outstanding-request-duration [duration]

Node reports unhealthy if there has been a request outstanding for this duration (default 5m0s)

Argument: `duration`

**Command Line Flag:**

```
--network-health-max-outstanding-request-duration [duration]
```

**Config File Flag:**

```json
"network-health-max-outstanding-request-duration": "<duration>"
```

### --network-health-max-portion-send-queue-full [float]

Network layer returns unhealthy if more than this portion of the pending send queue is full (default 0.9)

Argument: `float`

**Command Line Flag:**

```
--network-health-max-portion-send-queue-full [float]
```

**Config File Flag:**

```json
"network-health-max-portion-send-queue-full": "<float>"
```

### --network-health-max-send-fail-rate [float]

Network layer reports unhealthy if more than this portion of attempted message sends fail (default 0.9)

Argument: `float`

**Command Line Flag:**

```
--network-health-max-send-fail-rate [float]
```

**Config File Flag:**

```json
"network-health-max-send-fail-rate": "<float>"
```

### --network-health-max-time-since-msg-received [duration]

Network layer returns unhealthy if haven't received a message for at least this much time (default 1m0s)

Argument: `duration`

**Command Line Flag:**

```
--network-health-max-time-since-msg-received [duration]
```

**Config File Flag:**

```json
"network-health-max-time-since-msg-received": "<duration>"
```

### --network-health-max-time-since-msg-sent [duration]

Network layer returns unhealthy if haven't sent a message for at least this much time (default 1m0s)

Argument: `duration`

**Command Line Flag:**

```
--network-health-max-time-since-msg-sent [duration]
```

**Config File Flag:**

```json
"network-health-max-time-since-msg-sent": "<duration>"
```

### --network-health-min-conn-peers [uint]

Network layer returns unhealthy if connected to less than this many peers (default 1)

Argument: `uint`

**Command Line Flag:**

```
--network-health-min-conn-peers [uint]
```

**Config File Flag:**

```json
"network-health-min-conn-peers": "<uint>"
```

### --network-id [string]

Network ID this node will connect to (default "camino")

Argument: `string`

**Command Line Flag:**

```
--network-id [string]
```

**Config File Flag:**

```json
"network-id": "<string>"
```

### --network-initial-reconnect-delay [duration]

Initial delay duration must be waited before attempting to reconnect a peer (default 1s)

Argument: `duration`

**Command Line Flag:**

```
--network-initial-reconnect-delay [duration]
```

**Config File Flag:**

```json
"network-initial-reconnect-delay": "<duration>"
```

### --network-initial-timeout [duration]

Initial timeout value of the adaptive timeout manager (default 5s)

Argument: `duration`

**Command Line Flag:**

```
--network-initial-timeout [duration]
```

**Config File Flag:**

```json
"network-initial-timeout": "<duration>"
```

### --network-max-clock-difference [duration]

Max allowed clock difference value between this node and peers (default 1m0s)

Argument: `duration`

**Command Line Flag:**

```
--network-max-clock-difference [duration]
```

**Config File Flag:**

```json
"network-max-clock-difference": "<duration>"
```

### --network-max-reconnect-delay [duration]

Maximum delay duration must be waited before attempting to reconnect a peer (default 1m0s)

Argument: `duration`

**Command Line Flag:**

```
--network-max-reconnect-delay [duration]
```

**Config File Flag:**

```json
"network-max-reconnect-delay": "<duration>"
```

### --network-maximum-inbound-timeout [duration]

Maximum timeout value of an inbound message. Defines duration within which an incoming message must be fulfilled. Incoming messages containing deadline higher than this value will be overridden with this value. (default 10s)

Argument: `duration`

**Command Line Flag:**

```
--network-maximum-inbound-timeout [duration]
```

**Config File Flag:**

```json
"network-maximum-inbound-timeout": "<duration>"
```

### --network-maximum-timeout [duration]

Maximum timeout value of the adaptive timeout manager (default 10s)

Argument: `duration`

**Command Line Flag:**

```
--network-maximum-timeout [duration]
```

**Config File Flag:**

```json
"network-maximum-timeout": "<duration>"
```

### --network-minimum-timeout [duration]

Minimum timeout value of the adaptive timeout manager (default 2s)

Argument: `duration`

**Command Line Flag:**

```
--network-minimum-timeout [duration]
```

**Config File Flag:**

```json
"network-minimum-timeout": "<duration>"
```

### --network-peer-list-gossip-frequency [duration]

Gossip [network-peer-list-num-validator-ips] validator IPs to [network-peer-list-validator-gossip-size] validators, [network-peer-list-non-validator-gossip-size] non-validators, and [network-peer-list-peers-gossip-size] validating or non-validating peers every [network-peer-list-gossip-frequency] (default 1m0s)

Argument: `duration`

**Command Line Flag:**

```
--network-peer-list-gossip-frequency [duration]
```

**Config File Flag:**

```json
"network-peer-list-gossip-frequency": "<duration>"
```

### --network-peer-list-non-validator-gossip-size [uint]

Gossip [network-peer-list-num-validator-ips] validator IPs to [network-peer-list-validator-gossip-size] validators, [network-peer-list-non-validator-gossip-size] non-validators, and [network-peer-list-peers-gossip-size] validating or non-validating peers every [network-peer-list-gossip-frequency]

Argument: `uint`

**Command Line Flag:**

```
--network-peer-list-non-validator-gossip-size [uint]
```

**Config File Flag:**

```json
"network-peer-list-non-validator-gossip-size": "<uint>"
```

### --network-peer-list-num-validator-ips [uint]

Gossip [network-peer-list-num-validator-ips] validator IPs to [network-peer-list-validator-gossip-size] validators, [network-peer-list-non-validator-gossip-size] non-validators, and [network-peer-list-peers-gossip-size] validating or non-validating peers every [network-peer-list-gossip-frequency] (default 15)

Argument: `uint`

**Command Line Flag:**

```
--network-peer-list-num-validator-ips [uint]
```

**Config File Flag:**

```json
"network-peer-list-num-validator-ips": "<uint>"
```

### --network-peer-list-peers-gossip-size [uint]

Gossip [network-peer-list-num-validator-ips] validator IPs to [network-peer-list-validator-gossip-size] validators, [network-peer-list-non-validator-gossip-size] non-validators, and [network-peer-list-peers-gossip-size] validating or non-validating peers every [network-peer-list-gossip-frequency] (default 10)

Argument: `uint`

**Command Line Flag:**

```
--network-peer-list-peers-gossip-size [uint]
```

**Config File Flag:**

```json
"network-peer-list-peers-gossip-size": "<uint>"
```

### --network-peer-list-validator-gossip-size [uint]

Gossip [network-peer-list-num-validator-ips] validator IPs to [network-peer-list-validator-gossip-size] validators, [network-peer-list-non-validator-gossip-size] non-validators, and [network-peer-list-peers-gossip-size] validating or non-validating peers every [network-peer-list-gossip-frequency] (default 20)

Argument: `uint`

**Command Line Flag:**

```
--network-peer-list-validator-gossip-size [uint]
```

**Config File Flag:**

```json
"network-peer-list-validator-gossip-size": "<uint>"
```

### --network-peer-read-buffer-size [uint]

Size, in bytes, of the buffer that we read peer messages into (there is one buffer per peer) (default 8192)

Argument: `uint`

**Command Line Flag:**

```
--network-peer-read-buffer-size [uint]
```

**Config File Flag:**

```json
"network-peer-read-buffer-size": "<uint>"
```

### --network-peer-write-buffer-size [uint]

Size, in bytes, of the buffer that we write peer messages into (there is one buffer per peer) (default 8192)

Argument: `uint`

**Command Line Flag:**

```
--network-peer-write-buffer-size [uint]
```

**Config File Flag:**

```json
"network-peer-write-buffer-size": "<uint>"
```

### --network-ping-frequency [duration]

Frequency of pinging other peers (default 22.5s)

Argument: `duration`

**Command Line Flag:**

```
--network-ping-frequency [duration]
```

**Config File Flag:**

```json
"network-ping-frequency": "<duration>"
```

### --network-ping-timeout [duration]

Timeout value for Ping-Pong with a peer (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--network-ping-timeout [duration]
```

**Config File Flag:**

```json
"network-ping-timeout": "<duration>"
```

### --network-read-handshake-timeout [duration]

Timeout value for reading handshake messages (default 15s)

Argument: `duration`

**Command Line Flag:**

```
--network-read-handshake-timeout [duration]
```

**Config File Flag:**

```json
"network-read-handshake-timeout": "<duration>"
```

### --network-require-validator-to-connect

If true, this node will only maintain a connection with another node if this node is a validator, the other node is a validator, or the other node is a beacon

**Command Line Flag:**

```
--network-require-validator-to-connect
```

**Config File Flag:**

```json
"network-require-validator-to-connect": "true" or "false"
```

### --network-tcp-proxy-enabled

Require all P2P connections to be initiated with a TCP proxy header

**Command Line Flag:**

```
--network-tcp-proxy-enabled
```

**Config File Flag:**

```json
"network-tcp-proxy-enabled": "true" or "false"
```

### --network-tcp-proxy-read-timeout [duration]

Maximum duration to wait for a TCP proxy header (default 3s)

Argument: `duration`

**Command Line Flag:**

```
--network-tcp-proxy-read-timeout [duration]
```

**Config File Flag:**

```json
"network-tcp-proxy-read-timeout": "<duration>"
```

### --network-timeout-coefficient [float]

Multiplied by average network response time to get the network timeout. Must be >= 1 (default 2)

Argument: `float`

**Command Line Flag:**

```
--network-timeout-coefficient [float]
```

**Config File Flag:**

```json
"network-timeout-coefficient": "<float>"
```

### --network-timeout-halflife [duration]

Halflife of average network response time. Higher value --> network timeout is less volatile. Can't be 0 (default 5m0s)

Argument: `duration`

**Command Line Flag:**

```
--network-timeout-halflife [duration]
```

**Config File Flag:**

```json
"network-timeout-halflife": "<duration>"
```

### --network-tls-key-log-file-unsafe [string]

TLS key log file path. Should only be specified for debugging

Argument: `string`

**Command Line Flag:**

```
--network-tls-key-log-file-unsafe [string]
```

**Config File Flag:**

```json
"network-tls-key-log-file-unsafe": "<string>"
```

### --outbound-connection-throttling-rps [uint]

Make at most this number of outgoing peer connection attempts per second (default 50)

Argument: `uint`

**Command Line Flag:**

```
--outbound-connection-throttling-rps [uint]
```

**Config File Flag:**

```json
"outbound-connection-throttling-rps": "<uint>"
```

### --outbound-connection-timeout [duration]

Timeout when dialing a peer (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--outbound-connection-timeout [duration]
```

**Config File Flag:**

```json
"outbound-connection-timeout": "<duration>"
```

### --plugin-dir [string]

Path to the plugin directory (default "$AVALANCHEGO_DATA_DIR/plugins")

Argument: `string`

**Command Line Flag:**

```
--plugin-dir [string]
```

**Config File Flag:**

```json
"plugin-dir": "<string>"
```

### --profile-continuous-enabled

Whether the app should continuously produce performance profiles

**Command Line Flag:**

```
--profile-continuous-enabled
```

**Config File Flag:**

```json
"profile-continuous-enabled": "true" or "false"
```

### --profile-continuous-freq [duration]

How frequently to rotate performance profiles (default 15m0s)

Argument: `duration`

**Command Line Flag:**

```
--profile-continuous-freq [duration]
```

**Config File Flag:**

```json
"profile-continuous-freq": "<duration>"
```

### --profile-continuous-max-files [int]

Maximum number of historical profiles to keep (default 5)

Argument: `int`

**Command Line Flag:**

```
--profile-continuous-max-files [int]
```

**Config File Flag:**

```json
"profile-continuous-max-files": "<int>"
```

### --profile-dir [string]

Path to the profile directory (default "$AVALANCHEGO_DATA_DIR/profiles")

Argument: `string`

**Command Line Flag:**

```
--profile-dir [string]
```

**Config File Flag:**

```json
"profile-dir": "<string>"
```

### --proposervm-use-current-height

Have the ProposerVM always report the last accepted P-chain block height

**Command Line Flag:**

```
--proposervm-use-current-height
```

**Config File Flag:**

```json
"proposervm-use-current-height": "true" or "false"
```

### --public-ip [string]

Public IP of this node for P2P communication. If empty, try to discover with NAT

Argument: `string`

**Command Line Flag:**

```
--public-ip [string]
```

**Config File Flag:**

```json
"public-ip": "<string>"
```

### --public-ip-resolution-frequency [duration]

Frequency at which this node resolves/updates its public IP and renew NAT mappings, if applicable (default 5m0s)

Argument: `duration`

**Command Line Flag:**

```
--public-ip-resolution-frequency [duration]
```

**Config File Flag:**

```json
"public-ip-resolution-frequency": "<duration>"
```

### --public-ip-resolution-service [string]

Only acceptable values are 'ifconfigco', 'opendns' or 'ifconfigme'. When provided, the node will use that service to periodically resolve/update its public IP. Ignored if public-ip is set

Argument: `string`

**Command Line Flag:**

```
--public-ip-resolution-service [string]
```

**Config File Flag:**

```json
"public-ip-resolution-service": "<string>"
```

### --router-health-max-drop-rate [float]

Node reports unhealthy if the router drops more than this portion of messages (default 1)

Argument: `float`

**Command Line Flag:**

```
--router-health-max-drop-rate [float]
```

**Config File Flag:**

```json
"router-health-max-drop-rate": "<float>"
```

### --router-health-max-outstanding-requests [uint]

Node reports unhealthy if there are more than this many outstanding consensus requests (Get, PullQuery, etc.) over all chains (default 1024)

Argument: `uint`

**Command Line Flag:**

```
--router-health-max-outstanding-requests [uint]
```

**Config File Flag:**

```json
"router-health-max-outstanding-requests": "<uint>"
```

### --snow-avalanche-batch-size [int]

Number of operations to batch in each new vertex (default 30)

Argument: `int`

**Command Line Flag:**

```
--snow-avalanche-batch-size [int]
```

**Config File Flag:**

```json
"snow-avalanche-batch-size": "<int>"
```

### --snow-avalanche-num-parents [int]

Number of vertexes for reference from each new vertex (default 5)

Argument: `int`

**Command Line Flag:**

```
--snow-avalanche-num-parents [int]
```

**Config File Flag:**

```json
"snow-avalanche-num-parents": "<int>"
```

### --snow-concurrent-repolls [int]

Minimum number of concurrent polls for finalizing consensus (default 4)

Argument: `int`

**Command Line Flag:**

```
--snow-concurrent-repolls [int]
```

**Config File Flag:**

```json
"snow-concurrent-repolls": "<int>"
```

### --snow-max-processing [int]

Maximum number of processing items to be considered healthy (default 256)

Argument: `int`

**Command Line Flag:**

```
--snow-max-processing [int]
```

**Config File Flag:**

```json
"snow-max-processing": "<int>"
```

### --snow-max-time-processing [duration]

Maximum amount of time an item should be processing and still be healthy (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--snow-max-time-processing [duration]
```

**Config File Flag:**

```json
"snow-max-time-processing": "<duration>"
```

### --snow-mixed-query-num-push-non-vdr [uint]

If this node is not a validator, when a container is inserted into consensus, send a Push Query to snow-mixed-query-num-push-non-vdr validators and a Pull Query to the others. Must be <= k.

Argument: `uint`

**Command Line Flag:**

```
--snow-mixed-query-num-push-non-vdr [uint]
```

**Config File Flag:**

```json
"snow-mixed-query-num-push-non-vdr": "<uint>"
```

### --snow-mixed-query-num-push-vdr [uint]

If this node is a validator, when a container is inserted into consensus, send a Push Query to snow-mixed-query-num-push-vdr validators and a Pull Query to the others. Must be <= k. (default 10)

Argument: `uint`

**Command Line Flag:**

```
--snow-mixed-query-num-push-vdr [uint]
```

**Config File Flag:**

```json
"snow-mixed-query-num-push-vdr": "<uint>"
```

### --snow-optimal-processing [int]

Optimal number of processing containers in consensus (default 10)

Argument: `int`

**Command Line Flag:**

```
--snow-optimal-processing [int]
```

**Config File Flag:**

```json
"snow-optimal-processing": "<int>"
```

### --snow-quorum-size [int]

Alpha value to use for required number positive results (default 15)

Argument: `int`

**Command Line Flag:**

```
--snow-quorum-size [int]
```

**Config File Flag:**

```json
"snow-quorum-size": "<int>"
```

### --snow-rogue-commit-threshold [int]

Beta value to use for rogue transactions (default 20)

Argument: `int`

**Command Line Flag:**

```
--snow-rogue-commit-threshold [int]
```

**Config File Flag:**

```json
"snow-rogue-commit-threshold": "<int>"
```

### --snow-sample-size [int]

Number of nodes to query for each network poll (default 20)

Argument: `int`

**Command Line Flag:**

```
--snow-sample-size [int]
```

**Config File Flag:**

```json
"snow-sample-size": "<int>"
```

### --snow-virtuous-commit-threshold [int]

Beta value to use for virtuous transactions (default 15)

Argument: `int`

**Command Line Flag:**

```
--snow-virtuous-commit-threshold [int]
```

**Config File Flag:**

```json
"snow-virtuous-commit-threshold": "<int>"
```

### --stake-max-consumption-rate [uint]

Maximum consumption rate of the remaining tokens to mint in the staking function (default 120000)

Argument: `uint`

**Command Line Flag:**

```
--stake-max-consumption-rate [uint]
```

**Config File Flag:**

```json
"stake-max-consumption-rate": "<uint>"
```

### --stake-min-consumption-rate [uint]

Minimum consumption rate of the remaining tokens to mint in the staking function (default 100000)

Argument: `uint`

**Command Line Flag:**

```
--stake-min-consumption-rate [uint]
```

**Config File Flag:**

```json
"stake-min-consumption-rate": "<uint>"
```

### --stake-minting-period [duration]

Consumption period of the staking function (default 8760h0m0s)

Argument: `duration`

**Command Line Flag:**

```
--stake-minting-period [duration]
```

**Config File Flag:**

```json
"stake-minting-period": "<duration>"
```

### --stake-supply-cap [uint]

Supply cap of the staking function (default 720000000000000000)

Argument: `uint`

**Command Line Flag:**

```
--stake-supply-cap [uint]
```

**Config File Flag:**

```json
"stake-supply-cap": "<uint>"
```

### --staking-disabled-weight [uint]

Weight to provide to each peer when staking is disabled (default 100)

Argument: `uint`

**Command Line Flag:**

```
--staking-disabled-weight [uint]
```

**Config File Flag:**

```json
"staking-disabled-weight": "<uint>"
```

### --staking-enabled

Enable staking. If enabled, Network TLS is required (default true)

**Command Line Flag:**

```
--staking-enabled
```

**Config File Flag:**

```json
"staking-enabled": "true" or "false"
```

### --staking-ephemeral-cert-enabled

If true, the node uses an ephemeral staking TLS key and certificate, and has an ephemeral node ID

**Command Line Flag:**

```
--staking-ephemeral-cert-enabled
```

**Config File Flag:**

```json
"staking-ephemeral-cert-enabled": "true" or "false"
```

### --staking-ephemeral-signer-enabled

If true, the node uses an ephemeral staking signer key

**Command Line Flag:**

```
--staking-ephemeral-signer-enabled
```

**Config File Flag:**

```json
"staking-ephemeral-signer-enabled": "true" or "false"
```

### --staking-port [uint]

Port of the consensus server (default 9651)

Argument: `uint`

**Command Line Flag:**

```
--staking-port [uint]
```

**Config File Flag:**

```json
"staking-port": "<uint>"
```

### --staking-signer-key-file [string]

Path to the signer private key for staking. Ignored if staking-signer-key-file-content is specified (default "$AVALANCHEGO_DATA_DIR/staking/signer.key")

Argument: `string`

**Command Line Flag:**

```
--staking-signer-key-file [string]
```

**Config File Flag:**

```json
"staking-signer-key-file": "<string>"
```

### --staking-signer-key-file-content [string]

Specifies base64 encoded signer private key for staking

Argument: `string`

**Command Line Flag:**

```
--staking-signer-key-file-content [string]
```

**Config File Flag:**

```json
"staking-signer-key-file-content": "<string>"
```

### --staking-tls-cert-file [string]

Path to the TLS certificate for staking. Ignored if staking-tls-cert-file-content is specified (default "$AVALANCHEGO_DATA_DIR/staking/staker.crt")

Argument: `string`

**Command Line Flag:**

```
--staking-tls-cert-file [string]
```

**Config File Flag:**

```json
"staking-tls-cert-file": "<string>"
```

### --staking-tls-cert-file-content [string]

Specifies base64 encoded TLS certificate for staking

Argument: `string`

**Command Line Flag:**

```
--staking-tls-cert-file-content [string]
```

**Config File Flag:**

```json
"staking-tls-cert-file-content": "<string>"
```

### --staking-tls-key-file [string]

Path to the TLS private key for staking. Ignored if staking-tls-key-file-content is specified (default "$AVALANCHEGO_DATA_DIR/staking/staker.key")

Argument: `string`

**Command Line Flag:**

```
--staking-tls-key-file [string]
```

**Config File Flag:**

```json
"staking-tls-key-file": "<string>"
```

### --staking-tls-key-file-content [string]

Specifies base64 encoded TLS private key for staking

Argument: `string`

**Command Line Flag:**

```
--staking-tls-key-file-content [string]
```

**Config File Flag:**

```json
"staking-tls-key-file-content": "<string>"
```

### --state-sync-ids [string]

Comma separated list of state sync peer ids to connect to. Example: NodeID-JR4dVmy6ffUGAKCBDkyCbeZbyHQBeDsET,NodeID-8CrVPQZ4VSqgL8zTdvL14G8HqAfrBr4z

Argument: `string`

**Command Line Flag:**

```
--state-sync-ids [string]
```

**Config File Flag:**

```json
"state-sync-ids": "<string>"
```

### --state-sync-ips [string]

Comma separated list of state sync peer ips to connect to. Example: 127.0.0.1:9630,127.0.0.1:9631

Argument: `string`

**Command Line Flag:**

```
--state-sync-ips [string]
```

**Config File Flag:**

```json
"state-sync-ips": "<string>"
```

### --subnet-config-content [string]

Specifies base64 encoded subnets configurations

Argument: `string`

**Command Line Flag:**

```
--subnet-config-content [string]
```

**Config File Flag:**

```json
"subnet-config-content": "<string>"
```

### --subnet-config-dir [string]

Subnet specific configurations parent directory. Ignored if subnet-config-content is specified (default "$AVALANCHEGO_DATA_DIR/configs/subnets")

Argument: `string`

**Command Line Flag:**

```
--subnet-config-dir [string]
```

**Config File Flag:**

```json
"subnet-config-dir": "<string>"
```

### --system-tracker-cpu-halflife [duration]

Halflife to use for the cpu tracker. Larger halflife --> cpu usage metrics change more slowly (default 15s)

Argument: `duration`

**Command Line Flag:**

```
--system-tracker-cpu-halflife [duration]
```

**Config File Flag:**

```json
"system-tracker-cpu-halflife": "<duration>"
```

### --system-tracker-disk-halflife [duration]

Halflife to use for the disk tracker. Larger halflife --> disk usage metrics change more slowly (default 1m0s)

Argument: `duration`

**Command Line Flag:**

```
--system-tracker-disk-halflife [duration]
```

**Config File Flag:**

```json
"system-tracker-disk-halflife": "<duration>"
```

### --system-tracker-disk-required-available-space [uint]

Minimum number of available bytes on disk, under which the node will shutdown. (default 536870912)

Argument: `uint`

**Command Line Flag:**

```
--system-tracker-disk-required-available-space [uint]
```

**Config File Flag:**

```json
"system-tracker-disk-required-available-space": "<uint>"
```

### --system-tracker-disk-warning-threshold-available-space [uint]

Warning threshold for the number of available bytes on disk, under which the node will be considered unhealthy. Must be >= [system-tracker-disk-required-available-space] (default 1073741824)

Argument: `uint`

**Command Line Flag:**

```
--system-tracker-disk-warning-threshold-available-space [uint]
```

**Config File Flag:**

```json
"system-tracker-disk-warning-threshold-available-space": "<uint>"
```

### --system-tracker-frequency [duration]

Frequency to check the real system usage of tracked processes. More frequent checks --> usage metrics are more accurate, but more expensive to track (default 500ms)

Argument: `duration`

**Command Line Flag:**

```
--system-tracker-frequency [duration]
```

**Config File Flag:**

```json
"system-tracker-frequency": "<duration>"
```

### --system-tracker-processing-halflife [duration]

Halflife to use for the processing requests tracker. Larger halflife --> usage metrics change more slowly (default 15s)

Argument: `duration`

**Command Line Flag:**

```
--system-tracker-processing-halflife [duration]
```

**Config File Flag:**

```json
"system-tracker-processing-halflife": "<duration>"
```

### --throttler-inbound-at-large-alloc-size [uint]

Size, in bytes, of at-large byte allocation in inbound message throttler (default 6291456)

Argument: `uint`

**Command Line Flag:**

```
--throttler-inbound-at-large-alloc-size [uint]
```

**Config File Flag:**

```json
"throttler-inbound-at-large-alloc-size": "<uint>"
```

### --throttler-inbound-bandwidth-max-burst-size [uint]

Max inbound bandwidth a node can use at once. Must be at least the max message size. See BandwidthThrottler (default 2097152)

Argument: `uint`

**Command Line Flag:**

```
--throttler-inbound-bandwidth-max-burst-size [uint]
```

**Config File Flag:**

```json
"throttler-inbound-bandwidth-max-burst-size": "<uint>"
```

### --throttler-inbound-bandwidth-refill-rate [uint]

Max average inbound bandwidth usage of a peer, in bytes per second. See BandwidthThrottler (default 524288)

Argument: `uint`

**Command Line Flag:**

```
--throttler-inbound-bandwidth-refill-rate [uint]
```

**Config File Flag:**

```json
"throttler-inbound-bandwidth-refill-rate": "<uint>"
```

### --throttler-inbound-cpu-max-non-validator-node-usage [float]

Maximum number of CPUs that a non-validator can utilize. Value should be in range [0, total core count] (default 1)

Argument: `float`

**Command Line Flag:**

```
--throttler-inbound-cpu-max-non-validator-node-usage [float]
```

**Config File Flag:**

```json
"throttler-inbound-cpu-max-non-validator-node-usage": "<float>"
```

### --throttler-inbound-cpu-max-non-validator-usage [float]

Number of CPUs that if fully utilized, will rate limit all non-validators. Value should be in range [0, total core count] (default 6.4)

Argument: `float`

**Command Line Flag:**

```
--throttler-inbound-cpu-max-non-validator-usage [float]
```

**Config File Flag:**

```json
"throttler-inbound-cpu-max-non-validator-usage": "<float>"
```

### --throttler-inbound-cpu-max-recheck-delay [duration]

In the CPU-based network throttler, check at least this often whether the node's CPU usage has fallen to an acceptable level (default 5s)

Argument: `duration`

**Command Line Flag:**

```
--throttler-inbound-cpu-max-recheck-delay [duration]
```

**Config File Flag:**

```json
"throttler-inbound-cpu-max-recheck-delay": "<duration>"
```

### --throttler-inbound-cpu-validator-alloc [float]

Maximum number of CPUs to allocate for use by validators. Value should be in range [0, total core count] (default 8)

Argument: `float`

**Command Line Flag:**

```
--throttler-inbound-cpu-validator-alloc [float]
```

**Config File Flag:**

```json
"throttler-inbound-cpu-validator-alloc": "<float>"
```

### --throttler-inbound-disk-max-non-validator-node-usage [float]

Maximum number of disk reads/writes per second that a non-validator can utilize. Must be >= 0 (default 1.073741824e+12)

Argument: `float`

**Command Line Flag:**

```
--throttler-inbound-disk-max-non-validator-node-usage [float]
```

**Config File Flag:**

```json
"throttler-inbound-disk-max-non-validator-node-usage": "<float>"
```

### --throttler-inbound-disk-max-non-validator-usage [float]

Number of disk reads/writes per second that, if fully utilized, will rate limit all non-validators. Must be >= 0 (default 1.073741824e+12)

Argument: `float`

**Command Line Flag:**

```
--throttler-inbound-disk-max-non-validator-usage [float]
```

**Config File Flag:**

```json
"throttler-inbound-disk-max-non-validator-usage": "<float>"
```

### --throttler-inbound-disk-max-recheck-delay [duration]

In the disk-based network throttler, check at least this often whether the node's disk usage has fallen to an acceptable level (default 5s)

Argument: `duration`

**Command Line Flag:**

```
--throttler-inbound-disk-max-recheck-delay [duration]
```

**Config File Flag:**

```json
"throttler-inbound-disk-max-recheck-delay": "<duration>"
```

### --throttler-inbound-disk-validator-alloc [float]

Maximum number of disk reads/writes per second to allocate for use by validators. Must be > 0 (default 1.073741824e+12)

Argument: `float`

**Command Line Flag:**

```
--throttler-inbound-disk-validator-alloc [float]
```

**Config File Flag:**

```json
"throttler-inbound-disk-validator-alloc": "<float>"
```

### --throttler-inbound-node-max-at-large-bytes [uint]

Max number of bytes a node can take from the inbound message throttler's at-large allocation. Must be at least the max message size (default 2097152)

Argument: `uint`

**Command Line Flag:**

```
--throttler-inbound-node-max-at-large-bytes [uint]
```

**Config File Flag:**

```json
"throttler-inbound-node-max-at-large-bytes": "<uint>"
```

### --throttler-inbound-node-max-processing-msgs [uint]

Max number of messages currently processing from a given node (default 1024)

Argument: `uint`

**Command Line Flag:**

```
--throttler-inbound-node-max-processing-msgs [uint]
```

**Config File Flag:**

```json
"throttler-inbound-node-max-processing-msgs": "<uint>"
```

### --throttler-inbound-validator-alloc-size [uint]

Size, in bytes, of validator byte allocation in inbound message throttler (default 33554432)

Argument: `uint`

**Command Line Flag:**

```
--throttler-inbound-validator-alloc-size [uint]
```

**Config File Flag:**

```json
"throttler-inbound-validator-alloc-size": "<uint>"
```

### --throttler-outbound-at-large-alloc-size [uint]

Size, in bytes, of at-large byte allocation in outbound message throttler (default 33554432)

Argument: `uint`

**Command Line Flag:**

```
--throttler-outbound-at-large-alloc-size [uint]
```

**Config File Flag:**

```json
"throttler-outbound-at-large-alloc-size": "<uint>"
```

### --throttler-outbound-node-max-at-large-bytes [uint]

Max number of bytes a node can take from the outbound message throttler's at-large allocation. Must be at least the max message size (default 2097152)

Argument: `uint`

**Command Line Flag:**

```
--throttler-outbound-node-max-at-large-bytes [uint]
```

**Config File Flag:**

```json
"throttler-outbound-node-max-at-large-bytes": "<uint>"
```

### --throttler-outbound-validator-alloc-size [uint]

Size, in bytes, of validator byte allocation in outbound message throttler (default 33554432)

Argument: `uint`

**Command Line Flag:**

```
--throttler-outbound-validator-alloc-size [uint]
```

**Config File Flag:**

```json
"throttler-outbound-validator-alloc-size": "<uint>"
```

### --tracing-enabled

If true, enable opentelemetry tracing

**Command Line Flag:**

```
--tracing-enabled
```

**Config File Flag:**

```json
"tracing-enabled": "true" or "false"
```

### --tracing-endpoint [string]

The endpoint to send trace data to (default "localhost:4317")

Argument: `string`

**Command Line Flag:**

```
--tracing-endpoint [string]
```

**Config File Flag:**

```json
"tracing-endpoint": "<string>"
```

### --tracing-exporter-type [string]

Type of exporter to use for tracing. Options are [grpc, http] (default "grpc")

Argument: `string`

**Command Line Flag:**

```
--tracing-exporter-type [string]
```

**Config File Flag:**

```json
"tracing-exporter-type": "<string>"
```

### --tracing-insecure

If true, don't use TLS when sending trace data (default true)

**Command Line Flag:**

```
--tracing-insecure
```

**Config File Flag:**

```json
"tracing-insecure": "true" or "false"
```

### --tracing-sample-rate [float]

The fraction of traces to sample. If >= 1, always sample. If <= 0, never sample (default 0.1)

Argument: `float`

**Command Line Flag:**

```
--tracing-sample-rate [float]
```

**Config File Flag:**

```json
"tracing-sample-rate": "<float>"
```

### --track-subnets [string]

List of subnets for the node to track. A node tracking a subnet will track the uptimes of the subnet validators and attempt to sync all the chains in the subnet. Before validating a subnet, a node should be tracking the subnet to avoid impacting their subnet validation uptime

Argument: `string`

**Command Line Flag:**

```
--track-subnets [string]
```

**Config File Flag:**

```json
"track-subnets": "<string>"
```

### --transform-subnet-tx-fee [uint]

Transaction fee, in nAVAX, for transactions that transform subnets (default 100000000)

Argument: `uint`

**Command Line Flag:**

```
--transform-subnet-tx-fee [uint]
```

**Config File Flag:**

```json
"transform-subnet-tx-fee": "<uint>"
```

### --tx-fee [uint]

Transaction fee, in nAVAX (default 1000000)

Argument: `uint`

**Command Line Flag:**

```
--tx-fee [uint]
```

**Config File Flag:**

```json
"tx-fee": "<uint>"
```

### --uptime-metric-freq [duration]

Frequency of renewing this node's average uptime metric (default 30s)

Argument: `duration`

**Command Line Flag:**

```
--uptime-metric-freq [duration]
```

**Config File Flag:**

```json
"uptime-metric-freq": "<duration>"
```

### --uptime-requirement [float]

Fraction of time a validator must be online to receive rewards (default 0.8)

Argument: `float`

**Command Line Flag:**

```
--uptime-requirement [float]
```

**Config File Flag:**

```json
"uptime-requirement": "<float>"
```

### --version

If true, print version and quit

**Command Line Flag:**

```
--version
```

**Config File Flag:**

```json
"version": "true" or "false"
```

### --vm-aliases-file [string]

Specifies a JSON file that maps vmIDs with custom aliases. Ignored if vm-aliases-file-content is specified (default "$AVALANCHEGO_DATA_DIR/configs/vms/aliases.json")

Argument: `string`

**Command Line Flag:**

```
--vm-aliases-file [string]
```

**Config File Flag:**

```json
"vm-aliases-file": "<string>"
```

### --vm-aliases-file-content [string]

Specifies base64 encoded maps vmIDs with custom aliases

Argument: `string`

**Command Line Flag:**

```
--vm-aliases-file-content [string]
```

**Config File Flag:**

```json
"vm-aliases-file-content": "<string>"
```
