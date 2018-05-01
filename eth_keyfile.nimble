packageName   = "eth_keyfile"
version       = "0.1.0"
author        = "Status Research & Development GmbH"
description   = "Tools for handling the encrypted keyfile format used to store Ethereum private keys"
license       = "Apache License 2.0 or MIT"
skipDirs      = @["tests", "Nim", "nim"]

### Dependencies

requires "nim > 0.18.0",
         "https://github.com/cheatfate/nimcrypto",
         "https://github.com/status-im/nim-eth-keys"

task test, "Run all tests":
  exec "nim c -r tests/testuuid"
  exec "nim c -r tests/testkeyfile"
  exec "nim c -r -d:release tests/testuuid"
  exec "nim c -r -d:release tests/testkeyfile"
