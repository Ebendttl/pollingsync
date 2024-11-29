# Simple Fungible Token Contract

## Overview

A minimal Clarity smart contract implementing a basic fungible token with core functionality for minting, transferring, and balance checking.

## Features

- Token minting (by contract owner only)

- Token transfers

- Balance inquiry

- Total supply tracking

## Functions

- `mint`: Create new tokens for a specific recipient

- `transfer`: Send tokens between accounts

- `get-balance`: Check token balance of an account

- `get-total-supply`: Retrieve total token supply

## Security Notes

- Only contract owner can mint tokens

- Basic balance checks before transfers

- Immutable once deployed

## Requirements

- Stacks blockchain

- Clarity smart contract support

## Usage Example

```clarity

;; Mint tokens

(contract-call? .my-token mint u100 'recipient-address)

;; Transfer tokens

(contract-call? .my-token transfer u50 'sender 'recipient)

```

## Limitations

- Basic implementation

- No advanced token features

- Minimal error handling
