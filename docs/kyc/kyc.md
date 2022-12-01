---
sidebar_position: 1
---

# Know-Your-Customer

## Overview

The Chain4Travel “network“ is bound to revolutionize the way people will travel in the near future. Nevertheless, as the possibilities for new and exciting ways to create and enjoy travel experiences, so too will the methods that ill-intentioned people or organizations might use to take advantage of them. Therefore, Camino uses a KYC service/process to protect travellers and businesses from fraudulence.

## What does KYC mean and how does it work?

KYC stands for Know Your Client/Customer, and it is a regulatory process used to ascertain the identity and other credentials of a user. It is becoming legally mandatory in most countries, to ensure that the users are actually who they claim to be and to help against money laundering and the financing of terrorist activities. Moreover, if the users on the Camino network are verified, this will make our endeavors more trustworthy and less risky, thus enhancing the experience.

To be verified, the user has to share an id document and pass a liveness check to authenticate. After a successful verification, we save the verified status to the Camino blockchain where it can be picked up by the network. The smart contract which handles the KYC process can be found here:
 1. Testnet Columbus: `0xcE2b8Ad41a4Cd4B3B718B4fAf2dad4351a015541`
 2. Mainnet Camino: `0x010000000000000000000000000000000000000a`

> No personal information will be saved to the Camino Blockchain or any other public ledger when using the Camino KYC verification.

## Who does the verification?

The information submitted by the user needs to be verified against documents issued by authorities or against information obtained from independent and reliable sources, to make sure that the user has not provided false documents or incorrect information. 

The process for verifying documents can be either manual, or automatic. The manual, human verification takes time, is prone to errors and might not spot increasingly advanced forged documents. Therefore, an automatic approach that compares the documents against various open data sources and performs checks for optical security features will speed up the process and minimize the risk of fraudulent activities. 

The verification of the user’s documents will be performed by Sumsub (an all-in-one verification platform, https://sumsub.com). These entities will store the copies of the documents presented by the user in an encrypted format, on secure servers, which comply with the GDPR requirements. As a result, they will make sure that the users’ documents are kept safe and tamper-free. An off-chain backend is used to communicate with the service provider - the Camino blockchain will only retain a simple entry if a wallet address is verified or not, but none of the personal documents or personal information will be stored on-chain.

## When should I become KYC verified?

There is no specified point in time for when the KYC has to be done. Chain4Travel will offer a KYC process to all participants of the Camino blockchain. Instead, it can be done whenever the user pleases to do so. However, it is not possible to deploy smart contracts on Camino or join the Camino Consortium if one is not verified. There may also be dApps which can only be used by verified users.

## KYC documents

Different ID documents may be used to verify a user, this includes the ID card, passport, or driver’s licence. Which ID document is available for the KYC service depends on the nationality of the user. 

## KYC verification process

1. The verification process starts by clicking the verification button on the left bottom of the Camino wallet
![Verify KYC](/img/kyc/verify-kyc.png)

2. A modal from the KYC verification provider will appear that firstly asks for a phone number and email address. The phone number and email is used for any communication regarding the KYC process only.
![KYC Modal](/img/kyc/kyc-modal.png)

3. In the next step of the verification process, the user is asked to select his nationality, the type of ID to be used for verifcation and to upload images of ID's back and front.
![id-types](/img/kyc/id-types.png)

4. In the following steps, the id is checked for validity, integrity. The user is checked against AML databases.

5. After verification, the update KYC status will be displayed in the wallet:
![KYC Verified](/img/kyc/kyc-verified.png)

6. In case of a negative verification result, the user will be informed via the email address that was entered at the beginning of the verification process.

## Advantages

While being KYC-verified is not mandatory for individuals who want to use smart contracts, i.e. for individuals who have the money and want to buy. It is mandatory for everyone who wants to deploys smart contracts and thus, do business on Camino

Moreover, the verification of users in accordance with the provisions in the local jurisdiction will ensure everyone’s protection against unforeseen problems related to verification and compliance regulations, as well as provide safety from penalties for not meeting regulatory requirements.

Eventually, the verified status will enable the user to exist in a self-sovereign identity system, allowing him to access services in a streamlined and secure manner, while also maintaining control over the information associated with their identity.









