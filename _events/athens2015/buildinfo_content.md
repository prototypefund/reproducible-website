---
layout: event_detail
title: What should be in a build info file?
event: athens2015
order: 170
permalink: /events/athens2015/buildinfo-content/
---

*50-minute session on day 3*

**Absolutely necessary** "human intent"

 - embedded certificates if needed (rpm + tor windows)
 - source pkg. version
 - source pkg hash (contents)
 - source package name
 - architecture (target) (GNU host)
 - build instruction (deb-implicit)
 - USE flags (gentoo). debian: build profile. build time configuration
 - build-depends. Abstract description of some tool that (fully) defines
 - Build-Depends. Source Name/version
 - Build-depends. Source packages' HASH!!! (contents) complicated but worth it for D.D.C.

*Center of the poster*

 - order of pkg installation (deb-missing)

*Going ahead, left half of the poster, from center to Too Specific-side*

 - kernel version
 - Architecture (build) (Bazel host)

**Too Specific** "happenstance"

 - state of filesystem
 - host name
 - username
 - full env.
 - default shell
 - Build iteration #
 - eye colour, height and hair length of the person who built the thing
 - build path
 - timestamp (`SOURCE_DATE_EPOCH`)

Poster 2
--------

**Purposes of build info**

 1. document what pkg builder did
 2. reproduce build environment
 3. input to system to find minimum set req. for reproducibility
 4. fore debugging non-reproducibility
 5. forensics

Misc.
-----

The Debian `.buildinfo` specification includes things across the spectrum.
Build path and build architecture, for example, should not affect the outcome
but is included.

Hashes of the source (and build options) of dependencies are seen as more desirable than hashes of the binaries of dependencies, although Debian will probably continue to use hashes of binaries.

It may be useful to put the fields that are required into the source package. E.g. “nethack requires build-path to be reproducible”

Purposes of buildinfo:

* Document what the package builder did
  * Provide debugging non-reproducibility
* Reproduce the build environment
* Figure out the minimum amount of information necessary: as input to a system that finds the minimum required set.

Must buildinfo be signed? Most people seem to think that we should recommend signing but not make it essential.

Output will also be an optional thing in the results specification. Debian currently supply output hashes of packages. This can't be directly compared with another distribution's output, but the hashes can be used to find a specific package binary which can then be extracted and the contents compared.
