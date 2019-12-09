---
layout: post
title:  "reproducible bootstrap of MES C compiler"
date:   2019-12-XX 00:00:00
categories: org
draft: true
---

During the [Reproducible Builds Summit in Marrakesh](https://reproducible-builds.org/events/Marrakesh2019/),
three distros ([GNU Guix](https://guix.gnu.org), [Nix](https://nixos.org)
and [Debian](https://debian.org)) were able to produce a bit-for-bit
identical binary when building [GNU MES](https://www.gnu.org/software/mes/), 
despite using three different major versions of GCC to build the initial MES
compiler, which was then used to build the bit-for-bit identical MES binary.

At a previous Reproducible Builds Summit people implemented a 
[proof of concept build of TinyCC](https://github.com/bmwiedemann/ddcpoc), 
though notably GNU MES is used by GNU Guix to bootstrap a complete software
distribution from a minimal set of binary seeds, so this achievement
demonstrates the viability to use 
[Diverse Double-Compiling](https://dwheeler.com/trusting-trust/dissertation/html/wheeler-trusting-trust-ddc.html)
techniques in the real world as a counter to Trusting Trust attacks.

The MES binary produced as a result of this work is available in GNU
Guix as the mes-rb5 package, and in the Debian i386 mes 0.21-3 version
as the "mes-boot0-static" binary.

Future plans include attempting to bootstrap MES with additional
compilers, such as TinyCC and Clang, for a more rigorous and proper
demonstration of Diverse Double-Compiling.

And the moment you've all been waiting for:
sha256sum 9e0bcb1633c58e7bc415f6ea27cee7951d6b0658e13cdc147e992b31a14625fb
