---
sidebar_position: 6
title: Create & Edit Multisig Wallets
description: This guide walks you through creating and editing multisig wallets.
---

# Create & Edit Multisig Wallets

A multisig wallet comprises an alias, member addresses, and a threshold. A multisig alias
functions similarly to a regular Camino Wallet address, but it lacks a private key.
Therefore, signing transactions for this address necessitates signatures from its member
addresses. The required number of signatures is determined by the wallet's threshold.
Funds within the wallet can only be accessed when the requisite number of member addresses
provides their signatures.

Let's walk through the process of creating and editing a multisig wallet.

:::info MORE INFORMATION

For further details on multisig wallets, please refer to the [Multisig Wallets & Aliases](/guides/multisig-wallets/) page.

:::

## Creating a Multisig Alias

### 1. Login with a Member Wallet

Log in to the Camino Wallet using one of the member accounts you intend to include in the multisig wallet.

<figure>
<img class="zoom" src="/img/msig-create/01-msig-create-login.png#center"/>
<figcaption align = "center"><b>Fig.1:</b> Click on the top right menu</figcaption>
</figure>

### 2. Navigate to Settings

- On the top right, find and select the "Settings" option.

<figure>
<img class="zoom" src="/img/msig-create/02-msig-create-settings-menu.png#center"/>
<figcaption align = "center"><b>Fig.2:</b> Select "Settings"</figcaption>
</figure>

### 3. Access the Multisignature Wallet Tab

- Within "Settings", find and click on the "Multisignature Wallet" tab.

<figure>
<img class="zoom" src="/img/msig-create/03-msig-create-settings-page.png#center"/>
<figcaption align = "center"><b>Fig.3:</b> Switch to "Multisignature Wallet" tab</figcaption>
</figure>

### 4. Understand the Input Fields

- **Multisignature Name**: This names your multisig wallet and gets recorded on the blockchain. Ensure it doesn't contain any private or sensitive information.
- **Multisignature Co-owners**: Lists members of the multisig wallet. The initial member is the account you've logged in with. Add more members by clicking the green '+' icon. Note: names in this section are stored in your browser's local cache and aren't blockchain entries.
- **Multisignature Threshold**: Dictates the minimum number of signatures needed for transaction approval. Choose any number between 1 and the total count of members.

<figure>
<img class="zoom" src="/img/msig-create/04-msig-create-settings-create-msig.png#center"/>
<figcaption align = "center"><b>Fig.4:</b> Understand the Input Fields</figcaption>
</figure>

### 5. Complete the Form

- Type in a chosen name for the multisig wallet.
- Add member addresses, ensuring you're using P-Chain addresses for multisig wallets.
- Define your desired threshold (e.g., set to 2 for this example).
- Once all details are filled in, click the "Create Multisignature Wallet" button.

:::tip Ensure Funds on P-Chain!

Remember, multisig operations are conducted as P-Chain transactions. Ensure you have sufficient CAM tokens
in your P-Chain balance to cover transaction costs.

:::

<figure>
<img class="zoom" src="/img/msig-create/05-msig-create-settings-filled.png#center"/>
<figcaption align = "center"><b>Fig.5:</b> Complete the Form</figcaption>
</figure>

### 6. Activate the Multisig Wallet

- After creation, locate and click on "Switch Wallet" in the top-right corner.

<figure>
<img class="zoom" src="/img/msig-create/06-msig-create-settings-created.png#center"/>
<figcaption align = "center"><b>Fig.6:</b> Click "Switch Wallet" button</figcaption>
</figure>

- Next, hit the small arrow button to activate your new multisig wallet.

<figure>
<img class="zoom" src="/img/msig-create/07-msig-create-settings-switcher.png#center"/>
<figcaption align = "center"><b>Fig.7:</b> Click the activate button</figcaption>
</figure>

- On the dashboard, the "Active Key" section should now reflect the name of your multisig wallet.

<figure>
<img class="zoom" src="/img/msig-create/08.0-msig-create-settings-switched.png#center"/>
<figcaption align = "center"><b>Fig.8:</b> Now, active wallet is the new multisig</figcaption>
</figure>

- Optionally, review your active wallet within the "Manage Keys" section of Camino Wallet.

:::tip SPOT THE ADDRESS

