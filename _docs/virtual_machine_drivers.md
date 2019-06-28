---
title: Virtual machine drivers
layout: new/docs
permalink: /docs/virtual-machine-drivers/
---

If the build environment is defined using a reference free operating
system, forcing users to reinstall an entire computer just to reproduce
a build is a lot to ask.

Thankfully, nowadays we have virtual machine and containers which can
give easy access to a wide range of operating systems for little
overhead. Several tools have been designed to help running virtual
machines and containers, some with the explicit goal of reproducible
builds in mind.

Gitian
------

[Gitian](https://gitian.org/) is the tool [used by
Bitcoin](https://github.com/bitcoin/bitcoin/blob/master/doc/gitian-building.md).
It either runs in a Linux container using LXC, or in a virtual machine
using KVM.

Gitian takes
“[descriptors](https://github.com/bitcoin/bitcoin/blob/master/contrib/gitian-descriptors/)”
as input which tell which base GNU/Linux distribution to use, which
packages to install, which Git remotes to fetch, which other input
files to use, and a build script to be run with all of that. As explained
earlier, using a virtual machine helps to get rid of several extra
variations that can happen from one system to the next.  But this is
more complicated to setup for users.

rbm
---

In the [Tor Browser build process](https://trac.torproject.org/projects/tor/wiki/doc/TorBrowser/Hacking#BuildingOfficialTorBrowserReleaseBinaries),
[rbm](https://rbm.torproject.org/) is the tool responsible for
figuring out the components that need to be (re)built, downloading
dependencies, verifying their signatures or checksums, creating container
images with selected packages and starting the build of each component
inside containers using [runc](https://runc.io/).

Docker
------

Making containers easy to setup and use is the problem that Docker is trying to solve.
`Dockerfiles` are used to describe how to create a container, and how
applications can be run in there.

A tool often used in Docker images, `gosu` can be [built reproducibly
using Docker](https://github.com/tianon/gosu/blob/master/Dockerfile).
Using the reference container made available to build Go applications,
it then installs the necessary dependencies, and calls the Go compiler
in that environment which should be pretty much the same all the time.

To be sure that the base compiler is the same, one could use the fact
that Docker images can actually be addressed by a hash of their content.
Another option is to build the Docker image oneself in a reproducible
manner, something that can be done using
[Bazel](https://bazel.io/docs/be/docker.html).

Vagrant
-------

[Vagrant](https://www.vagrantup.com/) is another tool, written in Ruby,
that can run virtual machines with VirtualBox. It can also be used to
get a controlled build environment. The upside of Vagrant and VirtualBox
is that they work on Mac OS X and Windows, and so this might help more
users to actually check that a build has not been tempered with.
