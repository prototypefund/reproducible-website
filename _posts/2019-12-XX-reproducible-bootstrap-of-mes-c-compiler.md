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
despite using different versions of GCC to build the initial MES
compiler, which was then used to build the bit-for-bit identical MES binary.

GNU MES is used by GNU Guix to bootstrap a complete software
distribution from a minimal set of binary seeds, so this achievement
demonstrates the viability to use Diverse Double Compilation
techniques in the real world as a counter to Trusting Trust attacks.

The MES binary produced as a result of this work is available in GNU
Guix as the mes-rb5 package, and in the Debian mes 0.21-3 version as
the "mes-boot0-static" binary.

Future work includes attempting to bootstrap MES with additional
compilers, such as TinyCC and Clang, as a more pure demonstration of
Diverse Double Compilation.
