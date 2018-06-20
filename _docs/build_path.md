---
title: Build path
layout: docs
permalink: /docs/build-path/
---

Some tools will record the path of the source files in their output.

Most compilers write the path of the source in the debug
information in order to locate the associated source files.

Some tools have flags (like gzip's `-n`) that prevent them from writing
the path in their output. Proposing patches to add a similar feature in
other tools might be sufficiently easy.

In most cases however, post-processing is required to either remove the
build path or to normalize it to a predefined value.

For the specific case of [debug
symbols](https://en.wikipedia.org/wiki/DWARF), there is currently no good
post-processing tool to
change them to a pre-determined value[^debugedit]. A work-around is to
[define the build path as part of the build environment]({{ "/docs/perimeter/" | prepend: site.baseurl }}),
however `reprotest` changes it so this makes it harder to assess reproducibility.
Another work-around is GCC's `-fdebug-prefix-map`, though it does not
fix other sources of irreproducibility such as `__FILE__`, and in some
packages the option itself is saved into other parts of the build
output by another tool.

[^debugedit]: [debugedit](https://fedoraproject.org/wiki/Releases/FeatureBuildId) can replace the path used at build time by a predefined one but it does that by rewriting bytes in place. As this does not reorder the hash table of strings, the resulting bytes are still depending on the original build path.

This is also problematic because this will also apply to intermediate
source files that other tools generate. As they typically will use [random
file names]({{ "/docs/randomness/" | prepend: site.baseurl }}), having a
fixed build path is not enough in such cases.

A
[build-path-prefix-map](https://reproducible-builds.org/specs/build-path-prefix-map/)
specification is in discussion with the GCC developers.
