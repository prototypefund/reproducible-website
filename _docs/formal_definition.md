---
title: Formal definition
layout: docs
permalink: /docs/formal-definition/
---

Most free software distribution are self-contained: all tools required
to build its component are part of the distribution. In such cases, it's
possible to specify the build environment in a machine readable format
that can be later used to reinstall the environment.

As example, the [.buildinfo control files used by
Debian](https://wiki.debian.org/ReproducibleBuilds/BuildinfoSpecification)
tie in the same file: the sources, the generated binaries, and all
packages used to perform the build (with the exact version number).
