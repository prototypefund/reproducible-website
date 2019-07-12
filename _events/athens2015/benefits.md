---
layout: event_detail
title: Communicating benefits of reproducible builds
event: athens2015
order: 40
permalink: /events/athens2015/benefits/
---

*45-minute session on day 1*

Some benefits have been written down on [reproducible-builds.org](https://reproducible-builds.org/docs/buy-in/) and the [Debian Wiki](https://wiki.debian.org/ReproducibleBuilds/About).

What came during the discussion:

 * Faster development times:
   + Through caching of intermediate build products.
   + In FreeBSD packages are rebuilt weekly and unreproducible packages get reuploaded every time.
 * Investigate whether the source changes are reflected in associated changes in the binary.
 * Validation of cross compilers (slow arches can be cross compiled).
 * Recreation of debug symbols at later times.
 * Able to trace build while making sure that tracing didn't influence the build.
 * Recognize changes made to the build output at run time (e.g. switching file content at runtime by evil kernel module)
 * Gambling industry.
 * Volkswagen scandal follow-up: proof that software running in the car is coming from the audited source.
 * Three broad categories (afffected people):
   + Software developers
   + Distro developers
   + End users
     - Paranoid users
     - Journalist using Tails
     - Update deltas are smaller or don't exist in the first place
   + Managers
     - Trust fewer people (developers only push checksums and builder builds)
     - Faster development times (through caching)
     - Save money and time
     - Accountability
     - Counter argument for the argument free software is unreliable
 * Myths and counter arguments:
   + Timestamps, username, hostname in documentation etc are useful.
     - That audit trail is not needed anymore with reproducible builds.
   + Reproducible builds are hard and/or impossible.
     - 19,000 packages are reproducible.
   + Hard to check whether software is reproducible.
