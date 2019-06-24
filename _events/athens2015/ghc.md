---
layout: new/event_detail
title: Improving the Glasgow Haskell Compiler
event: athens2015
order: 70
permalink: /events/athens2015/ghc/
---

*45-minute session on day 1*

Even before considering reproducible builds, [GHC](https://www.haskell.org/ghc/) has the following problems:

Change in a function causes changes in packages using it due to heavy cross-module inlining (`.hi` files).
It's the same API, but the ABI changes anyway. It's caused by intermediate
format where names are invented, supposed to be unique. A global counter used
for that. Using parallel compilation you get different numbers, sometimes
ending up in interface files. GHC people are working on this because they want
to get interface files stable too, even for partial builds. Stable binary files
are a logical next step.

Debian package for GHC and libraries can be built reproducibly, but using
parallel mode. Other smaller changes exist, e.g. build path, debug sections.
Debian works around these (using a fixed path for the build directory,
predictable file names for temp files). Patches need review by other GHC
developers before they can be merged (the Debian maintainer is also GHC
developer).

But even so Haskell packages on a user's system have to be updated all
together.

Possibly write a tool to renumber random numbers in object files to allow
parallelization again.

diffoscope supports diffing GHC interface files (`.hi`) (using GHC).

OCaml has a similar problem (but perhaps less obvious).

Discussion about rebuilds on Debian caused by Haskell ABI changes, then about other triggers for rebuilds, and associated waste of CPU time, and how to avoid that.

OS X has different tmp directory path every reboot.

Ways to get GHC to NOT include the path to temp files. e.g. pass in a source and build directory as arguments, make GHC only include VARIABLE plus relative paths (and variable replaced by debugger).

Arch Linux observed changes in parallel builds in GHC, to investigate if they are fixed by Debian patches.
