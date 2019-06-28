---
layout: default
title: Tools
permalink: /tools/
order: 4
---

# Tools

<p class="lead">Several tools are available to make your life easier when working on reproducible builds.</p>

[Signed tarballs are available](http://reproducible.alioth.debian.org/releases/).

## diffoscope

[diffoscope](https://diffoscope.org/) will try to get to the bottom of what
makes files or directories different. It will recursively unpack archives of
many kinds and transform various binary formats into more human-readable forms
for comparison. It can compare two tarballs, ISO images, or PDFs just as
easily. See an example
[HTML](https://diffoscope.org/examples/https-everywhere-5.0.6_vs_5.0.7.html)
and [text](https://diffoscope.org/examples/igerman98_20131206-5.txt) output.

<a href="https://diffoscope.org/" class="btn btn-outline-primary btn-sm">Homepage</a>
<a href="https://salsa.debian.org/reproducible-builds/diffoscope" class="btn btn-outline-primary btn-sm">Git</a>
<a href="https://salsa.debian.org/reproducible-builds/diffoscope/issues" class="btn btn-outline-primary btn-sm">Issues</a>
<a href="https://salsa.debian.org/reproducible-builds/diffoscope/merge_requests" class="btn btn-outline-primary btn-sm">Merge requests</a>
<a href="https://packages.debian.org/sid/diffoscope" class="btn btn-outline-primary btn-sm">Debian package</a>
<a href="https://pypi.python.org/pypi/diffoscope" class="btn btn-outline-primary btn-sm">PyPI</a>

### trydiffoscope

If you wish to just experiment with [diffoscope](https://diffoscope.org/)
without installing a large number of run-time dependencies, you can use the
[try.diffoscope.org](https://try.diffoscope.org/) service directly from your
web browser. A lightweight client is also available as the `trydiffoscope`
command-line utility.

<a href="https://try.diffoscope.org/" class="btn btn-outline-primary btn-sm">Homepage</a>
<a href="https://salsa.debian.org/reproducible-builds/trydiffoscope" class="btn btn-outline-primary btn-sm">Git</a>
<a href="https://salsa.debian.org/reproducible-builds/trydiffoscope/merge_requests" class="btn btn-outline-primary btn-sm">Merge requests</a>
<a href="https://packages.debian.org/sid/trydiffoscope" class="btn btn-outline-primary btn-sm">Debian package</a>
<a href="https://pypi.python.org/pypi/trydiffoscope" class="btn btn-outline-primary btn-sm">PyPI</a>

## disorderfs

Problems with [unstable order of inputs](/docs/stable-inputs/) or other
variations introduced by filesystems can sometimes be hard to track down.
disorderfs is an overlay FUSE filesystem that deliberately introduces
non-determinism into filesystem metadata. For example, it can randomize the
order in which directory entries are read.

<a href="https://salsa.debian.org/reproducible-builds/disorderfs" class="btn btn-outline-primary btn-sm">Git</a>
<a href="https://salsa.debian.org/reproducible-builds/disorderfs/merge_requests" class="btn btn-outline-primary btn-sm">Merge requests</a>
<a href="https://packages.debian.org/sid/disorderfs" class="btn btn-outline-primary btn-sm">Debian package</a>

## strip-nondeterminism

Some tools used in build systems might introduce non-determinism in ways
difficult to fix at the source, which requires post-processing.
`strip-nondeterminism` knows how to normalise various file formats such as
gzipped files, ZIP archives, and Jar files. It is written in Perl with
extensibility in mind.

<a href="https://salsa.debian.org/reproducible-builds/strip-nondeterminism" class="btn btn-outline-primary btn-sm">Git</a>
<a href="https://salsa.debian.org/reproducible-builds/strip-nondeterminism/issues" class="btn btn-outline-primary btn-sm">Issues</a>
<a href="https://salsa.debian.org/reproducible-builds/strip-nondeterminism/merge_requests" class="btn btn-outline-primary btn-sm">Merge requests</a>
<a href="https://packages.debian.org/sid/strip-nondeterminism" class="btn btn-outline-primary btn-sm">Debian package</a>

## reprotest

reprotest builds the same source code in different environments and then checks
the binaries produced by the builds to see if changing the environment, without
changing the source code, changed the generated binaries.

<a href="https://salsa.debian.org/reproducible-builds/reprotest" class="btn btn-outline-primary btn-sm">Git</a>
<a href="https://salsa.debian.org/reproducible-builds/reprotest/merge_requests" class="btn btn-outline-primary btn-sm">Merge requests</a>
<a href="https://packages.debian.org/sid/reprotest" class="btn btn-outline-primary btn-sm">Debian package</a>

## Other tools

* [reproducible-build-maven-plugin](https://zlika.github.io/reproducible-build-maven-plugin) for the [Apache Maven](https://maven.apache.org) build tool, popular with Java projects.
* [sbt-reproducible-builds](https://github.com/raboof/sbt-reproducible-builds#readme) plugin for the [sbt](https://www.scala-sbt.org/) build tool, popular with [Scala](https://www.scala-lang.org/) projects.
