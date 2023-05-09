# Nim-LibP2P
# Copyright (c) 2023 Status Research & Development GmbH
# Licensed under either of
#  * Apache License, version 2.0, ([LICENSE-APACHE](LICENSE-APACHE))
#  * MIT license ([LICENSE-MIT](LICENSE-MIT))
# at your option.
# This file may not be copied, modified, or distributed except according to
# those terms.

import chronos

import stream/connection,
       transports/transport,
       upgrademngrs/[upgrade, muxedupgrade],
       multistream,
       multiaddress,
       protocols/protocol,
       protocols/secure/secure,
       peerinfo,
       protocols/identify,
       muxers/muxer,
       utils/semaphore,
       connmanager,
       nameresolving/nameresolver,
       peerid,
       peerstore,
       errors,
       utility,
       dialer

type
  Service* = ref object of RootObj
    inUse*: bool

  Switch* {.public.} = ref object of Dial
    peerInfo*: PeerInfo
    connManager*: ConnManager
    transports*: seq[Transport]
    ms*: MultistreamSelect
    acceptFuts*: seq[Future[void]]
    dialer*: Dial
    peerStore*: PeerStore
    nameResolver*: NameResolver
    started*: bool
    services*: seq[Service]
