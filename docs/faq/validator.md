---
sidebar_position: 1
description: Frequently asked questions about validation on the camino and columbus networks.
---

# Validator FAQ

### Who can be a Camino validator?

Any participant in the travel industry who meets the following criteria can become a validator on the Camino Mainnet:

- Holds a minimum of 100,000 Camino (CAM) tokens in their wallet.
- Has undergone and passed a Know-Your-Customer (KYC) and Know-Your-Business (KYB) verification process.
- Has been elected as a validator by the validator consortium through a voting process.

:::note

It is important to note that the final requirement does not apply to validators who will secure the network from its inception. These initial validators, who are in the genesis of the blockchain, are already designated as such and do not need to go through a voting process. However, they are still subject to later proposals, such as being removed from the consortium.

:::

### What are staking parameters for validators on Camino Network?

- The exact amount that a validator must stake is **100,000 CAM**.
- The time period one can stake funds for a validator is between **2 weeks** (min) and **1 year** (max).

:::note

When a validator completes its role in validating the Camino Mainnet, they will receive their staked Camino tokens back.

:::

### Can I add more Camino (CAM) tokens to my validator while the staking period is in progress?

No. The exact amount that must be staked to run a validator is 100,000 CAM.
You can, however, lock (deposit) additional CAM in your wallet that is used to configure your validator node. Your validator rewards will not increase by doing so. Instead, the additional Camino tokens will be subject to the respective reward percentage for locked tokens.

### Can I use my locked (deposited) Camino (CAM) tokens to run a validator node?

Yes, you will be able to stake locked (deposited) Camino (CAM) tokens in order to create a validator node.

### Can I run more than one validator node?

No. On Camino, validators secure the network and democratically govern the Camino ecosystem. Therefore, it is not possible to run more than one validator as this would jeopardize the democratic voting process.

### Do I need to keep my private keys on my validator?

No, you don’t need to keep your private keys on your validator (and we strongly advise you not to).

### Is my validating node uptime important?

Yes. A validator will receive a staking reward if they are online and respond for more than 80% of their validation period. You should aim for your validator to be online and responsive 100% of the time.

### Why does my validator's uptime percentage start from a lower value and then gradually increase to 100%?

When a new validator is added to the network, it takes some time for the API node to discover and connect to
it. The uptime percentage displayed in the explorer is based on the API node's view of the network, not on
the validator itself. As a result, during the initial period, your validator appears to be offline to the API
node, which causes the uptime percentage to start from a lower value.

However, this is not a significant issue since other validators are also tracking the uptime of their peers.
Each node in the network monitors the uptime of other nodes, so even if the API node initially reports a lower
uptime percentage, your validator's node will show a 100% uptime if it was healthy and online when it was added
to the network.

### Can I stop my validator and stop staking at any time?

No, your stake is locked for the pre-defined staking period. Your stake is automatically returned to your address upon completion.

### Any further question not answered here?

If you have any further questions, or need help, feel free to contact us on our [Discord](https://discord.gg/camino) server.
