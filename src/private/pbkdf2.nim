# Nim Eth-keyfile
# Copyright (c) 2018 Status Research & Development GmbH
# Licensed under either of
#
#  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
#  * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
#
# at your option. This file may not be copied, modified, or distributed except according to those terms.

# Nim Implementation of PBKDF2 (Password-Based Key Derivation Function 2)
# https://tools.ietf.org/html/rfc2898
# https://en.wikipedia.org/wiki/PBKDF2

import nimSHA2, math, strutils, endians
import ./hmac

type SHA2_Digest = SHA224Digest or SHA256Digest or SHA384Digest or SHA512Digest

proc pbkdf2_hmac*(
  HashName: typedesc[SHA2_Digest],
  password, salt: string,
  iterations: Positive,
  dkLen: Natural = 0
): seq[byte] {.noSideEffect.}=

  # Steps from the IETF spec
  let hLen = sizeof(HashName)
  let dklen = if dklen == 0: hlen
              else: dklen

  # Step 1
  if dkLen > (2^32 - 1) * hLen:
    raise newException(ValueError, "derived key too long")

  # Step 2
  let
    n = dkLen div hLen # number of hLen-octet blocks in teh derived key (`l` in the official spec)
    r = dkLen - (n - 1) * hLen # number of octets in the last block

  # Step 3
  when HashName is SHA256Digest:
    proc F(password, salt: string, c: Positive, i: range[1.uint32..high(uint32)]): HashName =
      var i_BE{.noInit.}: array[4, char] # i as a big-endian 32-bit integer
      bigEndian32(addr i_BE, unsafeAddr i)

      result = hmac_sha256(password, salt & $i_BE)
      for j in 1 ..< c:
        result = hmac_sha256(password, $result)

  # Step 4
  var fullDK = newSeq[HashName](n) # Full derived key

  for i, val in fullDK.mpairs:
    # In practice we don't need the full loop we only need to stop
    # when we have dkLen bytes of data
    val = F(password, salt, iterations, uint32(i+1)) # iteration must be one-based for the spec

  # Step 5
  let fullDK_as_bytes = cast[ptr UncheckedArray[byte]](addr fullDK[0])
  result = @(fullDK_as_bytes[][0 ..< n * hLen])


when isMainModule:
  # From https://github.com/openssl/openssl/blob/c537e74ba32e28d747d8e747abfa6cfff75c44c1/test/recipes/30-test_evp_data/evppbe.txt#L114-L119
  import strutils

  let
    password = "password"
    salt = "salt"
    iter = 1
  type MD = SHA256Digest

  let hash = pbkdf2_hmac(MD, password, salt, iter)
  echo toHex(cast[string](hash))

  # No toHex for seq[byte]: https://github.com/nim-lang/Nim/issues/4599
  doAssert toHex(cast[string](hash)) == "120fb6cffcf8b32c43e7225256c4f837a86548c92ccc35480805987cb70be17b".toUpperASCII
