---
layout: new/event_detail
title: Defining Reproducible Builds II
event: berlin2016
order: 200
permalink: /events/berlin2016/reproduciblebuildsdefinitionII/
---

### When is a build "reproducible"?
A build is reproducible if, given the same source code, build environment and
build instructions, any party can recreate bit-by-bit identical copies of all
specified artifacts.

The relevant attributes of the build environment, the build instructions and the
source code, as well as the expected reproducible artifacts, are defined by the
authors. The artifacts of a build are the parts of the build results that are the
desired primary output.

### Examples Section (NOT part of the definition)

Source code is usually a version control checkout at a specific revision or
a source code archive.

Relevant attributes of the build environment would usually include dependencies
and their versions, build configuration flags and some environment variables as
far as they are used by the build system, such as for example, locale. It is
preferable to reduce the set of relevant attributes of the build environment.

Artifacts, for example, would include executables, distribution packages or
filesystem images. They would usually not include a build log or similar
secondary outputs.

The reproducibility of artifacts is verified by bit-by-bit comparison. This is
usually achieved using checksums (better: strong/cryptographically secure hash functions such as implemented in sha256sum; thanks, added. I don't want to specifically mention an algorithm, though).

#### Notes

We've looked at the GNU discussion on the r-b@ list; we think our definition is
a superset.

Not bit-by-bit identical but similar (according to $algorithm) builds shall
henceforth be referred to as "equivalent builds".


## Update 20 December 2016:

Definition published at [https://reproducible-builds.org/docs/definition/](https://reproducible-builds.org/docs/definition/)

<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/reproduciblebuildsdefinitionII_01.jpg" | prepend: site.baseurl }}" alt="Reproducible Builds definition II Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/reproduciblebuildsdefinitionII_02.jpg" | prepend: site.baseurl }}" alt="Reproducible Builds definition II Post-It notes" />
