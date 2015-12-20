---
title: Making plans
layout: docs
permalink: /docs/plans/
---

The idea of *reproducible builds* is to empower anyone to verify that no
flaws have been introduced during the build process by reproducing
byte-for-byte identical binary packages from a given source.

Achieving reproducible builds requires cooperation from multiple roles
involved in software production. On small projects, all these roles
might be carried by a single person, but it helps to differentiate the
responsibilities.

Getting a deterministic build system
------------------------------------

In order to allow software to build reproducibly, the source code must
not introduce uncontrollable variations in the build output.

Things will work better if such variations are discovered before users
are confronted with unreproducible binaries. Setting up a test
protocol in which rebuilds are performed under variations in the
environment (aspects like time, *username*, CPU, system version,
filesystems, amongst many others) will greatly help.

Defining a build environment
----------------------------

As different versions of compilation tools are likely to produce
different outputs, users must be able to recreate a build environment
close enough to the original build. It is not required that the
toolchain[^toolchain] itself is byte-for-byte identical, but its
output has to stay the same.

The build environment can either be defined while the software is being
developed or it can be recorded at build time.

Distributing the build environment
----------------------------------

Users need to be able to know what build environment needs to be set up
to rebuild the software.

If the build environment is defined ahead and part of the source code,
then no further steps are required.

In other cases, it needs to be made available alongside the binaries.
The ideal form is a description that can be understood by both humans
and machines to make automatic verification possible, while enabling people
to review that the environment is sane.

Providing a comparison protocol
-------------------------------

Users must have an easy way to recreate the build environment, get the
source code, perform the build, and compare the results.

Ideally, the comparison protocol should be simple to see if resulting
binaries are identical. Comparing bytes or cryptographic hash
values is easy to do and understand.

Other technologies might require removing cryptographic signatures or
ignore specific parts. Such operations must be both documented and
scripted. The rationale and code must be easy to understand by
reviewers.

[^toolchain]: By *toolchain*, we mean all pieces of software needed to create the build output.
