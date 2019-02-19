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

CMake notes
-----------
The default configuration of CMake makes the build directory part of the
build environment. Here are some known issues and recommendations:

 * CMake sets a `RPATH` for binaries that link to a library in the the
   same project. Even when this is stripped at installation time, the
   build-id section will be different. Possible workarounds:
   * Users can set
     [`CMAKE_SKIP_RPATH=ON`](https://cmake.org/cmake/help/latest/variable/CMAKE_SKIP_RPATH.html)
     to disable the use of RPATH.
     Disadvantage: programs from the build directory cannot be run without
     setting `LD_LIBRARY_PATH`.
   * Projects can set
     [`CMAKE_BUILD_WITH_INSTALL_RPATH=ON`](https://cmake.org/cmake/help/latest/variable/CMAKE_BUILD_WITH_INSTALL_RPATH.html)
     to ensure a deterministic RPATH.
     Disadvantage: programs from the build directory cannot be run without
     setting `LD_LIBRARY_PATH`.
   * Set
     [`CMAKE_BUILD_RPATH_USE_ORIGIN=ON`](https://cmake.org/cmake/help/latest/prop_tgt/BUILD_RPATH_USE_ORIGIN.html)
     to enable the use of relative directories in RPATH (requires CMake
     3.14). This is an appropriate option for both upstream projects
     and downstream distributions.
 * Qt projects can use [rcc](https://doc.qt.io/qt-5/rcc.html) to embed
   resources such as translations and images. Since Qt 5.8, rcc includes
   the file modification time of source files in the build output.
   This is especially problematic for translation files that are
   generated at build time. Possible workarounds:
   * (Since Qt 5.9) If a project does not rely on an accurate
     [QFileInfo::lastModified](https://doc.qt.io/qt-5/qfileinfo.html#lastModified),
     pass `--format-version 1` to `rcc`. If
     [`AUTORCC`](https://cmake.org/cmake/help/latest/prop_tgt/AUTORCC.html)
     is enabled, this can be done by setting
     [`CMAKE_AUTORCC_OPTIONS`](https://cmake.org/cmake/help/latest/variable/CMAKE_AUTORCC_OPTIONS.html)
     to `--format-version;1`. Upstream projects are encouraged to do
     this after checking that Qt 5.9 or newer is in use.
   * (Since Qt 5.11) Set the `QT_RCC_SOURCE_DATE_OVERRIDE` environment
     variable which behaves similar to
     [`SOURCE_DATE_EPOCH`](https://reproducible-builds.org/specs/source-date-epoch/).
   * (Since Qt 5.13) Set the `SOURCE_DATE_EPOCH` environment variable.
   * Ensure that generated source files are touched with a fixed
     timestamp before rcc is called. See also <https://bugs.debian.org/894476>.
 * Qt projects that use `Q_OBJECT` macros require
   [moc](https://doc.qt.io/qt-5/moc.html) to generate additional C++
   files. CMake will automatically do this when
   [`AUTOMOC`](https://cmake.org/cmake/help/latest/prop_tgt/AUTOMOC.html)
   is enabled, but then the relative path from the build directory to
   the source directory will become part of the build environment.
   For example, if the build directory is `/tmp/build` and the source
   file is at `/tmp/foo/widget.h`, then the generated file will include
   `../[...]/../foo/widget.h`. Possible workarounds:
   * Use the `-p` option to override the include prefix. This requires
     the prefix plus the header filename to be available from the
     include path.
     See also <https://gitlab.kitware.com/cmake/cmake/issues/18815>.
   * Ensure that the build directory and source directory remains fixed
     across builds. For example, if users always create a `build`
     directory in the source tree, then reproducibility won't be
     affected.

Disclaimer
----------

Not all problems have solutions currently. Some tools that might be used
in a build process might require fixes to become non-deterministic. The
Debian effort keeps a list of [all issues
found](https://reproducible.debian.net/index_issues.html) while
investigating reproducibility problems in its 22,000+ source packages.
While some require changes in the package source itself, some can be
fixed by improving or fixing the tools used to perform the builds.
