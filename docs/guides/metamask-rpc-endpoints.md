---
sidebar_position: 8
---

# MetaMask & RPC Endpoints

## MetaMask

To add Camino to your MetaMask wallet, use the following information, or alternatively, use ChainList.org to seamlessly integrate Camino into your wallet.

:::tip CAMINO IS ON CHAINLIST.ORG

Camino Network is on ChainList.org. You can automatically add Camino networks to MetaMask, please visit the links below:

- [**Camino Mainnet** on ChainList.org](https://chainlist.org/?search=camino&testnets=false)
- [**Columbus Testnet** on ChainList.org](https://chainlist.org/?search=columbus&testnets=true)

:::

### Manual Configurations

#### Camino Mainnet

|    Network Name: |             Camino (mainnet)              |
| ---------------: | :---------------------------------------: |
|         RPC URL: | `https://api.camino.network/ext/bc/C/rpc` |
|        Chain-ID: |                   `500`                   |
| Currency Symbol: |                   `CAM`                   |
|  Block Explorer: |          https://caminoscan.com           |

#### Columbus Testnet

|    Network Name: |               Columbus (testnet)               |
| ---------------: | :--------------------------------------------: |
|         RPC URL: | `https://columbus.camino.network/ext/bc/C/rpc` |
|        Chain-ID: |                     `501`                      |
| Currency Symbol: |                     `CAM`                      |
|  Block Explorer: |        https://columbus.caminoscan.com         |

### Add Network to MetaMask

- Click **Add network** from MetaMask.

<figure>
<center>
<img class="zoom" src="/img/query-kyc-state-c-chain/00-add-network-to-metamask.png"/>
</center>
<figcaption align="center"><b>Fig.1:</b> Click "Add network"</figcaption>
</figure>

- On the next screen, click **Add a network manually**

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/1-add-custom-network-to-mm.png"/>
<figcaption align="center"><b>Fig.2:</b> Click "Add a network manually"</figcaption>
</figure>

- **Fill in the text fields & click Save**. You can obtain this information from the [MetaMask RPC Endpoints](/guides/metamask-rpc-endpoints.md) page.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/2-enter-details-into-the-network.png"/>
<figcaption align="center"><b>Fig.3:</b> Fill out the text fields</figcaption>
</figure>

- Verify that the custom network has been added successfully.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/3-add-custom-network-success.png"/>
<figcaption align="center"><b>Fig.4:</b> Verify success</figcaption>
</figure>

### Add Your Account to MetaMask

To retrieve your C-Chain private key from the Camino Wallet and add it to MetaMask, follow these steps:

1. In the Camino Wallet, navigate to the "Manage Keys" page.
1. Locate the "View Static Key" link and click on it to retrieve your private key.

:::tip

If you are using this private key to add your account to a wallet that
requires the "0x" notation, simply add "0x" at the beginning of the key.

:::

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/mm-account-0-get-pk.png#center"/>
<figcaption align="center"><b>Fig.6:</b> Get Private Key</figcaption>
</figure>

Open MetaMask and click on "Import Account" from the My Accounts menu.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/mm-account-1-import.png#center"/>
<figcaption align="center"><b>Fig.6:</b> Click Import Account</figcaption>
</figure>

Select "Private Key" as the import type. Paste your private key into the provided field.
Click "Import" to proceed.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/mm-account-2-pk.png#center"/>
<figcaption align="center"><b>Fig.7:</b> Enter Private Key and click Import</figcaption>
</figure>

Your account will now be successfully added to MetaMask.

<figure>
<img class="zoom" src="/img/query-kyc-state-c-chain/mm-account-3-done.png#center"/>
<figcaption align="center"><b>Fig.8:</b> Account Imported</figcaption>
</figure>

:::caution YOU NEED FUNDS ON C-CHAIN FOR METAMASK

Please note that **in order to view your funds on MetaMask**, it is necessary to transfer them to the C-Chain on the Camino Wallet.
For instructions on executing a cross-chain transfer, please refer to the [**Cross Chain Transfer**](/guides/cross-chain-transfer) page for detailed guidance.

:::

## Public API Endpoints

Below is the information regarding Camino Network's Public API Endpoints.

### Camino-Node RPC APIs

|         API Name |               URL                |
| ---------------: | :------------------------------: |
|   Camino Mainnet |   https://api.camino.network/    |
| Columbus Testnet | https://columbus.camino.network/ |

:::note MORE ON CAMINO APIs

For more information please visit [Camino-Node APIs page](/developer/apis/camino-node-apis/)

:::

### Magellan Explorer APIs

|         API Name |                     URL                     |
| ---------------: | :-----------------------------------------: |
|   Camino Mainnet |     https://magellan.camino.network/v2      |
| Columbus Testnet | https://magellan.columbus.camino.network/v2 |

:::note MORE ON MAGELLAN API

For more information about Magellan APIs please visit [Magellan API page](/developer/apis/magellan)

:::

:::info Getting More Help

If you require further assistance, don't hesitate to contact us on our [**Discord server**](https://discord.gg/camino).
We are always happy to help.

:::
