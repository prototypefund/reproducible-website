---
title: Definition strategies
layout: docs
permalink: /docs/definition-strategies/
---

They are multiple ways to define the build environment in a way that it
can be distributed. The following methods are not exclusive and multiple
aspects can be used for a single project. One can specify a reference
Linux distribution and build a specific compiler version from source.

Defining the build environment as part of the development process has a
very desirable aspect: changes in the build environment can be vetted
like any other changes. Updating to a new compiler version can be
subject to reviews, automatic testing, and in case things
break, rollback.

{% comment %}
XXX: maybe we want to add examples?
{% endcomment %}

Build from source
-----------------

One way to have users reproduce the tools used to perform the build
is simply to have them start by building the right version of these
tools from source.

Using `make` or any other compilation driver, the required tools will be
downloaded, built, and locally installed before compiling the software.

Like any other [inputs from the network]({{ "/docs/volatile-inputs/" | prepend: site.baseurl }}),
the content of the archive should be backed up and verified using
cryptographic checksums.

Reference distribution
----------------------

Using a specific version of free software distribution is another viable
option for a build environment.

Ideally, it should offer stable releases (like Debian, CentOS, or
FreeBSD) to avoid having constant updates to the documentation or
building scripts.

Recording the exact versions of the installed packages might be helpful
to diagnose issues. Some distributions also keep a complete history
of source packages or binary packages available for later
reinstallation.

Virtual machines / containers
-----------------------------

Some aspects of the build environment can be quite simplified by using
virtual machines or containers. With a virtual machine you can
easily perform the build in a more controlled environment. The build
user, system hostname, network configuration, or other aspects can be
enforced easily on all systems.

The downside is that it can introduce a lot of software that has be
trusted somehow. For example, it's currently not possible to install
Debian in a reproducible manner[^reproducible-install]. This makes it
harder to compare different installations.

[^reproducible-install]: Some [preliminary work](https://wiki.debian.org/ReproducibleInstalls) has been done, mainly to identify the issues. Having byte-for-byte identical installations is a requirement to make *live* distributions build in a reproducible manner, so there is some interest by multiple parties in fixing the problem.
