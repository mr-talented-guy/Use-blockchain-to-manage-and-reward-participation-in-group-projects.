# ProjectToken

## Vision

The `ProjectToken` contract is a simple implementation of an ERC20 token that allows for basic token transfer and approval functionalities. It is designed to be used in decentralized applications (dApps) and blockchain-based systems that require a standard token for managing and transferring value.

## Features

- **Standard ERC20 Functionality**: Implements basic ERC20 token operations including transfer, approval, and transferFrom.
- **Initial Supply**: Mints an initial supply of tokens to the contract creator upon deployment.
- **Events**: Emits events for token transfers and approvals to allow for easy tracking of token transactions.
- **Mapping for Balances and Allowances**: Maintains mappings for user balances and allowances, enabling secure and efficient token management.

## Diagrams

### Token Flow Diagram

```plaintext
+-----------------------+          +----------------------+
|     Token Holder      |          |     Token Holder     |
|  (Sender)             |          |  (Recipient)         |
|                       |          |                      |
|  balanceOf            |          |  balanceOf           |
|  allowance            |          |  allowance           |
+-----------------------+          +----------------------+
         |                                  |
         | transfer()                       | transfer()
         |                                  |
         v                                  v
+-----------------------+          +----------------------+
|   ProjectToken        |          |   ProjectToken       |
|   Contract            |          |   Contract           |
|                       |          |                      |
|  balanceOf            |          |  balanceOf           |
|  allowance            |          |  allowance           |
+-----------------------+          +----------------------+
