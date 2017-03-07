---
layout: event_detail
title: crossdistro
event: berlin2016
order: 250
permalink: /events/berlin2016/crossdistro/
---

see https://pad.riseup.net/p/rb-thu-cross-distro

# Cross-distro

* web infrastructure for searching, sorting
  * don't necessarily need a single database, but maybe the distros share code to run their respective databases
* what's in the buildinfo files

## What's Debian-specific about buildinfo files?

The dependencies are written as NVR - name, version, release - single string
Doc team working on getting buildinfo specification up to the doc page
Debian wiki says half the fields are the output of a deb-* tool
  * But that page is outdated
Architecture names are different, and have slightly different semantics
  * e.g., Fedora has subarchitectures of armhbf - You could build RPMs for just that family, not optimized for any subarchitecture
Considering adding a Known-Signature field to the buildinfo file - You're expected to copy it when you rebuild the RPM, since you don't have the private key to re-sign it

Which fields are necessarily distro-specific?  Which can we ask the distros to conform to a spec?
Arch buildinfo files are included in the package, so they only include things that don't change.  They're not even using RFC822 format.

Signatures: buildinfo files are made at build time, but the RPM is signed later.  So presumably the buildinfo file will include the hash of the unsigned package.  Same package can be signed by different keys; e.g., different keys for each release of Fedora.
Could include two checksums - One signed, one unsigned.

Let's publish a buildinfo spec 1.0, and have people simply try to work to fit into it.  Then come back in a year and revise for 1.1 for whatever couldn't be handled with 1.0.
  * Or is it too early for that?  Some preference to update on a rolling basis to try to get problems addressed sooner.
  * Document what fields are expected to vary across distributions - based on the content of a Distribution field.

## How can cross-distro communication happen?

r-b-general seems to be OK - but needs to be more widely advertised.
  * Docs are going to include a "Get Involved" page aimed at distro folks.  This needs to be part of that.

Problem that all the current r-b infrastructure is hosted on Debian.  In order to get involved, you need to know Debian process: what channels to use, how to file bugs.  It's a barrier to entry.  Documentation could also help with this - although that still leaves a perceptual barrier to entry.  Something Forge-like would be more friendly - Something that consolidates all the work in a single place.  Fedora used to have FedoraHosted; now it has https://pagure.io/.

Some discussion about the usability of bugs.debian.org - Submitting bugs is too hard.

We discuss whether it's practical to get distros building the same thing.  Doesn't seem like it.  Requires too much agreement - compiler default, critical patches, etc. - that isn't worthwhile.

## Generalizing buildinfo tools

What about capturing buildinfo for things like distro Docker images?

Is it possible to write a single tool that knows how to generate buildinfo for a wrapped build process?  e.g., it would know how to capture common information like timestamp, environment variables, etc., and then has hooks for the specific output type it's generating - e.g., it knows how to capture build dependencies of a package, then how to record the build artifact at the end.

Or maybe the right thing to do is to teach different tools to add to an existing buildinfo file over the course of a build process.  This involves extending a lot more tools, but might require less customization per tool.

Some feeling that the process will inevitably be distro-specific which necessarily limits the utility of any general-purpose tool.

Maybe a shared buildinfo validator and parser?  Feel unsure about parsing - People are likely to just build on existing RFC822 parsers.  Some interest in a tool that understands the semantics of the format betterâ€”i.e., if you add this field, you're expected to also add this other field.  (Validator would help in many of the same ways.)

Can share the buildinfo database.  e.g., generalize buildinfo.debian.net.  This part is more complex and less distro-specific, so it seems worthwhile to share.  This also ties in with binary transparency/append-only logs discussion.  Needs to move to r-b.org.

## Cross-distro patch tracking

issues-and-notes.yaml - Stored in a Git repository that lists distro-specific issues
https://maintainer.zq1.de - Bernhard's site that shows the version of a package in each distro, with links to source repos and patch trackers (todo: bug-trackers?)

Unrelated cross-distro MLs
https://lists.linaro.org/mailman/listinfo/cross-distro ARM-specific?

## Gentoo

Gentoo is interested but it's trickier for them because they support so many build options.  Build options should be recorded in the buildinfo file.
There's also a problem that GCC can get different patches that aren't reflected in the revision, so it's harder to record what you're really running.
buildinfo can be useful for Stage 3 binaries.
As a matter of policy, Gentoo packages can change without changing the package version

Does it make sense for buildinfo files to refer to each other?  e.g., this package was built with this version of GCC, here's the buildinfo file for that...
CFLAGS need to be sorted.  Probably best to do that when the buildinfo file is written.  Just pick an order and use that.

-
