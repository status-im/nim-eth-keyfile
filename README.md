# eth_keyfile

[![Build Status (Travis)](https://img.shields.io/travis/status-im/nim-eth-keyfile/master.svg?label=Linux%20/%20macOS "Linux/macOS build status (Travis)")](https://travis-ci.org/status-im/nim-eth-keyfile)
[![Windows build status (Appveyor)](https://img.shields.io/appveyor/ci/nimbus/nim-eth-keyfile/master.svg?label=Windows "Windows build status (Appveyor)")](https://ci.appveyor.com/project/nimbus/nim-eth-keyfile)
[![License: Apache](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
![Stability: experimental](https://img.shields.io/badge/stability-experimental-orange.svg)

## Introduction
This library is a Nim reimplementation of [ethereum/eth-keyfile](https://github.com/ethereum/eth-keyfile), which is used to create and load Ethereum `keyfile` format and the tools for handling the format and for storing private keys. Currently, the library supports only the PBKDF2 method and does not support the Scrypt method.

## Installation
$ nimble install eth_keyfile

## License

Licensed and distributed under either of

* MIT license: [LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT
* Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)

at your option. This file may not be copied, modified, or distributed except according to those terms.

