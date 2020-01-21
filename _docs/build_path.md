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
Certain compiler flags can work around the issue:

 * [`-fdebug-prefix-map=OLD=NEW`](https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html#index-fdebug-prefix-map)
   can strip directory prefixes from debug info.
   (available in all GCC versions, Clang 3.8)
 * [`-fmacro-prefix-map=OLD=NEW`](https://gcc.gnu.org/onlinedocs/gcc/Preprocessor-Options.html#index-fmacro-prefix-map)
   is similar to `-fdebug-prefix-map`, but addresses irreproducibility due to
   the use of `__FILE__` macros in `assert` calls for example.
   (available since GCC 8 and [Clang 10](https://bugs.llvm.org/show_bug.cgi?id=38135))
 * `-ffile-prefix-map=OLD=NEW` is an alias for both `-fdebug-prefix-map` and
   `-fmacro-prefix-map`.
   (available since GCC 8 and [Clang 10](https://bugs.llvm.org/show_bug.cgi?id=38135))

With dpkg >= 1.19.1, first shipped with Debian Buster, packages can enable the
`-ffile-prefix-map=OLD=NEW` flag by adding the `fixfilepath` [build
flag](https://manpages.debian.org/dpkg-buildflags.1) to their `debian/rules`
file. For example:
```
export DEB_BUILD_MAINT_OPTIONS = hardening=+all reproducible=+fixfilepath
```


Note that some packages save the compile options in the build output.

[^debugedit]: [debugedit](https://fedoraproject.org/wiki/Releases/FeatureBuildId) can replace the path used at build time by a predefined one but it does that by rewriting bytes in place. As this does not reorder the hash table of strings, the resulting bytes are still depending on the original build path.

This is also problematic because this will also apply to intermediate
source files that other tools generate. As they typically will use [random
file names]({{ "/docs/randomness/" | prepend: site.baseurl }}), having a
fixed build path is not enough in such cases.

A
[build-path-prefix-map](https://reproducible-builds.org/specs/build-path-prefix-map/)
specification is in discussion with the GCC developers.
