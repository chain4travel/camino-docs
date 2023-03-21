---
sidebar_position: 5
---

# MetaMask & RPC Endpoints

:::caution Work In Progress

This document is still a **work-in-progress**. It is advisable to check back later for updates and revisions.
If you need help, please feel free to contact us on our [**Discord server**](https://discord.gg/camino) for assistance.

:::

## MetaMask

To add Camino to your MetaMask wallet, use the following information, or alternatively, use ChainList.org to seamlessly integrate Camino into your wallet.

:::tip CAMINO IS ON CHAINLIST.ORG

Camino Network is on ChainList.org. You can automatically add Camino networks to MetaMask, please visit the links below:

- [**Camino Mainnet** on ChainList.org](https://chainlist.org/?search=camino&testnets=false)
- [**Columbus Testnet** on ChainList.org](https://chainlist.org/?search=columbus&testnets=true)

:::

### Manual Configurations

#### Camino Mainnet

|    Network Name: |                Camino (mainnet)                |
| ---------------: | :--------------------------------------------: |
|         RPC URL: | https://mainnet.camino.foundation/ext/bc/C/rpc |
|        Chain-ID: |                     `500`                      |
| Currency Symbol: |                     `CAM`                      |
|  Block Explorer: |    https://explorer.camino.network/mainnet     |

#### Columbus Testnet

|    Network Name: |                Columbus (testnet)                |
| ---------------: | :----------------------------------------------: |
|         RPC URL: |   https://columbus.camino.network/ext/bc/C/rpc   |
|        Chain-ID: |                      `501`                       |
| Currency Symbol: |                      `CAM`                       |
|  Block Explorer: | https://explorer.columbus.camino.network/c-chain |

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


## Public API Endpoints

Below is the information regarding Camino Network's Public API Endpoints.

### Camino-Node RPC APIs

|         API Name |                URL                 |
| ---------------: | :--------------------------------: |
|   Camino Mainnet | https://mainnet.camino.foundation/ |
| Columbus Testnet |  https://columbus.camino.network/  |

:::note MORE ON CAMINO APIs

For more information please visit [Camino-Node APIs page](/developer/apis/camino-node-apis/)

:::

### Magellan Explorer APIs

|         API Name |                     URL                     |
| ---------------: | :-----------------------------------------: |
| Columbus Testnet | https://magellan.columbus.camino.network/v2 |

:::note MORE ON MAGELLAN API

For more information about Magellan APIs please visit [Magellan API page](/developer/apis/magellan)

:::

