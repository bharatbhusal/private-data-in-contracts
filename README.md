## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Anvil

```shell
$ anvil
```

### Deploy CTF1PrivateData

```shell
forge script script/CTF1PrivateData.s.sol:AccessPrivateData
```
### Deploy PrivateDataAccess

```shell
$ source .env

$ forge script script/AccessPrivateData.s.sol:AccessPrivateData --fork-url $GOERLI_RPC_URL --broadcast
```
