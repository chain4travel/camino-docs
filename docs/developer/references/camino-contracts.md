---
sidebar_position: 7
---

# Camino Smart Contracts

Camino Network has multiple smart contracts to manage administrative tasks, KYC verification, gas fee voting, and dApp incentives.

Below, You can find information about these contracts and their addresses.

## `CaminoAdmin`

Smart contract for administrative tasks like setting roles (ex: kyc, gas fee, blacklist).

This contract is [Upgreadable Proxy](https://ethereum.org/en/developers/docs/smart-contracts/upgrading/) backed and the implementation can be upgraded by an address with `ADMIN_ROLE`.

|    Address     | `0x010000000000000000000000000000000000000a` |
| :------------: | :------------------------------------------: |
| Implementation | `0x010000000000000000000000000000000000000b` |

Source: [admin.sol](https://github.com/chain4travel/caminoethvm/blob/chain4travel/contracts/admin.sol)

## `CaminoIncentives`

Smart contract for Camino dApp Incentive Pool. This contract is a placeholder for future development.

This contract is [Upgreadable Proxy](https://ethereum.org/en/developers/docs/smart-contracts/upgrading/) backed and the implementation can be upgraded by an address with `ADMIN_ROLE`.

|    Address     | `0x010000000000000000000000000000000000000c` |
| :------------: | :------------------------------------------: |
| Implementation | `0x010000000000000000000000000000000000000d` |

Source: [incentives.sol](https://github.com/chain4travel/caminoethvm/blob/chain4travel/contracts/incentives.sol)
