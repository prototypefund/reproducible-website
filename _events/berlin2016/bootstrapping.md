---
layout: new/event_detail
title: Bootstrapping I
event: berlin2016
order: 210
permalink: /events/berlin2016/bootstrapping/
---


* plan (written before the session)
  * discussion
    * opaque binaries in the dependency graph ought to be minimised
    * discuss problems of trusting binary blobs for compilers
    * we need diverse language implementations and actually use them to build compilers
  * maintaining GCC 4.7
    * last version to be implemented in C only, needed to build later GCC versions that require a C++ compiler
  * maintaining GCJ
    * it’s abandoned by upstream but necessary to bootstrap OpenJDK from source
  * bootstrapping GHC
  * rustc + cargo
  * Java: maven build environment
  * ocaml?
  * building GCC without GCC
    * investigate if tinycc (or similar) could be used to build an older/simpler version of GCC

* expected outcome
    * agree on the problem
    * make a public statement as to why bootstrapping is a problem and provide best practises for compiler writers

* participants
    * members of Guix, NixOS, NetBSD, Qubes, and Bazel

* NetBSD
    * Go: build 1.4 first then 1.6
    * many compiler packages are in the pkgsrc source tree, but it’s not clear how all of them are bootstrapped
    * the system can be built from many other systems.  It first builds the toolchain (pseudo cross-compiler).  It’s a bug if you cannot build NetBSD on OSX, Linux, *BSD, etc.

