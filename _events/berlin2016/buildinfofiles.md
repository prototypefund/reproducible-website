---
layout: event_detail
title: buildinfofiles
event: berlin2016
order: 90
permalink: /events/berlin/2016/buildinfofiles/
---

= early work

a goal was to minimise the conditions needed to reproduce a binary

buildinfo would be a formula to reproduce a build - it should be small as possible

they don't/can't describe every possible input - build process is affected by obscure things or external, variable factors

1. buildinfo files:
record inputs to the build that produced the output - so that you can recreate its state

2. analysis of buildinfo and outputs:
as more builders provide buildinfo files, we can look for intersections (reproducible binaries), and causes of any differences (non-reproducibility)

should contain the minimal information needed to produce a given binary

3. the ideal (reproducible) build would depend only the source code and build dependencies

buildinfo should be small, compact, and easily distributable


= they might contain:

source package (name, version, hash?)
binaries produced (name, arch, checksums)
build dependencies (recursively)
build path (until recently?)
environment variables (since recently?)

in Debian, buildinfo is a separate file
in Arch Linux, buildinfo is included in the package files (but signatures are detached)


= consuming and aggregating buildinfo files:

in Debian, buildinfo files are used when:
  * DD uploads a package
  * debian-ftp system distributes packages
  * end-user installs packages

and now we also realised:
  * rebuilders
  * buildinfo distributors


= further work

we want to collate and distribute buildinfo files from external parties too;
not just those from Debian developers and the official builds

collecting and distributing those, is a quite different task than just distributing buildinfo from Debian's official builds

lamby's buildinfo.debian.net already collects and distributes some non-official buildinfo files

we will need to write tools making it easy to test reproducibile and submit buildinfo,
and tools to retrieve buildinfo files/signatures when installing

signed buildinfos save people from having to build every package themselves -
it gives them sufficient confidence to trust pre-built binaries


= ongoing concerns

buildinfo files should to be detailed enough to explain the causes of non-reproducibility
but too much information ($HOME, hostname, installed packaged versions)

argument arose that a normalised build environment evoids lots of reproducibility issues,
like build path, environment etc. affecting the build
whilst that would be easier, some of us think that is really a bug in the software that ought to be fixed

in the extreme case, 

when a build-dependency affects an output binary, we may need to generate a new set of buildinfo files
describing that situation

-
