packageName   = "eth_keyfile"
version       = "0.0.1"
author        = "Status Research & Development GmbH"
description   = "Tools for handling the encrypted keyfile format used to store Ethereum private keys"
license       = "Apache License 2.0 or MIT"
srcDir        = "src"

### Dependencies

requires "nim >= 0.18.0"

proc test(name: string, lang: string = "cpp") =
  if not dirExists "build":
    mkDir "build"
  if not dirExists "nimcache":
    mkDir "nimcache"
  --run
  --nimcache: "nimcache"
  switch("out", ("./build/" & name))
  setCommand lang, "tests/" & name & ".nim"

task test, "Run all tests":
  test "all_tests"

