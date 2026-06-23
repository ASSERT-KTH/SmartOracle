# SmartOracle Benchmark Mapping & Analysis

This repository contains the mapping and comparative analysis between your dataset of smart contract incidents and the SmartOracle benchmark dataset.

## ✅ EXACT MATCHES (Identical Address)

| Dfhl Dataset | SmartOracle DApp Folder | Contract | Address |
| :--- | :--- | :--- | :--- |
| 202008_Opyn | 20200804_opyn | oToken | 0x951d51...ABfe2 |
| 202102_Yearn_ydai | 20210205_yearn_finance | yVault | 0xACd43E...F952 |

*Both verified with an exact on-chain address match by reading the `config.json` of the SmartOracle repository.*

---

## ⚠️ Same Protocol, Different Incident

| Dfhl Dataset | SmartOracle Folder | Notes |
| :--- | :--- | :--- |
| 202206_InverseFinance <br>*(Jun 2022, YVCrv3CryptoFeed, oracle/flash loan)* | 20220402_inverse_finance <br>*(Apr 2022, CErc20Immutable)* | Same DApp, but different hacks — different addresses and contracts. |

---

## 📋 Conclusion 

Out of the 26 contracts in your dataset, **2 are also present in the SmartOracle benchmark** with an exact address match. The remaining 24 are either outside the timeframe or not covered. 
