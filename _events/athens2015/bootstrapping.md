---
layout: event_detail
title: Distribution/compiler bootstrapping
event: athens2015
order: 30
permalink: /events/athens2015/bootstrapping/
---

*45-minute + 10 minute session on day 1*

Problem: distributions use binaries from earlier releases to build their sources. This requires trust in existing binaries (cf. [Thompson attack](https://en.wikipedia.org/wiki/Backdoor_%28computing%29#Compiler_backdoors)).

Toolchain bootstrap status
--------------------------

Nix, Guix: Toolchain provided by a binary archive containing GCC to bootstrap. Source versions noted, but not even automated.

Guix: Has Scheme implementations of various tools (`wget` replacements etc.) required for bootstrapping to not have to rely on binaries. How feasible, scalable is that?

Debian: Builds everything with maximum number of features, thus maximum number of build dependencies. The dependency graph has cycles of size 800, including stuff like Firefox even. So called *build profiles* (similar to USE flags in Gentoo) reduces this a lot; this is work in progress. Then we should be down to 120.

Debian’s approach to bootstrapping: Not a single bootstrapping script, but rather sufficient meta-data in packages to allow bootstrapping, [rebootstrap](https://wiki.debian.org/HelmutGrohne/rebootstrap) project led by Helmut Grohne. Starting point is an existing minimal Debian, and then starts building a compiler from there. Eventual goal: Diverse Double Compilation of a whole distribution. This does not require varying compiler versions, but rather similar (or same) compiler versions with (very) different bootstrapping history, e.g. Fedora vs. Debian.

Diverse Double Compilation
--------------------------

Diverse Double Compilation can detect backdoors, unless they are in all used compilers.

Problems:

 * There are not many compilers to choose from (C++: only two free ones). Is it acceptable to use non-free ones here?
 * Compiler source is not the only input (binutils, libc etc.)

**Task**: Needs a definition of the features required from a minimal base compilation system (shells, Make, etc.), so that we can bootstrap one distribution on another.

Compilers
---------

Other compilers, like GHC, rust, MIT Scheme: Requires specific recent versions of itself.

**Task**: What is the most recent version of GCC that can be built with another C compiler?

**Task**: What is the most recent version of GHC that can be built with another compiler, e.g. Hugs (which would be implemented in C)?

One way out: GCC frontend, e.g. for Rust.

Better examples:

 * Guile: Comes with a C interpreter.
 * JDK (not much of a problem, can be bootstrapped with GCJ)

*Wish*: Compiler implementors would provide a easily executable rewrite-semantics for their languages, for bootstrapping. But likely far too much effort. One selling point would be that it also helps bootstrapping on new architectures.

Certification for compilers: is there a way to certify compilers? Can we create a standard procedure for bootstrapping a compiler and providing a hash of a known good GCC 4.8 (+ `libc`, Make) binary, for example?

Should we try to encourage languages:

 - To have two diverse compilers?
 - To have a compiler written in C (which can then be verified)?
 - To have an interpreter written in another language? (This may be easier than a compiler)
 - To create a compiler ring (A compiles B compiles C compiles A)?

**Task**: Investigate whether NetBSD can be fully diverse double-compiled.

Summary
-------

Overall question: What are the benefits from complete bootstrapping from
scratch? Anything besides the Thompson attack? Less binaries to trust! Cross
compilation again, more important now.
