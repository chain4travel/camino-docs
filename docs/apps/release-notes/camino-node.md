---
sidebar_position: 1
---

# Camino-Node Releases

:::info UP-TO-DATE INFORMATION

`camino-node` is under very rapid development, this page may be outdated.

For more up-to-date information please check [Github Release](https://github.com/chain4travel/camino-node/releases) page.

:::

## v0.4.1-rc2

[View on GitHub](https://github.com/chain4travel/camino-node/releases/tag/v0.4.1-rc2)

- Split genesis `platformAllocation` to only stake `maxStakingAmount`
- Add depositTx inputs for already bonded UTXOs

**Full Changelog**: https://github.com/chain4travel/camino-node/compare/v0.4.1-rc1...v0.4.1-rc2

---

## v0.4.1-rc1

[View on GitHub](https://github.com/chain4travel/camino-node/releases/tag/v0.4.1-rc1)

Based on avalanchego v1.9.4 (Banff)

#### PlatformVM:

- DepositBond mode instead stake/delegate (for camino networks)
- AddressStates for KYC / ConsortiumMembers
- Registration NodeID <-> Consortium member
- Multi-Sig addresses

#### X-Chain:

- Unchanged

#### C-Chain

- Fixed Base Fee
- KYC over predeployed admin Smart Contract
- Contract deploy restricted to KYC verified addresses

**Full Changelog**: https://github.com/chain4travel/camino-node/compare/v0.4.0-alpha2...v0.4.1-rc1

---

## v0.4.0-alpha2

[View on GitHub](https://github.com/chain4travel/camino-node/releases/tag/v0.4.0-alpha2)

**Full Changelog**: https://github.com/chain4travel/camino-node/compare/v0.4.0-alpha1...v0.4.0-alpha2

---

## v0.4.0-alpha1

[View on GitHub](https://github.com/chain4travel/camino-node/releases/tag/v0.4.0-alpha1)

#### What's Changed

- Disable ansible_lint / artifacts only on release
- Fix CI Tests
- Add .editorconfig

**Full Changelog**: https://github.com/chain4travel/camino-node/compare/v0.3.0-alpha1...v0.4.0-alpha1

---

## v0.3.0-alpha1

[View on GitHub](https://github.com/chain4travel/camino-node/releases/tag/v0.3.0-alpha1)

#### What's Changed

This release is based on latest avalanche-network runner and has only slight modifications to get camino-node instead avalanchego running.

**Full Changelog**: https://github.com/chain4travel/camino-node/compare/v0.2.1-rc2...v0.3.0-alpha1

---

## v0.2.1-rc2

[View on GitHub](https://github.com/chain4travel/camino-node/releases/tag/v0.2.1-rc2)

- Build with [CaminoEthVM](./caminoethvm.md#v012-rc2) v0.1.2-rc2

---

## v0.2.1-rc1

[View on GitHub](https://github.com/chain4travel/camino-node/releases/tag/v0.2.1-rc1)

- Based On [CaminoGo](./caminogo.md#v0_2_0) v0.2.0
- Build with [CaminoEthVM](./caminoethvm.md#v0_1_2-rc1) v0.1.2-rc1
