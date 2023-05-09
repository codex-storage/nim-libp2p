# Nim-LibP2P
# Copyright (c) 2023 Status Research & Development GmbH
# Licensed under either of
#  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE))
#  * MIT license ([LICENSE-MIT](LICENSE-MIT))
# at your option.
# This file may not be copied, modified, or distributed except according to
# those terms.

import chronos, chronicles

import ../types

method setup*(self: Service, switch: Switch): Future[bool] {.base, async, gcsafe.} =
  if self.inUse:
    warn "service setup has already been called"
    return false
  self.inUse = true
  return true

method run*(self: Service, switch: Switch) {.base, async, gcsafe.} =
  doAssert(false, "Not implemented!")

method stop*(self: Service, switch: Switch): Future[bool] {.base, async, gcsafe.} =
  if not self.inUse:
    warn "service is already stopped"
    return false
  self.inUse = false
  return true
