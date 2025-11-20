**Simple Token Smart Contract**

A lightweight and extensible STX-based token implemented in **Clarity** on the **Stacks blockchain**.
This contract provides basic token functionality, including minting, transferring, and checking balances.

---

**Features**

**Fixed token name, symbol, and decimals**
**Minting** restricted to contract owner
**Secure balance storage** using a Clarity map
**Transfer function** with validation
**Read-only views** for token metadata and balances
**Minimal, clean, and easy to extend**

---

**Contract Structure**

**Main Functions**

| Function       | Type      | Description                                       |
| -------------- | --------- | ------------------------------------------------- |
| `mint`         | public    | Mint new tokens to a recipient (owner-only).      |
| `transfer`     | public    | Transfer tokens from sender to another principal. |
| `get-balance`  | read-only | Returns the balance of a given principal.         |
| `get-name`     | read-only | Returns the token name.                           |
| `get-symbol`   | read-only | Returns the token symbol.                         |
| `get-decimals` | read-only | Returns the token decimal places.                 |

---

**Example Usage**

**Mint Tokens**

```clarity
(contract-call? .simple-token mint tx-sender u1000)
```

**Transfer Tokens**

```clarity
(contract-call? .simple-token transfer tx-sender 'SP2ABC... u200)
```

**Check Balance**

```clarity
(contract-call? .simple-token get-balance 'SP2ABC...)
```

---

**Project Structure**

```
simple-token.clar      Main Clarity smart contract
README.md              Documentation
tests/                 (Optional) Clarinet tests
```

---

**Deployment**

To deploy using **Clarinet**:

```bash
clarinet contract deploy simple-token
```

Or manually:

1. Upload the `.clar` file to your Stacks wallet deployment tool.
2. Confirm contract name and code.
3. Broadcast transaction.

---

**Contributing**

Contributions are welcome!
You may open issues, propose features, or submit pull requests that improve the contract or tests.

---

**License**

This project is licensed under the **MIT License**, allowing open and flexible reuse.

---
