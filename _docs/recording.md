---
title: Recording the build environment
layout: docs
permalink: /docs/recording/
---

It is been customary in user facing software to provide a way for
developers investigating bugs to learn how the software has been
built. The “about dialog” or output of `--version` typically contains
information about the build environment.

In the context of reproducible builds, we either actively make aspects
of the build environment irrelevant to the build output, or ensure they
are mandatory to rebuild the software exactly as distributed.

All irrelevant information should not be recorded. What information is
irrelevant depends on what is defined to be
[part of the build environment]({{ "/docs/perimeter/" | prepend: site.baseurl }}),
but it likely includes information such as date and time of the build, build
system hostname, path, network configuration, CPU type, memory size,
environment variables…

The rest of the build environment should either be defined as part of
the development process or recorded during the build process.

Everything that is recorded is stored best as a separate build product that can
be easily ignored or distributed separately. This will help identify which
variation is irrelevant to the software itself.
