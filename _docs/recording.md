---
title: Recording the build environment
layout: new/docs
permalink: /docs/recording/
---

It is been customary in user facing software to provide a way for
developers investigating bugs to learn how the software has been
built. The “about dialog” or output of `--version` typically contains
information about the build environment.

In the context of reproducible builds, we either actively make aspects
of the [build environment]({{ "/docs/perimeter/" | prepend: site.baseurl }})
irrelevant to the build output, or ensure they are available to rebuild the
software exactly as distributed.

All relevant information about the build environment should either be defined
as part of the development process or recorded during the build process.

## File Format

Everything that is recorded is stored best as a separate build product that can
be easily ignored or distributed separately. This will help identify which
variation is irrelevant to the software itself.

This product is called the 'buildinfo', but its exact format and the way it is
distributed differs across ecosystems.

### [Debian](/who/#Debian)

Debian shares its buildinfo files as plain text files following the
[control file format](https://www.debian.org/doc/debian-policy/ch-controlfields.html),
usually clearsigned with OpenPGP. A detailed description of the expected
fields and values, as well as conventions around naming, can be found under
[ReproducibleBuilds/BuildinfoFiles](https://wiki.debian.org/ReproducibleBuilds/BuildinfoFiles)
on the [Debian wiki](https://wiki.debian.org). Examples can be found on
[buildinfo.debian.net](https://buildinfo.debian.net).

### [Arch Linux](/who/#Arch Linux)

The Arch Linux [makepkg](https://wiki.archlinux.org/index.php/makepkg) build
tool produces a `.BUILDINFO` file consisting of `<key> = <value>` pairs.

Unlike on Debian, this file is not independently signed and distributed, but
included into the package (and thus signed as part of the package signature).
An example can be found by downloading any Arch package built with a recent
version of [makepkg](https://wiki.archlinux.org/index.php/makepkg), such as
[archlinux-keyring](
https://www.archlinux.org/packages/core/any/archlinux-keyring).

### [Tails](/who/#Tails)

Tails does not record a buildinfo file per se, but instead the
[vagrant directory of the main git repo](
https://gitlab.com/Tails/tails/tree/master/vagrant) contains all information
necessary to reproducibly rebuild that revision of Tails.

### JVM

In the JVM ecosystem it is common to distribute libraries as binary (bytecode)
jars uploaded to a repository like [Maven Central](https://search.maven.org/)
or
[Google's Android Repository](https://dl.google.com/dl/android/maven2/index.html).

It is recommended that the buildinfo describing the build environment used for
that official build is published alongside each artifact. Third party
attestations can be shared in a separate sig-repo. For a detailed overview of
the conventions so far see the separate
[JVM page]({{ "/docs/jvm/" | prepend: site.baseurl }}).
