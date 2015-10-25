---
title: Build path
layout: docs
permalink: /docs/build-path/
---

Some tools will record the path of the source files in their output.

Most compilers will write the path of the source in the debug
information in order to locate the associated source files.

Some tools have flags (like gzip's `-n`) that will prevent them to write
the path in their output. Proposing patches to add similar feature in
other tools might be sufficiently easy.

But in most cases, post-processing will be required to either remove the
build path or normalize it to a predefined value.

For the specific case of [DWARF
symbols](https://en.wikipedia.org/wiki/DWARF), there is currently no good
tool to
change them after a build to a pre-determined value[^debugedit]. A work-around is to
[define the build path as part of the build environment]({{
"/docs/perimeter/" | prepend: site.baseurl }}).

[^debugedit]: [debugedit](https://fedoraproject.org/wiki/Releases/FeatureBuildId) can replace the path used at build time by a predefined one but it will do it by rewriting bytes in place. As this does not reorder the hash table of strings, the resulting bytes will still be different depending on the original build path.

This is also problematic because this will also apply to intermediate
source file that other tools generate. As they typically will use [random
file names]({{ "/docs/randomness/" | prepend: site.baseurl }}), having a
fixed build path will not be enough in such cases.
