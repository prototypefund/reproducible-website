---
layout: event_detail
title: How to fix the current issues with BUILD_PATH_PREFIX_MAP?
event: berlin2017
order: 70
permalink: /events/berlin2017/buildpathprefixmap/
---

Problem: build paths get injected during compilation.

* one commmon scenario is embedding debugging information in C.
* next most common are __FILE__ macros and assert()
* gcc's -fdebug-prefix-map is almost a solution, but…
* command line options used were also embedded in the debugging information, so the use of -fdebug-prefix-map with a path-specific string itself introduced a variation.
* we convinced gcc to not store -fdebug-prefix-map.

But this still doesn't solve __FILE__ and it doesn't solve other systems outside of gcc that also embed the build path.

So we have the BUILD_PATH_PREFIX_MAP proposal: an environment variable with a list of pathname prefixes that should be substituted for some other string, in all places, including debug symbols, __FILE__, and assert(). And if anything else ever intends to embed the full path the the source files, it should respect it as well.

For example:

----
BUILD_PATH_PREFIX_MAP=$(pwd)=. make
----
Would strip the top-level directory from all stored paths, and replace it with "."

maps are proposed as colon-delimited, so you can provide more than one of them.

We had some brief discussion around the similarity of the BUILD_PATH_PREFIX_MAP proposal with SOURCE_DATE_EPOCH:

* they're both environment variables
* they both have clearly established semantics of how we want build systems to transform/stabilize certain forms of ephemeral data
* in many situations, the goal is for the build system to not need either env var, because the ephemeral data in question simply isn't a part of the build process at all.

We currently have patches oustanding for gcc and golang. We don't think that anyone has even asked clang for support yet.
R (and some other compilers?) doesn't need BUILD_PATH_PREFIX_MAP because it already has a notion of the root of the source tree.

gcc is reluctant to accept the patches for the environment variable -- they apparently don't want magic options to change the build! so their concerns align with ours in some way, but the thinking about how to address the concerns are different.

Instead, gcc upstream wants to add a command-line flag, something like -path-prefix-map as a generalization of -fdebug-prefix-map (i.e. it would include __FILE__ and assert())

dpkg would need to add this option (to $(CFLAGS)?) for each package build, but this actually doesn't solve our problems for packages that themselves embed the gcc build options (same problem again as -fdebug-prefix-map :(

Do we have stats for how many packages would be affected by this problem? Ximin did some analysis and suggests it's about 1800 packages whose reproducibility would be fixed.

another approach mooted was updating a "spec file" for gcc -- debian gcc

maintainer is reportedly not keen on spec files, so this wasn't discussed further.

some discussion on why we don't just fix the build path during build: we want people to be able to do rebuilds without any special privileges on their build system. this makes reproducibility testing easier and cheaper, and it also demonstrates that things we know to be unrelated to the build are not actually included in the build.

Current plan is for Ximin to submit a series of three patches to gcc:

1) patch for command line flag that has map (exactly what they asked for)
2) second command-line flag that says "read this env var" and use it for the value of the flag
3) default flag to true.

then if they accept only (1) then we can ship a wrapper around gcc that reads the env var, and we can configure dpkg to invoke the
wrapper. this setting would need to be done specifically for the packages that need it (<1800 packages). We'd do that by modifying $PATH for those specific packages.

netbsd has been building their base system 100% reproducibly for two years. we need to research what they're doing further. It's possible that their base system doesn't have any __FILE__ or assert(). Or its possible that they're fixing the build path.

Qubes currently uses a fixed build path, but would be interested in being able to avoid that.

Vagrant proposes putting literal string '$VARNAME' as argument for -path-prefix-map, so gcc could then call getenv() internally. This would result in a static argument passed to the compiler (so it is reproducible even on systems that embed the arguments to gcc)

Followup discussions/hacking proposed:

* investigate what netbsd is doing.

