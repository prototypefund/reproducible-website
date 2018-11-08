---
layout: event_detail
title: How bootstrapping relates to reproducible builds and how to improve it
event: berlin2017
order: 80
permalink: /events/berlin2017/bootstrapping/
---

* https://bootstrappable.org
* bootstrappable builds

open questions:

* What is the relationship to reproducibility?
* Why should we care?
* We need to trust binaries used during build. If build binaries are not trustworthy, this makes build results less trustworthy.
* If we have a exe at the top and a lib it depends on, do we call the exe reproducible even if the lib is not reproducible?
* is trust binary / black&white? no...

overlap:

* build as much from source to need less trust in binaries, and to be able to read/review the source
* increase trust in the software we build
* trust gets added with every way you can build a software from source
* diff: reproducible builds: done when 100% of packages are building reproducibly
* bootstrappable: (C-part) done when one can take any C-compiler and compile the production C-compiler and with that get bit-identical binaries of anything

Requirement for doing bootstrappable builds:

* A "seed set" of bootstrap binaries has to be declared by a project (e.g. see f-droid below or a binary with a specific checksum), must not be implicit (e.g. previous version of myself)
* For build use a limited build environment containing only those binaries and nothing more.
* large complex source can still be hard to read, understand, verify => reduce amount of trusted software
backdoors in built source code are out of scope of bootstrappable builds
* Is it a software freedom problem? maybe, maybe not
* long chains of A->B->C may bitrot and break over time, give less trust than A->C ; but we have archives, and containers
* obsolete hardware needs to be emulated and the emulator becomes part of the binaries we need to trust.
* Have build scripts that are fully specified about versions of compilers, etc to use in a boostrap-chain.

Note: Trust is not transitive (unlike a=b=c meaning a=c) so if the sister of a friend knows someone who verified this it is not as much trust as "I verified this". Possibly also because trusting someone very much translates to a factor of 0.9x thus for every level of indirection you lose some trust.

f-droid: using debian binaries as much as possible because they are built from source and thus more trustworthy.

guix: build archive with checksums of everything with 218MB bootstrap binaries

openSUSE: uses [Ring-0](https://build.opensuse.org/project/show/openSUSE:Factory:Rings:0-Bootstrap)

Goal: come up with very small set of auditable binaries+sources

* https://gitlab.com/janneke/mes is close
* https://savannah.nongnu.org/projects/stage0

Goal: need zero trust in the seed set of binaries - cannot be fully reached, but we can get to very small (maybe infinitessimal) values of trust needed.

How to distinguish trusted bootstrap binaries from other binaries?
tools/compilers that depend on themselves:
* gradle
* ghc(Haskell)
* rust
* maven

identify important next steps:
* collect list of bootstrappable and non-bootstrappable tools
* convert notes to proper doc
* identify high-importance targets to achive bootstrappability
* more to be discussed

