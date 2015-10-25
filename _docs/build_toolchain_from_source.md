---
title: Building from source
layout: docs
permalink: /docs/build-toolchain-from-source/
---

Building the tools that make the environment from source is one way to
allow user to reproduce it. Using source directly makes it easier to
rely on new features, and easily works on a variety of platforms. It
might not scale well for a long list of dependencies, and asking users
to rebuild GCC for every piece of software they use might make them
slightly unhappy.

What follows are suggestions on how to handle building the compilation
tools from source.

Building using external resources
---------------------------------

The source for the different components can be retrieved from online
repository. Using release tarballs might be preferable as they are
easier to cache, [mirror, checksum and verify]({{
"/docs/volatile-inputs/" | prepend: site.baseurl }}). When retrieving
the source from a version control system repository, it's best to have a
precise reference to the code version. With Git, using a tag with a
verified signature or a commit hash will work best.

The compilation itself can be driven by shell scripts or an extra target
in the project `Makefile`.

Coreboot is a good example. The build documetation mandates to first run
`make crossgcc` before building Coreboot itself.

Check-in everything
-------------------

Another approach is to check the source of the entire toolchain in the
project's version control system.

This is how several integrated operating systems like *BSD are
developped. “Building the world” will start by building the toolchain in
the version control system before building the rest of the system.

It's also how it is done for Google's internal projects. They have
released [Bazel](http://bazel.io/) which is based on their
internal compilation tool. Bazel is designed to drive such large scale
builds with speed and reproducibility in mind.

Outside of fully integrated operating systems or corporate environment,
it might be hard to push the idea of adding ten or more times the actual
code base in toolchain…

Ship the toolchain as a build product
-------------------------------------

As it might be hard to ask every user to spend time rebuilding a whole
toolchain, OpenWrt gives a good example of a middle middle ground. An
“SDK” that can be downloaded alongside the system images which
contains everything that is needed to build—or rebuild—extra packages.

In that case the SDK becomes another build product, and it has to be
possible to build it reproducibly.
