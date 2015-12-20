---
title: Deterministic build systems
layout: docs
permalink: /docs/deterministic-build-systems/
---

A software cannot easily be built reproducibly if the source varies
depending on factors that are hard or impossible to control like the
ordering of files on a filesystem or the current time.

Drawing the line
----------------

Which aspect of the build system needs to be made deterministic is
deeply linked to what is defined as part of the
[build environment]({{ "/docs/perimeter/" | prepend: site.basurl }}).

For example, we assume that different versions of a compiler will
produce different output and so usage of a specific
compiler version is mandated as part of the build environment. The same
assumption does not necessarily hold for more simple tools like `grep`
or `sed` where the requirement for the environment can be as loose as
“any recent Unix-like system”.

But it's hardly a good idea to mandate that the system pseudo-random
number generator be initialized with a given value before performing a
build, so better not having randomness affect a build output.

Another concrete example on where to draw the line: there is no need to
care about making the build system give constant output when run in
different build paths when the build path is considered part of the
build environment, and thus requiring rebuilds to be performed in the
same directory as the original build.

In a nutshell
-------------

The basics on how to make a build system deterministic can be summarized
as:

 * Ensure stable inputs.
 * Ensure stable outputs.
 * Capture as little as possible from the environment.

What follows are some advices on common issues that can affect source
code or build systems that make multiple builds from the exact same
source different.

Disclaimer
----------

Not all problems have solutions currently. Some tools that might be used
in a build process might require fixes to become non-deterministic. The
Debian effort keeps a list of [all issues
found](https://reproducible.debian.net/index_issues.html) while
investigating reproducibility problems in its 22,000+ source packages.
While some require changes in the package source itself, some can be
fixed by improving or fixing the tools used to perform the builds.
