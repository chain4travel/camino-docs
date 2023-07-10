---
sidebar_position: 4
title: How to Log in to Wallet
description: This documentation explains how to log in to your wallet using different methods.
---

# How to log in to your wallet?

There are multiple ways to access your Camino Wallet account. Click on the title of each
option to access detailed information.

1. **[Mnemonic Key Phrase](#log-in-using-mnemonic-key-phrase):** When you first create your wallet, you are given a key phrase.
   To log in using your key phrase, navigate to the Camino Suite, click on the "Access Wallet"
   button, and enter your key phrase.

1. **[Saved Wallet](#log-in-using-saved-wallet):** If you've previously saved your wallet to your browser's local storage,
   you can log in by clicking on the wallet name on the Camino Wallet login page and entering
   the saved password.

1. **[Private Key](#log-in-with-a-private-key):** If you possess the private key associated with your wallet, you can use
   it to log in. On the Camino Wallet login page, click the "Private Key" button and enter
   your private key.

1. **[Keystore File](#log-in-with-keystore-file):** If you have previously saved your wallet to a keystore file, you can
   log in by clicking on the Keystore File in the login page of the Camino Wallet interface and
   providing the file and entering your saved password.

:::info Coming Soon: Ledger Support!

We are currently developing a new feature that will allow you to use your Ledger hardware wallet
device to log in to your Camino Wallet. This will provide an additional layer of security for
your wallet. We will announce the availability of this feature as soon as it is ready.

:::

:::caution HAVE YOUR KEY PHRASE

Note that regardless of which login method you choose, you will need to have your key phrase
available in case you ever need to recover your wallet.

:::

## Log in Using Mnemonic Key Phrase

To login to your Camino Wallet using the mnemonic key phrase, first, click on the "Login" button
located in the top right corner. This will bring you to the login page.

<figure>
<img class="zoom" src="/img/login-wallet/0-login-page.png"/>
<figcaption align = "center"><b>Fig.1:</b> Wallet Login Page</figcaption>
</figure>

Click on the "Mnemonic Key Phrase" button, and a dialog will appear with 24 input fields to enter
your key phrase words.

You can manually enter each word into the corresponding field, or you can copy and paste them all
into the first field, and the wallet will distribute them to all fields automatically. Please note
that for this feature to work, the words must be in a single line with a single space separating them.

<figure>
<img class="zoom" src="/img/login-wallet/mnemonic-0-filled-hidden.png"/>
<figcaption align = "center"><b>Fig.2:</b> Mnemonic Key Phrase Filled</figcaption>
</figure>

### Invalid Mnemonic Key Phrases

If you have written a word incorrectly while entering your mnemonic key phrase, the wallet will indicate which word has the error. This will allow you to correct the mistake and continue with the login process.

<figure>
<img class="zoom" src="/img/login-wallet/mnemonic-1-word-error.png"/>
<figcaption align = "center"><b>Fig.3:</b> Mnemonic Key Phrase Filled with Error</figcaption>
</figure>

Or if you replaced one word from the list with another _acceptable_ one, the wallet will display a
warning that the key phrase is invalid.

<figure>
<img class="zoom" src="/img/login-wallet/mnemonic-3-replaced-word.png"/>
<figcaption align = "center"><b>Fig.4:</b> Mnemonic Key Phrase Filled with Error</figcaption>
</figure>

:::danger Invalid Mnemonic Phrases

Please note that the feature of displaying an error message for incorrect words in the mnemonic
key phrase only works for misspelled or entirely wrong words. The key phrase consists of a list
of specific words that correspond to bits, and the wallet will only detect an error if any of
the words entered do not match the list.

Therefore, if you have replaced a word in the key phrase with another acceptable word from the
list, the wallet will not be able to identify the incorrect word and will simply display a message
that the mnemonic phrase is invalid. In this case, the last 8 bits of the key phrase are utilized
as the checksum for the phrase.

:::

## Log in Using Saved Wallet

If you've previously [saved your wallet](/guides/how-to-save-your-wallet) to your browser's local storage,
you can log in by clicking on the wallet name on the Camino Wallet login page and entering
the saved password.

<figure>
<img class="zoom" src="/img/login-wallet/saved-1-password.png"/>
<figcaption align = "center"><b>Fig.5:</b> Password Entry Dialog for Saved Wallet Login</figcaption>
</figure>

## Log in with a Private Key

If you have the private key associated with your wallet, you can use
it to log in. On the Camino Wallet login page, click the "Private Key" button and enter
your private key.

<figure>
<img class="zoom" src="/img/login-wallet/pk-0-password-filled.png#center"/>
<figcaption align = "center"><b>Fig.6:</b> Private Key Entry Dialog</figcaption>
</figure>

### How to retrieve your private key?

You can view your private key by accessing the "My Keys" section on the "Manage Keys" page.

<figure>
<img class="zoom" src="/img/login-wallet/my-keys-0.png#center"/>
<figcaption align = "center"><b>Fig.7:</b> View Static Keys</figcaption>
</figure>

<figure>
<img class="zoom" src="/img/login-wallet/my-keys-private-key-dialog.png#center"/>
<figcaption align = "center"><b>Fig.8:</b> View Keys Dialog</figcaption>
</figure>

## Log in with Keystore File

If you have previously saved your wallet to a keystore file, you can log in
by clicking on the Keystore File in the login page of the Camino Wallet interface and
providing the file and entering your saved password.

<figure>
<img class="zoom" src="/img/login-wallet/keystore-0-select-file.png#center"/>
<figcaption align = "center"><b>Fig.9:</b> Select Keystore File</figcaption>
</figure>

<figure>
<img class="zoom" src="/img/login-wallet/keystore-1-file-selected-password-filled.png#center"/>
<figcaption align = "center"><b>Fig.10:</b> Keystore File Selected & Passwored Entered</figcaption>
</figure>

For more information about how to save your wallet into a keystore file, please refer
to [this document](/guides/how-to-save-your-wallet#saving-your-wallet-to-a-keystore-file).
