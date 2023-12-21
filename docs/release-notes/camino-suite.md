---
sidebar_position: 5
---

# Camino Application Suite Releases

## v1.3.0

<p>
  <span class="alert alert--success pill">Latest</span> 
</p>

### Deposit Offers

We are pleased to announce the release of Camino Application Suite version 1.3.0 "Deposit Offers", featuring significant enhancements, updates, and bug fixes that improve overall functionality and user experience.

- **Major Update: Deposit Offers**

  - **New Top-Level Navigation "Foundation"**: Introducing a dedicated navigation area for deposit offer administrators to streamline management 🧭.
  - **Address-Specific Deposit Offer Creation**: Selected addresses now have the capability to create deposit offers, enhancing security and administration 🔑.
  - **Creating Deposit Offers**: Admins are equipped with new functionalities to create deposit offers, increasing flexibility in deposit management.
  - **Saving Pools on Testnet**: Test the new saving pool feature in the Earn section of the wallet and start accruing rewards on the testnet 🏦.

- **Minor Updates:**

  - **New Font Across All Frontends**: The rollout of a new font across all interfaces aims to improve readability and visual comfort.
  - **Updated Wallet Transactions Footer Text**: Refinements in the wallet transactions footer text for clearer communication.
  - **Improved Navbar**: The navigation bar has been updated for better display of wallet and account information.
  - **Multisig Owners' Names**: Ensuring multisig owners' names are now reliably stored within the wallet.

- **Bugfixes:**
  - **Saving Pool Visibility Post-Network Switch**: Addressed the issue where the saving pool would only show up following a network change.
  - **Correct P Balance Display**: Fixed a bug that caused incorrect P balance displays during token interactions.
  - **Validator Page Uptime Accuracy**: Corrected the validator page uptime display from an erroneous 10000% to the actual 100%.
  - **Validator Tab Auto-Refresh**: The validator tab will now refresh automatically after switching networks or multisig arrangements 🔄.
  - **Deposit Offer Creation Fixes**: Implemented multiple fixes to refine the deposit offer creation process.

Your feedback is always welcome, and we are dedicated to the ongoing improvement of the Camino Application Suite.

## v1.2.1

<p>
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
