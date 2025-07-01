---
sidebar_position: 1
---

# CaminoGo Releases

:::info

Development has been transitioned from the `camino-node` repository to the
`caminogo` repository as of the `v1.1.0` release. For older versions, refer to the
[`camino-node` page](./camino-node.md).

:::

## v1.2.0-rc6

:::warning ONLY ON COLUMBUS TESTNET

This is a pre-release for Columbus testnet. It **SHOULD NOT** be used for **Camino mainnet**.

:::

<p><span class="alert alert--info pill">Cairo Phase</span></p>
<p><span class="alert alert--warning pill">Pre-Release</span></p>
<p><span class="alert alert--secondary pill">Current Testnet (Columbus) Version</span></p>

[View on Github](https://github.com/chain4travel/caminogo/releases/tag/v1.2.0-rc6)

- Implementation of Cairo phase
- Cairo Timestamp for Columbus is 2025-07-16 at 11:00 UTC
- Fix DAC general proposals
- Introduce new system transaction `UnlockExpiredDepositsTx` that will handle unlock of expired deposits after Cairo.
- Fix `UnlockDepositTx` active deposits partial unlocking.

## v1.1.0

<p><span class="alert alert--info pill">Berlin Phase</span></p>
<p><span class="alert alert--secondary pill">Current Mainnet (Camino) Version</span></p>

[View on GitHub](https://github.com/chain4travel/caminogo/releases/tag/v1.1.0)

- Implementation of Berlin phase
- Berlin Timestamp for Camino is 18.12.2024 at 10:00 UTC
- Berlin Timestamp for Columbus is 28.11.2024 at 10:00 UTC
- New DAC voting system
- Enhanced address states with more granular roles
- KYB verified address state introduction
- Multisig alias improvements
