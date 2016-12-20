---
title: Definitions
layout: docs
permalink: /docs/definition/
---

## When is a build reproducible?
A build is **reproducible** if given the same source code, build environment and
build instructions, any party can recreate bit-by-bit identical copies of all
specified artifacts.

The relevant attributes of the build environment, the build instructions and
the source code as well as the expected reproducible artifacts are defined by
the authors or distributors. The artifacts of a build are the parts of the
build results that are the desired primary output.

## Explanations
**Source code** is usually a checkout from version control at a specific revision or
a source code archive.

**Relevant attributes of the build environment** would usually include dependencies
and their versions, build configuration flags and environment variables as
far as they are used by the build system (eg. the locale). It is
preferable to reduce this set of attributes.

**Artifacts** would include executables, distribution packages or
filesystem images. They would not usually include build logs or similar
ancillary outputs.

The reproducibility of artifacts is **verified** by bit-by-bit comparison. This is
usually performed using cryptographically secure hash functions.

**Authors or distributors** means parties that claim reproducibility of a set of
artifacts. These may be upstream authors, distribution maintainers or any other
distributor.
