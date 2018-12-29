---
layout: new/default
title: Tools
permalink: /tools/
order: 3
---

# Tools

Several tools are available to make your life easier when working on *reproducible builds*.
[Signed tarballs are available](http://reproducible.alioth.debian.org/releases/).

## diffoscope

[diffoscope](https://diffoscope.org/) will try to *get to the bottom of what
makes files or directories different*. It will recursively unpack archives of
many kinds and transform various binary formats into more human-readable forms
for comparison. It can compare two tarballs, ISO images, or PDFs just as
easily.

See an [example text output](https://diffoscope.org/examples/igerman98_20131206-5.txt).

diffoscope is also [available on PyPI](https://pypi.python.org/pypi/diffoscope).

### trydiffoscope

If you wish to just experiment with [diffoscope](https://diffoscope.org/)
without installing a large number of run-time dependencies, you can use the
[try.diffoscope.org](https://try.diffoscope.org/) service directly from your
web browser. A lightweight command-line client is also [available in
Debian](https://packages.debian.org/sid/diffoscope) and [on
PyPI](https://pypi.python.org/pypi/trydiffoscope).

## disorderfs

Problems with [unstable order of inputs](/docs/stable-inputs/) or other
variations introduced by filesystems can sometimes be hard to track down.
[disorderfs](https://packages.debian.org/sid/disorderfs) is *an overlay FUSE
filesystem that deliberately introduces non-determinism into filesystem
metadata*. For example, it can randomize the order in which directory entries
are read.

## strip-nondeterminism

Some tools used in build systems might introduce non-determinism in ways
difficult to fix at the source, which *requires post-processing*.
[strip-nondeterminism](https://packages.debian.org/sid/strip-nondeterminism)
knows how to *normalize various file formats* such as gzipped files, ZIP
archives, and Jar files. It is written in Perl with extensibility in mind.

## reprotest

[reprotest](https://packages.debian.org/sid/reprotest) builds
the same source code in different environments and then checks the
binaries produced by the builds to see if changing the environment,
without changing the source code, changed the generated binaries.

## Other tools

* [reproducible-build-maven-plugin](https://zlika.github.io/reproducible-build-maven-plugin) for the [Apache Maven](https://maven.apache.org) build tool, popular with Java projects.
* [sbt-reproducible-builds](https://github.com/raboof/sbt-reproducible-builds#readme) plugin for the [sbt](https://www.scala-sbt.org/) build tool, popular with [Scala](https://www.scala-lang.org/) projects.