The Camino Wallet exclusively displays the P-Chain address for multisig wallets. Currently, the multisig
functionality is limited to the **P-Chain**, though there are plans to extend this feature to other
chains in the future.

:::

<figure>
<img class="zoom" src="/img/msig-create/08.1-msig-create-settings-managekeys.png#center"/>
<figcaption align = "center"><b>Fig.9:</b> Review from "Manage Keys" tab</figcaption>
</figure>

## Editing Multisig Wallet

### 1. Open the Multisignature Wallet Settings

- Navigate back to the "Settings" section from the top right.
- Within "Settings", click on the "Multisignature Wallet" tab.
- Locate and select the "Edit Multisignature Wallet" button to initiate edits.

<figure>
<img class="zoom" src="/img/msig-create/09-msig-create-settings-edit-msig.png#center"/>
<figcaption align = "center"><b>Fig.10:</b> Click the "Edit Multisignature Wallet" button</figcaption>
</figure>

### 2. Modify the Details

- Adjust the required fields. For instance, you might change the threshold from 2 to 1.
- Make any other desired changes, ensuring all modifications are accurately filled.
- After making your edits, click on the "Save Multisignature Wallet" button to update the wallet settings.

<figure>
<img class="zoom" src="/img/msig-create/11-msig-create-settings-treshold-1.png#center"/>
<figcaption align = "center"><b>Fig.11:</b> Make the modifications and click "Save Multisignature Wallet"</figcaption>
</figure>

### 3. Ensure Your Multisig Wallet Has Sufficient Funds

- If an error message indicating insufficient funds appears (which it will if you did follow this guide and
  haven't transferred any funds to your multisig wallet in between), you'll need to transfer some CAM to your
  multisig wallet to cover the transaction fees.
- To do this, copy your multisig wallet's P-Chain address. (See "SPOT THE ADDRESS" tip above)
- Navigate to your primary (or single sig) wallet, initiate a fund transfer to the copied multisig address,
  and confirm the transaction.

<figure>
<img class="zoom" src="/img/msig-create/12-msig-create-settings-no-funds.png#center"/>
<figcaption align = "center"><b>Fig.12:</b> Ensure your multisig has funds</figcaption>
</figure>

### 4. Apply the Changes

- After ensuring your multisig wallet has sufficient funds, return to the "Multisignature Wallet" settings.
- Try saving the wallet again. A success message should display in green, indicating the updates have been saved.
- The button will update to display "Signed 1 out of 2 required signatures". Next, log in with the other member's
  account to sign the edit operation, enabling the transaction's execution.

<figure>
<img class="zoom" src="/img/msig-create/13-msig-create-settings-save-signed.png#center"/>
<figcaption align = "center"><b>Fig.13:</b> Sign the transaction</figcaption>
</figure>

### 5. Sign in with Another Member Account

- In a separate browser tab, sign in with the credentials of the next member account required to co-sign the transaction.
- Proceed to the "Multisignature Wallet" tab under "Settings".
- Review the modifications and, if they meet your approval, confirm the changes made earlier.

<figure>
<img class="zoom" src="/img/msig-create/14-msig-create-settings-2nd-sign.png#center"/>
<figcaption align = "center"><b>Fig.14:</b> Sign with the other member</figcaption>
</figure>

### 6. Finalize the Transaction

- After all required member accounts have approved the changes, execute the transaction.

<figure>
<img class="zoom" src="/img/msig-create/15-msig-create-settings-all-signed.png#center"/>
<figcaption align = "center"><b>Fig.15:</b> Execute the transaction</figcaption>
</figure>

### 7. Confirm the Transaction

- A confirmation message should appear, validating the success of the transaction.

<figure>
<img class="zoom" src="/img/msig-create/16-msig-create-settings-executed.png#center"/>
<figcaption align = "center"><b>Fig.16:</b> Transaction is executed and modifications saved to the blockchain</figcaption>
</figure>

### 8. Verify with the Initial Member

- Optionally, you can log back in with the first member account to verify the edits.
- Navigate to the "Multisignature Wallet" tab and ensure the displayed settings match the recent changes, like the updated threshold value.

<figure>
<img class="zoom" src="/img/msig-create/17-msig-create-settings-final-state.png#center"/>
<figcaption align = "center"><b>Fig.17:</b> Check with the first member wallet</figcaption>
</figure>
