---
sidebar_position: 7
---

# Camino Smart Contracts

The Camino Network utilizes smart contracts to handle various administrative tasks, such as KYC verification, gas fee voting, and dApp incentives. Below, you can find information on these contracts and their corresponding addresses.

## `CaminoAdmin`

This smart contract is responsible for administrative tasks, including setting roles (e.g. KYC, gas fee, blacklist). It is an [Upgradable Proxy](https://ethereum.org/en/developers/docs/smart-contracts/upgrading/) contract, meaning that the implementation can be upgraded by an address with the `ADMIN_ROLE`.

|    Address     | `0x010000000000000000000000000000000000000a` |
| :------------: | :------------------------------------------: |
| Implementation | `0x010000000000000000000000000000000000000b` |

Source: [admin.sol](https://github.com/chain4travel/caminoethvm/blob/chain4travel/contracts/admin.sol)

## `CaminoIncentives`

This smart contract is responsible for the Camino dApp Incentive Pool. It is currently a placeholder for future development. Like the `CaminoAdmin` contract, it is also an [Upgradable Proxy](https://ethereum.org/en/developers/docs/smart-contracts/upgrading/) contract and can be upgraded by an address with the `ADMIN_ROLE`.

|    Address     | `0x010000000000000000000000000000000000000c` |
| :------------: | :------------------------------------------: |
| Implementation | `0x010000000000000000000000000000000000000d` |

Source: [incentives.sol](https://github.com/chain4travel/caminoethvm/blob/chain4travel/contracts/incentives.sol)
