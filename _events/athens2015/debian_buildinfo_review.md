---
layout: event_detail
title: Review of Debian .buildinfo file
event: athens2015
order: 130
permalink: /events/athens2015/debian-buildinfo-review/
---

*50-minute session on day 2*

What we wanted to address:

 * What should we have in the build info file?
 * What currently affects the build but isn't documented?
 * What explictily shouldn't affect the build and should we record that?

We ran through the existing `.buildinfo` specification and found a lot of terms
which meant different things to different people. “Architecture” is assumed to
be the target architecture—and there is confusion between target and host
(since we could be building a cross compiler package, which has a different
build, host and target). Bazel also call the destination architecture the
“host”.

The `Binary` field is potentially useful but not necessary to reproduce; it
lists intermediate stages to the actual build result (the set of `.deb` packages)

josch pointed out that packages can have different source version and target
versions, and the current field `Version` is not clear.

HW42 suggested that checksums should be added to the dependency information.
At the moment, on Debian, a package may be rebuilt by the reproducible builds
CI system and produce a different result to before because of changes to its
dependencies, so the package name, arch and version do not uniquely identify an
exact dependency binary.

Installation order of dependency packages doesn't *appear* to be recorded—the
list of depedencies is in alphabetical order, and there are ways the
installation order of dependency packages could affect the build environment.

There are two camps here—either we fix the order (to make reproduction easier)
or we randomize it (to pick up errors caused by installation order).

A hash of the entire filesystem which is about to be used to build the system,
after installation of dependencies, is the most generic record of the build
environment and we don't record that. Should we? It will of course vary
according to the filesystem used unless that is standardised.

We also noted that the buildinfo file performs two functions at the moment—it
is both a record of the environment used to build, and a specification for
others. Is it sensible to keep both functions in the same file, or should we
decide on one function? There will be some information which is common to both.
