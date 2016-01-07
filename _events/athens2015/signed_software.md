---
layout: event_detail
title: Challenges with signed software
event: athens2015
order: 200
permalink: /events/athens2015/signed-software/
---

*60-minute session on day 3*

Current status:

 - signed binaries
 - NetBSD: source repo
 - Tor: source signed (git tags)
 - Tor Browser: signed binaries (repro), including windows binaries, instruction how to strip signature to compare built binary

Who signs:

 - Tor, Tor Browser:
   - people allowed to sign source
   - others ("builders") allowed to sign binaries
   - different keys
   - Windows, OSX - signatures verified by OS while installing the package
 - distributions - public key for all the packages
 - Debian: repository metadata signed (including package hashes), not the packages

Documentation:

 - provided over HTTPS
 - ship in the packages (Debian)

Signing key storage:

 - Firefox auto updater: signed updates
 - Tor Browser signing keys:
   - sources
   - firefox updates
   - Windows, OS X
   - binaries (packages)
   - most of them are subkeys of master keys (stored offline)
 - FreeBSD: key on build machine, user need to manually verify and add the key
 - Guix: similar to FreeBSD - by default build locally, if you want to use ready binaries, you need to verify and configure the key

Why and what next:

 - signed binaries: for mirroring
 - Guix: build locally and compare with mirrored
 - Nix: plan to use multiple signatures on binaries and trust only one signed by at least N of M trusted set
 - P2P for comparing binaries with others and download from nearest (if other trusted parties reports the same binaries)

Threat model:

 - build system compromise detection
 - paper about update process attacks
 - in Debian - developer compromise (because they are building the packages and uploading binaries)

binaries transparency log:

 - append only log with assertions that "developer X built reproducibly package
   Y (with source hash) and the result binaries are Z (with such hash)"
 - user can download that assertions and expect at least few of them to trust
   the binaries


`curl | bash` is almost the same as downloading `something.tar.gz` and compiling it—you still haven't verified that the code isn't modified and/or malicious.

Source code signing is for accountability. And makes code review meaningful—you may make sure exactly what code was audited.


GitHub might introduce interface for signaling the code is signed to encourage developers.


Status of verification of different paths:

 - binaries → users: mostly solved
 - source pkgs → binary packages → reproducible builds
 - developer → source code (tarballs/git) → mostly not solved currently, only few projects sign their code
 - code auditing - also not solved problem
