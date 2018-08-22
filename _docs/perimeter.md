---
title: What's in a build environment?
layout: docs
permalink: /docs/perimeter/
---

Reproducible builds does not mandate that a given piece of source code
is turned into the same bytes in all situations. This would be
unfeasible. The output of a compiler is likely to be different from one
version to another as better optimizations are integrated all the time.

Instead, reproducible builds happen in the context of a *build
environment*. It usually comprises the set of tools, required versions,
and other assumptions about the operating system and its configuration.
A description of this environment should typically be
[recorded]({{ "/docs/recording/" | prepend: site.baseurl }}) and provided
alongside any distributed binary package.

Requirements
------------

What exactly makes up the build environment is going to be different for
each project. There might even be several build environments for a
single release to accommodate different target operating systems.
But there are some important aspects common to all environments.

It should be **easy to install** a matching build environment on their
system. Ideally it should only be made of free software available on
public Internet sites. The best way to provide the environment is
probably using a documented and easily understood script.

It should be **auditable**. It must be easy to understand what tools are part
of the build environment. And ideally it must be easy to review and rebuild
them.

Content
-------

{% comment %}
XXX: Not really happy with this section. Please help!
-- Lunar
{% endcomment %}

The scope of the build environment needs to be properly
specified as this will determine how much of the build system needs
to be [deterministic]({{ "/docs/deterministic-build-systems/" | prepend: site.baseurl }}).

At least the defined environment has a list of the tools used by the
build process and their versions.

The rest can be different from one project to the next, as long as it
can be reproduced by interested users. To give some examples:

 * specific operating system (if cross-compiling is not supported),
 * build system architecture (if cross-compiling is not supported),
 * directory where the build must happen,
 * name of the user running the build,
 * locale,
 * timezone,
 * specific environment variables (like
   [`SOURCE_DATE_EPOCH`](https://reproducible-builds.org/specs/source-date-epoch/)).

Using virtual machines or containers as the recommended build
environment can make it easier to ensure a specific operating system or
user configuration. But they might also hide some assumptions on the
environment, like specific optimizations enabled because of the [system
CPU type](https://trac.torproject.org/projects/tor/ticket/12238#comment:4).
