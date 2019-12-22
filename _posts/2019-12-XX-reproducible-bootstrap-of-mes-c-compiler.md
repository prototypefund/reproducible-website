---
layout: post
title:  "reproducible bootstrap of Mes C compiler"
date:   2019-12-XX 00:00:00
categories: org
draft: true
---

During the [Reproducible Builds Summit in Marrakesh](https://reproducible-builds.org/events/Marrakesh2019/),
three distros ([GNU Guix](https://guix.gnu.org), [Nix](https://nixos.org)
and [Debian](https://debian.org)) were able to produce a bit-for-bit
identical binary when building [GNU Mes](https://www.gnu.org/software/mes/), 
despite using three different major versions of GCC to build the initial Mes
compiler, which was then used to build the bit-for-bit identical Mes binary.
Since the summit, additional work resulted in a bit-for-bit indentical
Mes binary using tcc.

At a previous Reproducible Builds Summit people implemented a 
[proof of concept build of TinyCC](https://github.com/bmwiedemann/ddcpoc), 
using multiple different compiler implementations, though notably GNU
Mes is used by
[GNU Guix to bootstrap](https://guix.gnu.org/blog/2019/guix-reduces-bootstrap-seed-by-50/) 
a complete software distribution from a minimal set of binary seeds.

These accomplishments are early steps towards demonstrating the
viability to use
[Diverse Double-Compiling](https://dwheeler.com/trusting-trust/dissertation/html/wheeler-trusting-trust-ddc.html)
techniques in the real world to counter
[Trusting Trust attacks](https://archive.org/details/reflections-on-trusting-trust).

Future plans include attempting to bootstrap Mes with an even more
diverse set of compilers such as Clang and Microsoft's C compiler,
aiming for a proper real-world demonstration of Diverse
Double-Compiling.

The Mes binary produced as a result of this work is available in GNU
Guix as the mes-rb5 package, and in the Debian i386 mes 0.21-3 version
as the "mes-boot0-static" binary.

And the moment you've all been waiting for:
sha256sum 9e0bcb1633c58e7bc415f6ea27cee7951d6b0658e13cdc147e992b31a14625fb
