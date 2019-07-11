---
title: Badges
layout: docs
permalink: /docs/badges/
---

When you have set up reproducible builds for your project, you can announce
this by adding a 'badge' to your project page. We have badges for various
'levels' of reproducible builds support:

* Plain
* Bronze
* Silver
* Gold

'Plain' is the maximum level you can achieve when you leave it up to
distributors (e.g. Linux distributions) to create packaged artifacts. When you
publish artifacts yourself, the other levels come into play.

## Advantages

| |B|S|G| |
|-|-|-|-|-|
|v|v|v|v|everything is set up so distributors can secure their pipeline|
| |v|v|v|artifacts tainted by compromised build infrastructure will be detected|
| |v|v|v|end-users can verify the artifacts (by rebuilding)|
| | |v|v|end-users can verify the artifacts (by checking trusted attestations)|
| | | |v|artifacts tainted by compromised distribution infrastructure will be detected|

## Requirements

| |B|S|G| |
|-|-|-|-|-|
|v|v|v|v|you have a [deterministic build system](plans.md#getting-a-deterministic-build-system)|
| |v|v|v|artifacts you publish can be rebuilt and verified|
| |v|v|v|the project makes sure published package for each release is verified|
| |v|v|v|end-users can verify the published artifacts by rebuilding them themselves|
| | |v|v|infrastructure is in place for end-users to share attestations|
| | | |v|infrastructure is in place for end-users to automatically verify attestations when fetching the artifacts|

When adding a badge, it is recommended that it links to:

* Plain: documentation on how to build your project reproducibly
* Bronze: documentation on how to rebuild and verify artifacts
* Silver: documentation on how to check attestations, and how to rebuild and share your own
* Gold: documentation on how to configure your system to automatically verify attestations when fetching the artifacts|
