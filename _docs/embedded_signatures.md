---
title: Embedded signatures
layout: docs
permalink: /docs/embedded-signatures/
---

Software that are distributed using embedded cryptographic signatures
can pose a challenge to allow users to reproduce identical results.
By definition, they will not be able to generate an identical signature.
This can either be solved by making the signature part of the build
process input or by offering tools to transform the distributed binaries
to pristine build results.

Pasting signatures
------------------

One way to handle embedded cryptographic signatures is to make the
signature an (optional) input of the build process. When a signature
is available, it just get copied at the right location.

This enables the following workflow:

1. An initial build is made by the developers who have access to the private key.
2. The build result is signed to an external file.
3. The signature is made part of the released source code.
4. The build that is going to be distributed is made from the latter source.

The `wireless-regdb` package in Debian is an example on [how this can be
be
implemented](https://sources.debian.net/src/wireless-regdb/latest/debian/rules/).

Ignoring signatures
-------------------

A specific comparison tool can be made available that is able to compare
to builds skipping the signatures. Ideally, it should also be able to
produce cryptographic checksums to make downloading the original build
unneeded to solely compare the results.

Such a tool must be **very** easy to audit and understand. Otherwise,
it's hard to trust that the script is not ignoring bytes that would make
it behave differently.

Stripping signatures
--------------------

Another option is to ship a tool that can strip the signatures from the
official releases. The result can then be compared byte-for-byte with
the results from the user.

This method has the downside that it requires user to download the
official releases to do the comparison. It's also harder to attest that
the data that is being removed will not make the software behave
differently.
