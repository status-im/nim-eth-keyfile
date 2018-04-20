packageName   = "eth_keyfile"
version       = "0.0.1"
author        = "Status Research & Development GmbH"
description   = "Tools for handling the encrypted keyfile format used to store Ethereum private keys"
license       = "Apache License 2.0 or MIT"
skipDirs      = @["tests", "Nim"]

### Dependencies

requires "nim > 0.18.0" , "nimcrypto >= 0.3.0", "eth_keys"

proc runTest(name: string, lang = "c") = exec "nim " & lang & " -r tests/" & name

task test, "Run all tests":
  runTest "testuuid"
