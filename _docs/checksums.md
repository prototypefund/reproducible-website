---
title: Cryptographic checksums
layout: docs
permalink: /docs/checksums/
---

How can users know that the build they just made has successfully
reproduced the original build?

The easiest way is to make sure that the build outputs are always
byte-for-byte identical. Byte-for-byte comparison is a trivial operation
and can be performed in many different environments.

The other benefit of having identical bytes is that it makes it possible to
use [cryptographic
checksums](https://en.wikipedia.org/wiki/Cryptographic_hash_function).
Such checksums are really tiny compared to the full build products. They
are easily exchanged even in very low bandwidth situation.

For example, it makes it possible to build a software release both on a
well-connected (but hard to trust) server and on a laptop behind a bad
mobile connection. The digital signature can be made locally on the
laptop. As the build products will be identical, the signature will be
valid for the files produced on the well-connected server.
