---
sidebar_position: 4
---

# Subnet CLI

The [`subnet-cli`](https://github.com/chain4travel/camino-subnet-cli/) is a command-line interface to manage Camino Subnets.

## Install

### Source

```bash
git clone https://github.com/chain4travel/camino-subnet-cli.git
cd camino-subnet-cli;
go install -v .;
```

Once you have installed `subnet-cli`, run command `subnet-cli` to confirm it is
working as expected (_make sure your $GOBIN is in your $PATH_):

### Pre-Built Binaries

Pre-build binaries of `subnet-cli` are not available at this time.

```bash

## Usage

```bash
> subnet-cli
subnet-cli CLI

Usage:
  subnet-cli [command]

Available Commands:
  add         Sub-commands for creating resources
  completion  Generate the autocompletion script for the specified shell
  create      Sub-commands for creating resources
  help        Help about any command
  status      status commands
  wizard      A magical command for creating an entire subnet

Flags:
      --enable-prompt              'true' to enable prompt mode (default true)
  -h, --help                       help for subnet-cli
      --log-level string           log level (default "info")
      --poll-interval duration     interval to poll tx/blockchain status (default 1s)
      --request-timeout duration   request timeout (default 2m0s)

Use "subnet-cli [command] --help" for more information about a command.
```

It **DOES NOT** need to be run on the same host where you are running your validator.

### Network Selection

Should a `subnet-cli` command call an API endpoint, `--public-uri` is used to specify where the endpoint is.

At this point `subnet-cli` was only tested with the local endpoint: `http://127.0.0.1:9650`

### `subnet-cli create VMID`

This command is used to generate a valid VMID based on some string to uniquely
identify a VM. This should stay the same for all versions of the VM, so it
should be based on a word rather than the hash of some code.

```bash
subnet-cli create VMID <identifier> [--hash]
```

Example

```bash
> subnet-cli create VMID timestampvm
created a new VMID tGas3T58KzdjcJ2iKSyiYsWiqYctRXaPTqBCA11BqEkNg8kPc from timestampvm
```

### `subnet-cli create key`

```bash
> subnet-cli create key
created a new key ".subnet-cli.pk"
```

This creates a file `.subnet-cli.pk` under the current directory with a private key. By default,
`subnet-cli` uses the key specified in file `.subnet-cli.pk` on the P-Chain to pay for the transaction fee, unless `--private-key-path` is used to overwrite. Please make sure that you have enough fund on this P-Chain address to pay for transactions.

#### Local

On local node funds can be transfered from X-Chain to P-Chain using the following API calls:
- `avm.export`
- `platform.importAVAX`

```bash

### `subnet-cli wizard`

`wizard` is a magical command that:

- Adds all NodeIDs as validators to the primary network (skipping any that
  already exist)
- Creates a Subnet
- Adds all NodeIDs as validators on the Subnet
- Creates a new blockchain

Here is a command to create a Subnet on Fuji Testnet:

```bash
> subnet-cli wizard \
  --public-uri=http://127.0.0.1:9650 \
  --private-key-path=.subnet-cli.pk \
  --chain-name="TSwizz" \
  --validate-end="2023-05-10T09:34:23+02:00" \
  --vm-genesis-path="./timestampvm-genesis.json" \
  --node-ids="NodeID-Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD" \
  --vm-id="tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH"
```

And its full printed log on the console:

```text
2022-07-14T09:44:33.236+0200	info	client/client.go:81	fetching X-Chain id
2022-07-14T09:44:33.243+0200	info	client/client.go:87	fetched X-Chain id	{"id": "pgk8Re3MCEbQu62orC1ebw7YKzpX1Yk4iS7vTxZReAm9Pjp6m"}
2022-07-14T09:44:33.243+0200	info	client/client.go:96	fetching CAM asset id	{"uri": "http://127.0.0.1:9650"}
2022-07-14T09:44:33.245+0200	info	client/client.go:105	fetched CAM asset id	{"id": "23MDJv6nhwCGnEer4GsEQWwDURk42ZQBoc444eosZ4BVgH87EW"}
2022-07-14T09:44:33.245+0200	info	client/client.go:107	fetching network information
2022-07-14T09:44:33.245+0200	info	client/client.go:116	fetched network information	{"networkId": 1001, "networkName": "columbus"}

Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD is already a validator on 11111111111111111111111111111111LpoYY

Ready to run wizard, should we continue?
*--------------------------*---------------------------------------------------*
| PRIMARY P-CHAIN ADDRESS  | P-columbus17pysyr6av4n2gf6teqv3kjd5ewdkmncwrhq6qk |
*--------------------------*---------------------------------------------------*
| TOTAL P-CHAIN BALANCE    | 4,749.8053750 $CAM                                |
*--------------------------*---------------------------------------------------*
| TX FEE                   | 0.201 $CAM                                        |
*--------------------------*---------------------------------------------------*
| EACH STAKE AMOUNT        | 1.000 $CAM                                        |
*--------------------------*---------------------------------------------------*
| REQUIRED BALANCE         | 1.201 $CAM                                        |
*--------------------------*---------------------------------------------------*
| URI                      | http://127.0.0.1:9650                             |
*--------------------------*---------------------------------------------------*
| NETWORK NAME             | columbus                                          |
*--------------------------*---------------------------------------------------*
| NEW SUBNET VALIDATORS    | [Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD]               |
*--------------------------*---------------------------------------------------*
| SUBNET VALIDATION WEIGHT | 1,000                                             |
*--------------------------*---------------------------------------------------*
| CHAIN NAME               | TSwizz                                            |
*--------------------------*---------------------------------------------------*
| VM ID                    | tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH |
*--------------------------*---------------------------------------------------*
| VM GENESIS PATH          | ./timestampvm-genesis.json                        |
*--------------------------*---------------------------------------------------*
✔ Yes, let's create! I agree to pay the fee!


2022-07-14T09:44:54.138+0200	info	client/p.go:131	creating subnet	{"dryMode": false, "assetId": "23MDJv6nhwCGnEer4GsEQWwDURk42ZQBoc444eosZ4BVgH87EW", "createSubnetTxFee": 100000000}
2022-07-14T09:44:54.178+0200	info	platformvm/checker.go:74	polling subnet	{"subnetId": "MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9"}
2022-07-14T09:44:54.179+0200	info	platformvm/checker.go:48	polling P-Chain tx	{"txId": "MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9", "expectedStatus": "Committed"}
2022-07-14T09:44:54.179+0200	info	poll/poll.go:42	start polling	{"internal": "1s"}
2022-07-14T09:44:55.182+0200	info	poll/poll.go:66	poll confirmed	{"took": "1.002398061s"}
2022-07-14T09:44:55.182+0200	info	platformvm/checker.go:88	finding subnets	{"subnetId": "MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9"}
2022-07-14T09:44:55.182+0200	info	poll/poll.go:42	start polling	{"internal": "1s"}
2022-07-14T09:44:55.182+0200	info	poll/poll.go:66	poll confirmed	{"took": "450.058µs"}
created subnet "MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9" (took 1.002848119s)



Now, time for some config changes on your node(s).
Set --whitelisted-subnets=MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9 and move the compiled VM tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH to <build-dir>/plugins/tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH.
When you're finished, restart your node.
✔ Yes, let's continue! I've updated --whitelisted-subnets, built my VM, and restarted my node(s)!


2022-07-14T09:48:26.168+0200	info	client/p.go:299	adding subnet validator	{"subnetId": "MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9", "txFee": 1000000, "start": "2022-07-14T09:48:56.162+0200", "end": "2023-03-16T01:00:00.000+0100", "weight": 1000}
2022-07-14T09:48:26.193+0200	info	platformvm/checker.go:48	polling P-Chain tx	{"txId": "2a6ZRwNAEZN7t3wAQU9eASSUDsSM7x7BPM75vN84vPf3hWDuzo", "expectedStatus": "Committed"}
2022-07-14T09:48:26.193+0200	info	poll/poll.go:42	start polling	{"internal": "1s"}
2022-07-14T09:48:27.193+0200	info	poll/poll.go:66	poll confirmed	{"took": "1.000624494s"}
added Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD to subnet MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9 validator set (took 1.000624494s)

waiting for validator Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD to start validating MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9...(could take a few minutes)


2022-07-14T09:48:57.199+0200	info	client/p.go:497	creating blockchain	{"subnetId": "MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9", "chainName": "TSwizz", "vmId": "tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH", "createBlockchainTxFee": 100000000}
created blockchain "2BYk5xByKdsumDavgrY2VdNkc7ichKTyTpBUSKCwBbFh321SQB" (took 2.575819ms)

*-------------------------*----------------------------------------------------*
| PRIMARY P-CHAIN ADDRESS | P-columbus17pysyr6av4n2gf6teqv3kjd5ewdkmncwrhq6qk  |
*-------------------------*----------------------------------------------------*
| TOTAL P-CHAIN BALANCE   | 4,749.7043750 $CAM                                 |
*-------------------------*----------------------------------------------------*
| URI                     | http://127.0.0.1:9650                              |
*-------------------------*----------------------------------------------------*
| NETWORK NAME            | columbus                                           |
*-------------------------*----------------------------------------------------*
| SUBNET VALIDATORS       | [Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD]                |
*-------------------------*----------------------------------------------------*
| SUBNET ID               | MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9  |
*-------------------------*----------------------------------------------------*
| BLOCKCHAIN ID           | 2BYk5xByKdsumDavgrY2VdNkc7ichKTyTpBUSKCwBbFh321SQB |
*-------------------------*----------------------------------------------------*
| CHAIN NAME              | TSwizz                                             |
*-------------------------*----------------------------------------------------*
| VM ID                   | tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH  |
*-------------------------*----------------------------------------------------*
| VM GENESIS PATH         | ./timestampvm-genesis.json                         |
*-------------------------*----------------------------------------------------*
```

The following are created successfully:

- Subnet: MZE36w4FFMpWu7hoJjHmf8bAJcx2uvFK3oKSciobQrrSPAtx9
- Blockchain: 2BYk5xByKdsumDavgrY2VdNkc7ichKTyTpBUSKCwBbFh321SQB

### `subnet-cli create subnet`

```bash
subnet-cli create subnet
```

To create a Subnet on the local network:

```bash
subnet-cli create subnet \
--private-key-path=.subnet-cli.pk \
--public-uri=http://127.0.0.1:9650
```

And its console log:

```text
2022-07-18T11:05:38.630+0200	info	client/client.go:81	fetching X-Chain id
2022-07-18T11:05:38.636+0200	info	client/client.go:87	fetched X-Chain id	{"id": "pgk8Re3MCEbQu62orC1ebw7YKzpX1Yk4iS7vTxZReAm9Pjp6m"}
2022-07-18T11:05:38.636+0200	info	client/client.go:96	fetching CAM asset id	{"uri": "http://127.0.0.1:9650"}
2022-07-18T11:05:38.636+0200	info	client/client.go:105	fetched CAM asset id	{"id": "23MDJv6nhwCGnEer4GsEQWwDURk42ZQBoc444eosZ4BVgH87EW"}
2022-07-18T11:05:38.636+0200	info	client/client.go:107	fetching network information
2022-07-18T11:05:38.637+0200	info	client/client.go:116	fetched network information	{"networkId": 1001, "networkName": "columbus"}
2022-07-18T11:05:38.666+0200	info	client/p.go:131	creating subnet	{"dryMode": true, "assetId": "23MDJv6nhwCGnEer4GsEQWwDURk42ZQBoc444eosZ4BVgH87EW", "createSubnetTxFee": 100000000}

Ready to create subnet resources, should we continue?
*-------------------------*----------------------------------------------------*
| PRIMARY P-CHAIN ADDRESS | P-columbus17pysyr6av4n2gf6teqv3kjd5ewdkmncwrhq6qk  |
*-------------------------*----------------------------------------------------*
| TOTAL P-CHAIN BALANCE   | 2,499.9990000 $CAM                                 |
*-------------------------*----------------------------------------------------*
| TX FEE                  | 0.100 $CAM                                         |
*-------------------------*----------------------------------------------------*
| URI                     | http://127.0.0.1:9650                              |
*-------------------------*----------------------------------------------------*
| NETWORK NAME            | columbus                                           |
*-------------------------*----------------------------------------------------*
| EXPECTED SUBNET ID      | 2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx |
*-------------------------*----------------------------------------------------*
✔ Yes, let's create! I agree to pay the fee!



2022-07-18T11:05:43.432+0200	info	client/p.go:131	creating subnet	{"dryMode": false, "assetId": "23MDJv6nhwCGnEer4GsEQWwDURk42ZQBoc444eosZ4BVgH87EW", "createSubnetTxFee": 100000000}
2022-07-18T11:05:43.435+0200	info	platformvm/checker.go:74	polling subnet	{"subnetId": "2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx"}
2022-07-18T11:05:43.436+0200	info	platformvm/checker.go:48	polling P-Chain tx	{"txId": "2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx", "expectedStatus": "Committed"}
2022-07-18T11:05:43.436+0200	info	poll/poll.go:42	start polling	{"internal": "1s"}
2022-07-18T11:05:44.437+0200	info	poll/poll.go:66	poll confirmed	{"took": "1.001827607s"}
2022-07-18T11:05:44.438+0200	info	platformvm/checker.go:88	finding subnets	{"subnetId": "2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx"}
2022-07-18T11:05:44.438+0200	info	poll/poll.go:42	start polling	{"internal": "1s"}
2022-07-18T11:05:44.438+0200	info	poll/poll.go:66	poll confirmed	{"took": "480.827µs"}
created subnet "2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx" (took 1.002308434s)
(subnet must be whitelisted beforehand via --whitelisted-subnets flag!)

*-------------------------*----------------------------------------------------*
| PRIMARY P-CHAIN ADDRESS | P-columbus17pysyr6av4n2gf6teqv3kjd5ewdkmncwrhq6qk  |
*-------------------------*----------------------------------------------------*
| TOTAL P-CHAIN BALANCE   | 2,499.8990000 $CAM                                 |
*-------------------------*----------------------------------------------------*
| URI                     | http://127.0.0.1:9650                              |
*-------------------------*----------------------------------------------------*
| NETWORK NAME            | columbus                                           |
*-------------------------*----------------------------------------------------*
| CREATED SUBNET ID       | 2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx |
*-------------------------*----------------------------------------------------*
```

### `subnet-cli add validator`

```bash
subnet-cli add validator \
--node-ids="[YOUR-NODE-ID]" \
--stake-amount=[STAKE-AMOUNT-IN-NANO-CAM] \
--validate-reward-fee-percent=2
```

To add a validator to the local network:

```bash
subnet-cli add validator \
--public-uri=http://localhost:9650NodeID-Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD \  
--node-ids="NodeID-Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD" \  
--stake-amount=100000000000 \  
--validate-reward-fee-percent=3
```

```text
2022-07-18T11:00:52.315+0200	info	client/client.go:81	fetching X-Chain id
2022-07-18T11:00:52.322+0200	info	client/client.go:87	fetched X-Chain id	{"id": "pgk8Re3MCEbQu62orC1ebw7YKzpX1Yk4iS7vTxZReAm9Pjp6m"}
2022-07-18T11:00:52.322+0200	info	client/client.go:96	fetching CAM asset id	{"uri": "http://localhost:9650"}
2022-07-18T11:00:52.322+0200	info	client/client.go:105	fetched CAM asset id	{"id": "23MDJv6nhwCGnEer4GsEQWwDURk42ZQBoc444eosZ4BVgH87EW"}
2022-07-18T11:00:52.322+0200	info	client/client.go:107	fetching network information
2022-07-18T11:00:52.323+0200	info	client/client.go:116	fetched network information	{"networkId": 1001, "networkName": "columbus"}

Nj5C7NdpS3p8hZvu6b5HBREKi8hA1qbDD is already a validator on 11111111111111111111111111111111LpoYY
no primary network validators to add
```

### `subnet-cli add subnet-validator`

```bash
subnet-cli add subnet-validator \
--node-ids="[YOUR-NODE-ID]" \
--subnet-id="[YOUR-SUBNET-ID]"
```

To add a Subnet validator to the local network:

```text
> subnet-cli add subnet-validator \
--private-key-path=.insecure.ewoq.key \
--public-uri=http://127.0.0.1:12913 \
--node-ids="NodeID-P7oB2McjBGgW2NXXWVYjV8JEDFoW9xDE5" \
--subnet-id="24tZhrm8j8GCJRE9PomW8FaeqbgGS4UAQjJnqqn8pq5NwYSYV1"
```

And its console log:

```text
2022-05-20T16:10:22.980-0600	info	client/client.go:81	fetching X-Chain id
2022-05-20T16:10:22.981-0600	info	client/client.go:87	fetched X-Chain id	{"id": "qzfF3A11KzpcHkkqznEyQgupQrCNS6WV6fTUTwZpEKqhj1QE7"}
2022-05-20T16:10:22.981-0600	info	client/client.go:96	fetching AVAX asset id	{"uri": "http://127.0.0.1:12913"}
2022-05-20T16:10:22.981-0600	info	client/client.go:105	fetched AVAX asset id	{"id": "BUuypiq2wyuLMvyhzFXcPyxPMCgSp7eeDohhQRqTChoBjKziC"}
2022-05-20T16:10:22.981-0600	info	client/client.go:107	fetching network information
2022-05-20T16:10:22.982-0600	info	client/client.go:116	fetched network information	{"networkId": 1337, "networkName": "network-1337"}

Ready to add subnet validator, should we continue?
*-------------------------*----------------------------------------------------*
| PRIMARY P-CHAIN ADDRESS | P-custom18jma8ppw3nhx5r4ap8clazz0dps7rv5u9xde7p    |
*-------------------------*----------------------------------------------------*
| TOTAL P-CHAIN BALANCE   | 29,999,999.9000000 $AVAX                           |
*-------------------------*----------------------------------------------------*
| TX FEE                  | 0.001 $AVAX                                        |
*-------------------------*----------------------------------------------------*
| REQUIRED BALANCE        | 0.001 $AVAX                                        |
*-------------------------*----------------------------------------------------*
| URI                     | http://127.0.0.1:12913                             |
*-------------------------*----------------------------------------------------*
| NETWORK NAME            | network-1337                                       |
*-------------------------*----------------------------------------------------*
| NODE IDs                | [P7oB2McjBGgW2NXXWVYjV8JEDFoW9xDE5]                |
*-------------------------*----------------------------------------------------*
| SUBNET ID               | 24tZhrm8j8GCJRE9PomW8FaeqbgGS4UAQjJnqqn8pq5NwYSYV1 |
*-------------------------*----------------------------------------------------*
| VALIDATE WEIGHT         | 1,000                                              |
*-------------------------*----------------------------------------------------*
✔ Yes, let's create! I agree to pay the fee!



2022-05-20T16:10:28.853-0600	info	client/p.go:299	adding subnet validator	{"subnetId": "24tZhrm8j8GCJRE9PomW8FaeqbgGS4UAQjJnqqn8pq5NwYSYV1", "txFee": 1000000, "start": "2022-05-20T16:10:58.852-0600", "end": "2022-09-06T16:00:00.000-0600", "weight": 1000}
2022-05-20T16:10:28.857-0600	info	platformvm/checker.go:48	polling P-Chain tx	{"txId": "gmrRTRK6671pBVopxHoPRx77hcvEvc5UKER1fFNgaRiFPY5Qh", "expectedStatus": "Committed"}
2022-05-20T16:10:28.859-0600	info	poll/poll.go:42	start polling	{"internal": "1s"}
2022-05-20T16:10:29.861-0600	info	poll/poll.go:66	poll confirmed	{"took": "1.002120951s"}
added P7oB2McjBGgW2NXXWVYjV8JEDFoW9xDE5 to subnet 24tZhrm8j8GCJRE9PomW8FaeqbgGS4UAQjJnqqn8pq5NwYSYV1 validator set (took 1.002120951s)

waiting for validator P7oB2McjBGgW2NXXWVYjV8JEDFoW9xDE5 to start validating 24tZhrm8j8GCJRE9PomW8FaeqbgGS4UAQjJnqqn8pq5NwYSYV1...(could take a few minutes)
*-------------------------*----------------------------------------------------*
| PRIMARY P-CHAIN ADDRESS | P-custom18jma8ppw3nhx5r4ap8clazz0dps7rv5u9xde7p    |
*-------------------------*----------------------------------------------------*
| TOTAL P-CHAIN BALANCE   | 29,999,999.8990000 $AVAX                           |
*-------------------------*----------------------------------------------------*
| URI                     | http://127.0.0.1:12913                             |
*-------------------------*----------------------------------------------------*
| NETWORK NAME            | network-1337                                       |
*-------------------------*----------------------------------------------------*
| NODE IDs                | [P7oB2McjBGgW2NXXWVYjV8JEDFoW9xDE5]                |
*-------------------------*----------------------------------------------------*
| SUBNET ID               | 24tZhrm8j8GCJRE9PomW8FaeqbgGS4UAQjJnqqn8pq5NwYSYV1 |
*-------------------------*----------------------------------------------------*
| VALIDATE START          | 2022-05-20T16:10:58-06:00                          |
*-------------------------*----------------------------------------------------*
| VALIDATE END            | 2022-09-06T16:00:00-06:00                          |
*-------------------------*----------------------------------------------------*
| VALIDATE WEIGHT         | 1,000                                              |
*-------------------------*----------------------------------------------------*
```

### `subnet-cli create blockchain`

```bash
subnet-cli create blockchain \
--subnet-id="[YOUR-SUBNET-ID]" \
--chain-name="[YOUR-CHAIN-NAME]" \
--vm-id="[YOUR-VM-ID]" \
--vm-genesis-path="[YOUR-VM-GENESIS-PATH]"
```

To create a blockchain with the local cluster:

```bash
subnet-cli create blockchain \
--public-uri=http://127.0.0.1:9650 \
--subnet-id="2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx" \
--chain-name="TSnet" \
--vm-id="tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH" \
--vm-genesis-path=./timestampvm-genesis.json
```

```text
2022-07-18T11:23:05.153+0200	info	client/client.go:81	fetching X-Chain id
2022-07-18T11:23:05.158+0200	info	client/client.go:87	fetched X-Chain id	{"id": "pgk8Re3MCEbQu62orC1ebw7YKzpX1Yk4iS7vTxZReAm9Pjp6m"}
2022-07-18T11:23:05.158+0200	info	client/client.go:96	fetching CAM asset id	{"uri": "http://127.0.0.1:9650"}
2022-07-18T11:23:05.159+0200	info	client/client.go:105	fetched CAM asset id	{"id": "23MDJv6nhwCGnEer4GsEQWwDURk42ZQBoc444eosZ4BVgH87EW"}
2022-07-18T11:23:05.159+0200	info	client/client.go:107	fetching network information
2022-07-18T11:23:05.159+0200	info	client/client.go:116	fetched network information	{"networkId": 1001, "networkName": "columbus"}

Ready to create blockchain resources, should we continue?
*-------------------------*----------------------------------------------------*
| PRIMARY P-CHAIN ADDRESS | P-columbus17pysyr6av4n2gf6teqv3kjd5ewdkmncwrhq6qk  |
*-------------------------*----------------------------------------------------*
| TOTAL P-CHAIN BALANCE   | 2,499.8980000 $CAM                                 |
*-------------------------*----------------------------------------------------*
| TX FEE                  | 0.100 $CAM                                         |
*-------------------------*----------------------------------------------------*
| REQUIRED BALANCE        | 0.100 $CAM                                         |
*-------------------------*----------------------------------------------------*
| URI                     | http://127.0.0.1:9650                              |
*-------------------------*----------------------------------------------------*
| NETWORK NAME            | columbus                                           |
*-------------------------*----------------------------------------------------*
| SUBNET ID               | 2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx |
*-------------------------*----------------------------------------------------*
| CHAIN NAME              | TSnet                                              |
*-------------------------*----------------------------------------------------*
| VM ID                   | tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH  |
*-------------------------*----------------------------------------------------*
| VM GENESIS PATH         | ./timestampvm-genesis.json                         |
*-------------------------*----------------------------------------------------*
✔ Yes, let's create! I agree to pay the fee!



2022-07-18T11:23:07.183+0200	info	client/p.go:497	creating blockchain	{"subnetId": "2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx", "chainName": "TSnet", "vmId": "tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH", "createBlockchainTxFee": 100000000}
created blockchain "rcXq53fMgf9f34iWXvQcka2VDSegdL3Knz7wMTNG5mxRboqFF" (took 3.205701ms)

*-------------------------*----------------------------------------------------*
| PRIMARY P-CHAIN ADDRESS | P-columbus17pysyr6av4n2gf6teqv3kjd5ewdkmncwrhq6qk  |
*-------------------------*----------------------------------------------------*
| TOTAL P-CHAIN BALANCE   | 2,499.8980000 $CAM                                 |
*-------------------------*----------------------------------------------------*
| URI                     | http://127.0.0.1:9650                              |
*-------------------------*----------------------------------------------------*
| NETWORK NAME            | columbus                                           |
*-------------------------*----------------------------------------------------*
| SUBNET ID               | 2dwibTuU3YxvTe7Lc5X4PsmCeC5JiBr1PGJVpCm8T1nec7zUSx |
*-------------------------*----------------------------------------------------*
| CREATED BLOCKCHAIN ID   | rcXq53fMgf9f34iWXvQcka2VDSegdL3Knz7wMTNG5mxRboqFF  |
*-------------------------*----------------------------------------------------*
| CHAIN NAME              | TSnet                                              |
*-------------------------*----------------------------------------------------*
| VM ID                   | tGas3T58KzdjLHhBDMnH2TvrddhqTji5iZAMZ3RXs2NLpSnhH  |
*-------------------------*----------------------------------------------------*
| VM GENESIS PATH         | ./timestampvm-genesis.json                         |
*-------------------------*----------------------------------------------------*
```

### `subnet-cli status blockchain`

To check the status of the blockchain `rcXq53fMgf9f34iWXvQcka2VDSegdL3Knz7wMTNG5mxRboqFF` from a **private URI**:

```bash
subnet-cli status blockchain \
--private-uri=http://127.0.0.1:9650  \
--blockchain-id="rcXq53fMgf9f34iWXvQcka2VDSegdL3Knz7wMTNG5mxRboqFF" \
--check-bootstrapped

2022-07-18T11:28:22.347+0200	info	client/client.go:81	fetching X-Chain id
2022-07-18T11:28:22.351+0200	info	client/client.go:87	fetched X-Chain id	{"id": "pgk8Re3MCEbQu62orC1ebw7YKzpX1Yk4iS7vTxZReAm9Pjp6m"}
2022-07-18T11:28:22.351+0200	info	client/client.go:96	fetching CAM asset id	{"uri": "http://127.0.0.1:9650"}
2022-07-18T11:28:22.351+0200	info	client/client.go:105	fetched CAM asset id	{"id": "23MDJv6nhwCGnEer4GsEQWwDURk42ZQBoc444eosZ4BVgH87EW"}
2022-07-18T11:28:22.351+0200	info	client/client.go:107	fetching network information
2022-07-18T11:28:22.352+0200	info	client/client.go:116	fetched network information	{"networkId": 1001, "networkName": "columbus"}

Checking blockchain...
2022-07-18T11:28:22.352+0200	info	platformvm/checker.go:127	polling blockchain	{"blockchainId": "rcXq53fMgf9f34iWXvQcka2VDSegdL3Knz7wMTNG5mxRboqFF", "expectedBlockchainStatus": "Validating"}
2022-07-18T11:28:22.353+0200	info	platformvm/checker.go:48	polling P-Chain tx	{"txId": "rcXq53fMgf9f34iWXvQcka2VDSegdL3Knz7wMTNG5mxRboqFF", "expectedStatus": "Committed"}
2022-07-18T11:28:22.353+0200	info	poll/poll.go:42	start polling	{"internal": "1s"}
2022-07-18T11:28:22.354+0200	info	poll/poll.go:66	poll confirmed	{"took": "874.197µs"}
2022-07-18T11:28:22.354+0200	info	poll/poll.go:42	start polling	{"internal": "1s"}
2022-07-18T11:28:22.355+0200	info	poll/poll.go:66	poll confirmed	{"took": "1.309324ms"}
```
