---
layout: new/event_detail
title: Use cases for reproducible builds
event: athens2015
order: 100
permalink: /events/athens2015/use-cases/
---

*50-minute + 10-minute session on day 2*

Use cases & success stories for build reproducibility:

# Benefits

 - Google: Confidence that what runs in production is actually what it is supposed to be
 - Tor: Reduces pressure on single developer in control of the signing keys, helps against powerful adversaries
 - Reproducible builds reduce developers' risk of being forced by law enforcement into creating malicious binaries
 - Google: Build reproducible allows cache sharing and increases build speed tremendously (99% cache hits, associated with actual $$$ value), simplifies debugging because builds can be re-done and discrepancies easily discovered
 - F-Droid: Reasonable easy secure release build process, builds can be easily verified with different machines. This increases confidence in the apps. Even for closed source apps, this allows developers to verify that the copy on Google Play is the same than you intended it to be.
 - NixOS: Ability to have decentralized continuous build system, build infrastructure can be distributed. Tests are a big topic, because they're not always reproducible; re-running tests can possibly be avoided if the binaries are exactly those that have previously been tested. Reproducibility enables purely functional package management, which avoids implicit dependencies (e.g. on the environment).
 - Debian: Reproducible builds enable small delta updates, particularly if there is no delta. If toolchain changes don't change the binary re-testing can be avoided and changes can be reviewed.
 - MacPorts: Reproducibility can provide confidence that a build on a user's machine produces what was intended by the packager; this reduces the support burden.
 - Core Boot (bootloader) & Seabios: gain assurance of what's running at the lowest layers of your stack, and it runs in system management mode so it has full access.
 - Reproducibility can be a legal requirement for some software (e.g. gambling or voting [citation needed])
 - Reproducibility allows verification that the binary actually corresponds to the source code.
 - Signing Code is just as secure as your key management, but key management is hard. Reproducibility can improve that.
 - iOS Apps are encrypted by Apple, so you cannot easily verify that what Apple distributes is actually what the developer wanted.
 - Third parties should be able to verify source <-> binary correspondence. This could be offered as a service for companies or done by volunteers who would then certify that a binary correspond to the source.
 - Companies with long product cycles want to be able to bit-by-bit reproduce a binary in ten years time and heavily care about binary delta size. This allows to avoid storing the build results for the duration of the product cycle.

# Categories of Benfits

 - Financial Benefits
 - Security Benefits
 - Reduction of Responsibility on Single Developers
 - Infrastructure Benefits
 - Reduction of External Trust

Putting this on reproducible-builds.org should be probably be done by categorizing it by target audience, i.e. benefits for users, for developers, for companies.
