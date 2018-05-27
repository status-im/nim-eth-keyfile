**Nim ETH-keyfile**

[![License: Apache](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/status-im/nim-eth-keyfile.svg?branch=master)](https://travis-ci.org/status-im/nim-eth-keyfile)
[![Build status](https://ci.appveyor.com/api/projects/status/q932rbyxq24s7k9l/branch/master?svg=true)](https://ci.appveyor.com/project/cheatfate/nim-eth-keyfile/branch/master)

## Introduction
This library is a Nim reimplementation of [ethereum/eth-keyfile](https://github.com/ethereum/eth-keyfile), which is used to create and load Ethereum `keyfile` format and the tools for handling the format and for storing private keys. Currently, the library supports only the PBKDF2 method and does not support the Scrypt method.

## Installation
nimble install https://github.com/status-im/nim-eth-keyfile/blob/master/eth_keyfile.nimble

## License

Distributed under one of the following:

* Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
* MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