* NixOS
    * Java is bootstrapped with a custom maintainer build of the JDK
    * Haskell: chain of three different builds to get to the latest version: [https://github.com/NixOS/nixpkgs/issues/19926](https://github.com/NixOS/nixpkgs/issues/19926)

* Guix
    * Java is bootstrapped from GCJ -> IcedTea 6 –> IcedTea7 –> IcedTea8

* Problems
    * depending on binaries for building compilers and/or build systems is bad for trust
    * the scale of the problem is getting larger as time passes: we started with just having GCC as a problem, but as time passed we got more and more new languages that are self-hosted (i.e. need an older version of themselves to be built).
    * having a long chain of builds means that build systems have to be kept alive in modern environments.
    * Go has its own linker, so to keep the bootstrap working patches have to be backported
    * later versions of GCC are written in C++
    * if you’re going to maintain an old version GCC just for a bootstrap chain you’ll have to backport new architectures.  This means that our bootstrap chain is forever tied to x86 (PowerPPC users cannot bootstrap on their own).
    * generated C code is not source — it may make portability possible, but it’s not trustworthy
    * bootstrapping is not a *functional* feature, so the value isn’t immediately obvious (very much like reproducible builds)
    * the whole toolchain has bootstrapping issues (including linker and kernel…)

* Ideas
  * Consensus
    * languages with multiple implementations are great, because diversity makes bootstrapping easier.  For single-implementation languages we need alternative ways to get started (even if it’s inefficient)
  * Rather than depend on more binary blobs, throw more CPU time at it, e.g. by emulating an x86 CPU with qemu and then work from there.
  * Need to reach out to compiler developers: make sure that there’s a non-self-hosted path to build the first compiler — find cooperative people in compiler projects to “bootstrap” a bootstrapping project
  * try to depend only on the smallest C compiler possible
    * e.g. [tinycc](http://www.landley.net/code/tinycc/), [pcc](http://pcc.ludd.ltu.se/), [qcc](http://www.landley.net/qcc/)
    * coreboot folks have a simple C compiler RAMCC(?)
  * register [http://bootstrappable.org](http://bootstrappable.org), collect stories there!
*** motivation: collect examples of backdoored compilers
    * toy example: [https://manishearth.github.io/blog/2016/12/02/reflections-on-rusting-trust/](https://manishearth.github.io/blog/2016/12/02/reflections-on-rusting-trust/)
    * Ken Thompson: reflections on trusting trust
    * "Defending Against Compiler-Based Backdoors" [http://blog.regehr.org/archives/1241](http://blog.regehr.org/archives/1241)
    * PoC/GTFO [https://www.alchemistowl.org/pocorgtfo/pocorgtfo08.pdf](ttps://www.alchemistowl.org/pocorgtfo/pocorgtfo08.pdf)
    * TODO: need more!

* Examples
  - e.g. the bootstrap chain for GCC –> GCJ –> IcedTea 6 –> IcedTea7 in Guix
  - GNU Make doesn’t need make but just a bash script
  - Cook
  - Guile Scheme: includes an interpreter written in C.
  - Bazel needs Bazel to build itself, *but* you can build a minimal variant of Bazel with a shell script that runs =javac= on all Java sources, etc
    * Ant, needs itself but can be build with plain Java

* best practises
    * don’t throw old code away (to allow for a bootstrapping chain)
    * have an alternative implementation backend (e.g. written in C or in a language that traces back to C eventually) — simplifies porting
*** Call for Action!
    * target it to different audiences: “if you’re a compiler writer, do this…”, “if you’re a free software dev, consider …”


 
* Notes for the manifesto
    * Don't give "bad" examples, since we don't want to piss off upstreams. Only give "good" examples.


### Website structure

* Homepage / overview of problem

(short summary from the problem - 2-3 concise sentences based on the Problems section?)
(try to clarify what bootstrapping actually is)

To have trust in our computing platforms, we should be able to follow the
bootstrapping process - how each part was produced from source - to then feel
confident it is built on good foundations.

(more detail on the intended outcomes and benefits)

(1. trust/security - most powerful/appealing motivation, mention this one first)

We want to draw attention to the need for an auditable, repeatable process for
bootstrapping programming languages, compilers, pieces of the toolchain and whole
distributions.  

(2. easier porting (new platforms? languages?) - secondary benefit, important but less people are interested)

Another benefit would be that it becomes easier to port these things to new hardware
platforms.

(Motivation / benefits could become a separate section of it gets too big)

Compilers are often written in the language they are compiling.
This creates a chicken-and-egg problem that leads users and
distributors to rely on opaque, pre-built binaries of those
compilers that they use to build newer versions of the compiler.
We believe that those opaque binaries are a threat to user
security and user freedom since they are not auditable; we believe
the amount of bootstrap binaries should be minimized.

* Best Practices (incl. examples, success stories?)

  * For compiler writers...

If you're working on a compiler that is written in a language other than
the one it's compiling, you're all set!

If your compiler is written in the language that it's compiling
(“self-hosted”), it probably falls in one of the following categories.

If other implementations of this programming language exist, please make
sure your compiler can be built with one of these.  Examples include:

  - The Go programming language has two implementations: [the reference implementation](https://golang.org/) is self-hosted, and that in [GCC](https://gcc.gnu.org) is written in C++.
    (TODO: check if we can build one with the other)  Furthermore,
    version 1.4 of the reference implementation was written in a
    different language and can be used to build version 1.5.
  - Common Lisp has several implementations.  Notably [GNU Clisp](http://www.clisp.org/) is
    written and C and can be used to build self-hosted implementations
    such as [SBCL](http://www.sbcl.org/).

If your compiler targets a language for which no other implementation
exists, then please consider maintaining a (minimal) implementation of
the language written in a different language.  Most likely this
implementation exists, or existed at the point the programming language
was created.  Maintaining this alternate implementation has a cost;
however, this cost should be minimal if this alternate implementation is
used routinely to build the compiler, and if this implementation is kept
simple—it does not need to be optimized.

Examples include:

  - [GNU Guile](https://gnu.org/software/guile), a Scheme implementation with a self-hosted compiler, relies on an [Scheme interpreter written in C](http://git.savannah.gnu.org/cgit/guile.git/tree/libguile/eval.c) for bootstrapping purposes.

Please let us know if you’d like to add your compiler to this list!

  * For build systems writers...

Build systems sometimes have chicken-and-egg problems: they may
need a version of themselves to get built.  If you are developing
a build system, this can be avoided.  We recommend that you
provide an alternative way to build your build system.

Examples include:

  - [GNU Make](https://gnu.org/software/make) does not require a ‘make’ implementation.  It can be built using a [shell script](http://git.savannah.gnu.org/cgit/make.git/tree/build.template).
  - [Apache Ant](http://ant.apache.org/) can bootstrap with a [shell script](https://git-wip-us.apache.org/repos/asf?p=ant.git;a=blob;f=bootstrap.sh;h=60b6ece03ce78716bc036a44226f4934b541f326;hb=HEAD) that only relies on the Java compiler.
  - [Bazel](https://bazel.build/) does not require Bazel to build itself but     can be boostrapped with a [shell script](https://github.com/bazelbuild/bazel/blob/master/compile.sh).
  - [Buck](https://buckbuild.com/) does not require Buck to build itself.  Instead, it can be built using [Ant](https://github.com/facebook/buck/blob/master/build.xml).

Build system, compared to compiler, do not need to write a full
language compiler of its language to bootstrap. A really slow and
unefficient build written in shell script or another older
build system (Ant, GNU Make) can generate a minimal version of the
build system to bootstrap a complete version of it. 

  * For distros

It is unavoidable that distributions use some binaries as part of
their bootstrap chain. However, distributions should endeavour to
provide traceacibility and automated reproducibility for such
binaries. This means that:

* It should be clear where the binary came from and how it was
  produced.

* Users can reproduce the binary to verify that it has not been
  tampered with.

For example, a distribution might use a binary package of GCC to build
GCC from source. This bootstrap binary is in most cases built from a
previous revision of the distribution's GCC package. Thus, the
distribution can label the binary with something like "this package
was built by running <command> on revision <hash> of the
distribution's package repository." A user can then easily reproduce
the binary by fetching the specified sources and running the specified
command. This build will in most cases depend on a previous generation
of bootstrap binaries. Thus, we get a chain of verifiable bootstrap
binaries stretching back in time.

Bootstrap binaries may also come from upstream. This would typically
be the case when a language is first added to a distribution. In this
case, it may not be obvious how the binary can be reproduced, but the
distribution should at least clearly label the provenance of the
binary, e.g. "this binary was downloaded from
https://upstream-compiler.example.org/upstream-compiler-20161211-x86_64-linux.tar.xz".

TODO: provide an example of how we do this / are going to do this in
Nixpkgs / Guix / ...?

[http://git.savannah.gnu.org/cgit/guix.git/commit/?id=062134985802d85066418f6ee2f327122166a567](http://git.savannah.gnu.org/cgit/guix.git/commit/?id=062134985802d85066418f6ee2f327122166a567)

* Collaboration projects

  * Continued maintenance of the GNU Compiler for Java (GCJ)

Until recently the latest Java Development Kit (JDK) could be
bootstrapped in a chain starting with GCJ (the GNU Compiler for Java)
and the IcedTea build system.  GCJ was deleted from the GNU Compiler
Collection in October 2016, so it is now unclear how to bootstrap the
JDK in future. To ensure that the JDK can be built from sources
without the need for an existing installation of the OpenJDK we
propose to continue maintaining GCJ.

  * Collectively maintaining GCC 4.7

The C and C++ compilers of the GNU Compiler Collection make up the
foundation of many free software distributions.  Current versions of
GCC are written in C++, which means that a C++ compiler is needed to
build it from source.  GCC 4.7 was the last version of the collection
that could be built with a plain C compiler, a much simpler task.  We
propose to collectively maintain a subset of GCC 4.7 to ensure that we
can build the foundation of free software distributions starting with
a simple C compiler (such as tinyCC, pcc, etc).

* Who are we?  Which projects are participating

* Buy-in

This is nice, but what are the actual benefits of “bootstrappable”
implementations?

  * For users

As a user, bootstrappable implementations, together with [https://reproducible-builds.org](https://reproducible-builds.org) provide confidence that you are running the code you expect to be running.  Its source code is auditable by the developer community, which in turns provides reassurance that the code you’re running does not have backdoors.

  * For distributors

Bootstrappable implementations provide clear provenance tracking: the
dependency graph of your distribution packages shows how each binary was
obtained.

  * For developers

If you are a compiler writer, making your compiler bootstrappable from a
different language will simplify the development process (no need to
carry large pre-built binaries around).  It will also make it easier to
port the compiler to a different platform for which no bootstrap
binaries exist yet.

* Next Steps

Try building gcc using gcc-4.7 <-- this already works (we used GCC 4.7 some months ago in Guix, but updated later for unrelated reasons)
Try building GCC 4.7 with TinyCC

