---
layout: event_detail
title: GPL compliance
event: berlin2016
order: 230
permalink: /events/berlin2016/gpl-compliance/
---


## Using reproducible build information to help GPL compliance

* spectrum of violations in the wild:
  * didn't include license or source - beyond help
  * middle ground: partial source: missing patches, or all dependencies, or build information

- distributors know they need to, want to, but source isn't complete

* compliance with GPL

- GPL defines what's necessary for compliance (Makefiles, other
  scripts for running build tools)

* violators who aren't totally clueless, but don't really care either:

  - incomplete source code: downloaded tarball from upstream, without
    patches or incomplate patches

  - failure to document the full process for build environment
    (e.g. needs to be built from a specific homedir by specific user)

  - shipping full toolchain as a tarball

* using buildinfo files

  - useful documentation for compliance issues

  - distro used to build
  - versions of toolchain
  - locale settings

* gaps

  - distribution level reproducibility has been the focus

  - many violations are on systems that don't even run a traditional
    distro, just a thin layer of binaries

  - move tooling from the distributions into the lower levels
    - gcc to generate a buildinfo file

* we're really not talking about distros necessarily
* provide an SDK
  - include common toolchain for embedded development that generates
    proper reproducibility with .buildinfo or related information
    necessary to build
  - talk to linaro to ensure that their toolchains contains
    reproducibility information
* GCC
  - generate buildinfo files
  - embedding hashes of includes and other build source in binaries
* contacting embedded distros
  - get openembedded, angstrom, etc. using reproducibility toolchains

* source code tarball tool
  - tool that looks at a source release, and .buildinfo and identifies
    missing pieces from the source code

-

