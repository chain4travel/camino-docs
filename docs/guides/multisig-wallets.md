---
sidebar_position: 5
title: Multi-Sig Wallets & Aliases
description: What is a Multi-Sig Wallet and Multi-Sig Alias?
---

# What is a Multi-Sig Wallet?

A multisig wallet, also known as a multi-signature wallet, is a type of digital wallet
that requires multiple signatures from different parties to authorize a transaction.
In other words, it requires (most of the time) more than one person to sign off on a
transaction before it can be executed.

In the Camino Network, a multisig wallet is particularly useful for security and risk management.
By requiring multiple parties to authorize a transaction, it reduces the risk of a single point
of failure or a single party making unauthorized transactions.

For example, let's say a group of individuals want to pool their funds together in a single
wallet for a joint investment. Instead of giving control of the wallet to just one person,
they can create a multisig wallet where a certain number of signatories (e.g. 2 out of 3, 3 out of 5, etc.)
must approve any transaction before it can be executed.

In summary, a multisig wallet is a secure way to manage cryptocurrency funds that requires
multiple parties to authorize transactions. It is particularly useful in the Camino Network
for risk management and increased security.

## What is a Multi-Sig Alias?

In the Camino Network, a multisig alias, also known as a control group, is a way of grouping
together multiple addresses into a single identifier for the purpose of managing a multisig wallet.
An alias is a public key that the addresses are derived from and has no private keys. It represents
the control group that collectively manages the multisig wallet.

When a multisig wallet is created, a unique address is derived from the public keys of the signatories.
This address can be quite long and complex, making it difficult to manage and share with others.
By creating a multisig alias, the wallet address can be replaced with a shorter and more user-friendly
identifier (a regular wallet address), simplifying the process of sharing and using the wallet.

Members of the control group are authorized to sign transactions for the multisig alias without needing
approval from others. However, to execute a transaction, the signature threshold must be met.

Multisig aliases are particularly useful in situations where there are multiple parties involved in the
management of a wallet, such as in a joint venture or a team project. By grouping together the signatories
into a single alias, it simplifies the process of authorizing transactions and reduces the risk of
unauthorized access or fraud.

In summary, a multisig alias is an address that represents a control group of signatories that manage a
multisig wallet. The alias has no private keys and can be used to simplify the management of the wallet,
allowing members of the group to sign transactions for the alias without requiring approval from anyone else.

## What is Threshold in Multi-Sig Wallets?

In a multisig wallet, threshold refers to the minimum number of signatories required to authorize a
transaction. When creating a multisig wallet, the threshold is set as a parameter, along with the list
of public keys (addresses) of the signatories.

For example, if a multisig wallet has a threshold of 2 and a control group of 3 signatories, any transaction
from the wallet would require at least 2 of the 3 signatories to sign off on it. If the threshold were
increased to 3, then all 3 signatories would be required to sign off on any transaction.

The threshold parameter provides an added layer of security and control over the funds held in a multisig wallet.
By requiring a minimum number of signatories to authorize a transaction, it reduces the risk of unauthorized
access or fraud, as it becomes more difficult for a single signatory to execute a transaction without approval
from the rest of the group.

On the other hand, setting the threshold too high can also create inconvenience or delays in executing transactions.
Therefore, it's important to find a balance between security and ease of use when determining the appropriate
threshold for a multisig wallet.

In summary, threshold in the context of multisig wallets refers to the minimum number of signatories required
to authorize a transaction. It provides an added layer of security and control over the funds, while also
determining the level of convenience and ease of use for the wallet.

## Single Treshold Multi-Sig Wallets

Single threshold multisig wallets are a type of multisig wallet where a single signature is required to sign
and execute transactions. This means that a transaction can be authorized by any one of the signatories in
the group, making it easier to use and manage compared to wallets with higher threshold requirements.

Single threshold multisig wallets are often used in situations where a group of people or entities need to
manage funds together, but want to avoid the risks associated with a single-person control over the funds.
For example, a small business might use a single threshold multisig wallet to manage its expenses and payments,
with each authorized employee having a wallet for executing transactions.

Advantages:

- Easy to use: With a single threshold, any signatory in the group can sign and execute transactions,
  making it more convenient and easier to use compared to wallets with higher threshold requirements.
- Flexibility: Single threshold multisig wallets are flexible and can be customized to suit specific
  needs and use cases, such as adjusting the number of signatories or changing the threshold requirements.

Disadvantages:

- Reduced security compared to higher threshold wallets: Single threshold multisig wallets provide less
  security than wallets with higher threshold requirements, as they only require one signature to execute
  transactions.

In summary, single threshold multisig wallets are a convenient and flexible option for managing funds
among a group of people or entities, with the added security benefits of multisig wallets. However,
they may not provide the same level of security as higher threshold multisig wallets, and it's important
to weigh the advantages and disadvantages based on the specific use case and requirements.

## Managing Multi-Sig Wallets with Camino Wallet

When logging into your wallet using your key phrase, navigate to the Manage Keys section. If your wallet
is a member of a multisig wallet, you will be prompted with an import wallets dialog. You can also access
the same dialog from the wallet switcher button. Figure 1 & 2 shows an examples of these dialogs.

<figure>
<img class="zoom" src="/img/msig/msig-0-import-wallets-dialog.png#center"/>
<figcaption align = "center"><b>Fig.1:</b> Import Wallets Dialog</figcaption>
</figure>

<figure>
<img class="zoom" src="/img/msig/msig-1-import-wallets-dialog-switcher.png#center"/>
<figcaption align = "center"><b>Fig.2:</b> Wallet Switcher Dialog</figcaption>
</figure>

After clicking the import button, your multisig wallets and their corresponding addresses will appear,
as shown in Figure 3.

<figure>
<img class="zoom" src="/img/msig/msig-2-imported-switcher.png#center"/>
<figcaption align = "center"><b>Fig.3:</b> Multi-Sig Wallets Imported</figcaption>
</figure>

You can activate the corresponding wallet by clicking the star icon. This allows you to see and transfer its
funds, as well as sign and execute transactions.

By clicking the multisig owners button, you can view the other members of the wallet and the threshold,
as shown in Figure 4.

<figure>
<img class="zoom" src="/img/msig/msig-3-multisig-members.png#center"/>
<figcaption align = "center"><b>Fig.4:</b> Wallets Owners & Treshold</figcaption>
</figure>

In this panel, "linked wallets" refers to the addresses that are imported to the Camino Wallet and can
be used to sign and execute transactions. "Unlinked wallets" are the other members of the multisig wallet
that are not imported into the Camino Wallet. The owners of these wallets need to log in to the Camino Wallet
to sign multisig transactions.
