# Capitalindia-Token
📄 Capitalindia Token (DHL)
This repository contains the Solidity source code for the Capitalindia (DHL) ERC-20 token deployed on the Polygon blockchain.

🔐 Overview
Capitalindia is a capped, burnable ERC20 token with built-in airdrop and referral mechanisms. It is designed for transparent distribution and controlled minting via the contract owner.

🛠 Features
✅ ERC20 Standard Compliant

🔒 Ownership & Access Control via Ownable

🔥 Burnable Tokens with burn and burnFrom

🚫 Capped Supply to prevent over-minting

🎁 Airdrop System with referral reward

⏳ Airdrop Locking Mechanism (60-day lock)

🧑‍⚖️ Manual Trading Activation by Owner

📦 Supply Details
Total Supply (Capped): 1,460,000,000 DHL

Airdrop Allocation: 292,000,000 DHL

Initial Mint to Owner: 1,168,000,000 DHL

📜 Constructor
solidity
Copy
Edit
constructor() 
    ERC20("Capitalindia", "DHL") 
    ERC20Capped(INITIAL_SUPPLY) 
    Ownable(msg.sender)
🚀 Deployment Info
Contract Address: 0x9542BfE3E108cbf308F39E0828BA6f55A18B2C14

Network: Polygon

Compiler Version: v0.8.20

Optimization: Enabled (200 runs)

🔗 External Links
View on PolygonScan

Uniswap
# Capitalindia Token (DHL)

This repository contains the Solidity source code for the **Capitalindia (DHL)** ERC-20 token deployed on the **Polygon (MATIC)** blockchain.

## 🔐 Token Overview

- **Token Name:** Capitalindia
- **Symbol:** DHL
- **Decimals:** 18
- **Total Supply:** 1,460,000,000 DHL
- **Airdrop Supply:** 292,000,000 DHL
- **Standard:** ERC-20 (with Cap, Burn, and Airdrop logic)

## ✨ Features

- Airdrop with referral system
- Locked airdrop tokens (60 days)
- Owner-controlled minting and trading start
- Cap-limited total supply

## 📜 License

This project is licensed under the MIT License.


https://github.com/akhlaqtariqi146/Capitalindia-Token
