---
sidebar_position: 5
---

# Camino Application Suite Release Notes

## v1.2.1

<p>
  <span class="alert alert--success pill">Latest</span> 
  <span class="alert alert--info pill">Bugfix</span>
</p>

### User Experience and Interface Enhancements

Introducing Camino Application Suite `v1.2.1`, focusing on refining your experience.

**🛠️ Highlights:**

- **Improved Interactivity**: Enhanced drawer behavior and fixed HTML structure issues.
- **URL Clarity**: Multisig management path updated to `/manage-multisig`. [Details](https://github.com/chain4travel/camino-suite/pull/168)
- **Enhanced Security**: Restricted `fetchMultiSigAliases` function to logged-in users.
- **Interface Updates**:
  - "Network" now clearly displayed in settings.
  - Revamped wallet icons for better clarity.
  - Adjusted multi-sig wallet address displays.
- **Performance & Bug Fixes**:
  - Optimized `fetchMultiSigAliases` calls.
  - Fixed display in mint collectibles section.
  - Resolved Caminojs collectible creation issue. [Details](https://github.com/chain4travel/camino-wallet/pull/329)
- **Fresh MultiSig Management**: Data refreshes with every page access.

Stay updated with Camino Suite for a smoother experience, and as always, your feedback drives our improvements!

## v1.2.0

### Multisignature Alias Create & Edit

We're thrilled to introduce a significant new feature in the latest version of the Camino Application Suite

**Introducing Multisignature Alias Create & Edit Functionality in Settings**:

- Dive into our **Settings** page and discover the all-new capability to **create and edit multisignature aliases**. This enhancement is designed to provide users with a more seamless and intuitive way to manage their multisignature wallets.
  - Expose a dedicated component to create multisig aliases. [Details](https://github.com/chain4travel/camino-suite/pull/146)
  - Seamlessly create multisig aliases, enabling a smooth user experience. [Details](https://github.com/chain4travel/camino-suite/pull/149)

:::info MORE INFORMATION

For further details about creating & editing multisig wallets, please refer to the documentation page [Create & Edit Multisig Wallet](/guides/multisig-wallets/create-multisig/) page.

:::

---

**Other Notable Updates**:

- Beta tag now accompanies the KYB button for clearer distinction. [Details](https://github.com/chain4travel/camino-suite/pull/139)
- Refreshed look for the settings area for better user experience. [Details](https://github.com/chain4travel/camino-suite/pull/141)
- Version tag visibility is enhanced for users. [Details](https://github.com/chain4travel/camino-suite/pull/142)
- Fixed the active tab switching during route changes for smooth navigation. [Details](https://github.com/chain4travel/camino-suite/pull/148)
- Multisig now promptly updates on network changes. [Details](https://github.com/chain4travel/camino-suite/pull/147)
- Many minor bug fixes!

For an in-depth look at all the changes between v1.1.0 and v1.2.0, visit our [Full Changelog](https://github.com/chain4travel/camino-suite/compare/v1.1.0...v1.2.0).

Thank you for being a part of the journey. We're excited for you to explore the new multisignature alias feature!
