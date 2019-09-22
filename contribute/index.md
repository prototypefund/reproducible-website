---
layout: default
title: Contribute
permalink: /contribute/
order: 1
---

# Contribute


## Get involved

First, please join the [rb-general general mailing-list](https://lists.reproducible-builds.org/listinfo/rb-general).

IRC discussions happen in the `#reproducible-builds` channel on [irc.oftc.net](https://www.oftc.net/).

* [Join the Reproducible Builds group]({{ "/contribute/salsa/" | prepend: site.baseurl }})
  on [Salsa](https://salsa.debian.org/) to contribute directly on our Git
  repositories.

* Subscribe to the [reproducible-builds@lists.alioth.debian.org mailing list](https://lists.alioth.debian.org/mailman/listinfo/reproducible-builds)
  and/or other [reproducible builds](https://lists.reproducible-builds.org/)
  oriented lists.

* Join the [#reproducible-builds IRC channel on OFTC](https://webchat.oftc.net/?channels=#reproducible-builds)
  and possibly [#debian-reproducible](https://webchat.oftc.net/?channels=#debian-reproducible)
  too.

* You can also subscribe to
  [commit notifications](https://lists.reproducible-builds.org/listinfo/rb-commits).

## Task suggestions

1. If you maintain a package for Debian, you can make sure that your package
   uses a [modern debhelper style](https://salsa.debian.org/debian/debhelper/blob/master/dh)
   (e.g. one-liner `debian/rules` with overrides as needed). We aim to fix many
   causes of non-deterministic builds in the debhelper suite directly, so
   packages that use debhelper will be much easier to make reproducible with
   just an upgrade of the toolchain.

1. [Inventory issues](#inventorying-issues) found by the continuous integration
   platform.

1. [Fix known reproducibility issues](#fixing-issues). See the
   [inventory of identified issues](https://reproducible.debian.net/index_issues.html).

1. Improve our common [tools]({{ "/tools/" | prepend: site.baseurl }}):
   [diffoscope](https://tracker.debian.org/diffoscope),
   [strip-nondeterminism](https://tracker.debian.org/strip-nondeterminism),
   [disorderfs](https://tracker.debian.org/disorderfs).

1. Redesign [reproducible.debian.net](https://reproducible.debian.net/) status
   pages using a CSS toolkit like Bootstrap.

1. Enhance [dak](https://tracker.debian.org/dak)
   [support for .buildinfo](https://bugs.debian.org/763822).

1. Research how to run rebuilds on ''buildd''s.

1. Research on how change dak to only accept packages after multiple matching
   builds.

1. Hack binNMU infrastructure (dak?) so `.dsc` for binNMUs are kept in the archive
   instead of being thrown away.

To get help, feel free to ask on the IRC channel or the mailing list. We want
to be friendly, supportive, and have fun experimenting together.

## How to report bugs in Debian

[Overview of all bug reports concerning reproducible builds](https://bugs.debian.org/cgi-bin/pkgreport.cgi?usertag=reproducible-builds@lists.alioth.debian.org)

All bugs relevant to the reproducible builds project should use
[usertags](https://bugs.debian.org/usertags) with user
`reproducible-builds@lists.alioth.debian.org`. Also use `X-Debbugs-Cc` to
notify the list, but please use our `reproducible-bugs@lists.alioth.debian.org`
list for this header.

To usertag a bug after it has been submitted use:

    bts user reproducible-builds@lists.alioth.debian.org . usertag XXXXXX + timestamps toolchain

### Usertags

* **toolchain**: affects a tool used by other package build systems

* **infrastructure**: affects the whole Debian infrastructure or policies

* **timestamps**: time of build in recorded during the build process

* **fileordering**: build output varies with readdir() order

* **buildpath**: path of sources is recorded during the build process

* **username**: username is recorded during the build process

* **hostname**: hostname is recorded during the build process

* **uname**: uname output is recorded during the build process

* **environment**: environment variables are recorded during the build process

* **randomness**: some build aspects are dependent on (pseudo-)randomness

* **cpu**: some build aspects are dependent on CPU features or computation speed

* **signatures**: uses a cryptographic signatures as part of the build process

* **umask**: permissions depend on current umask

* **buildinfo**: issues related to .buildinfo control files

* **ftbfs**: fails to build from source

* **locale**: varying locales lead to differing behavior (e.g. sorting)

### Example email to submit a patch:

```
From: J. Random Hacker &lt;jrhacker@example.org&gt;
To: submit@bugs.debian.org
Subject:

Source:
Version: <VERSION>
Severity: wishlist
Tags: patch
User: reproducible-builds@lists.alioth.debian.org
Usertags: timestamps fileordering
X-Debbugs-Cc: reproducible-bugs@lists.alioth.debian.org

Hi!

While working on the “reproducible builds” effort [1], we have noticed
that

The attached patch removes extra timestamps from the build system and
ensure a stable file order when creating the source archive. Once applied,
it can be built reproducibly in our current experimental framework.


 [1]: https://wiki.debian.org/ReproducibleBuilds
```

## Inventorying issues

The easiest way to find issues is to examine the list of
[packages failing to build reproducibly](https://reproducible.debian.net/index_FTBR.html)
as found by continuous integration. The first packages in the list are the one
who have been tried most recently.

Notes about packages are kept in the
[notes](https://salsa.debian.org/reproducible-builds/reproducible-notes). Git repository
in `packages.yml`. The list of [known common issues](https://reproducible.debian.net/index_issues.html)
is kept in the `issues.yml` file.

The page for a given package should open on the
[diffoscope](https://tracker.debian.org/diffoscope) output. Read the list of
known issues to get an idea of what you may found. Here is some more advice:

* When a binary has mismatching mtimes for files in `control.tar.gz`, it means
  that they are [not adjusted before creating the binary package](https://reproducible.debian.net/issues/not_using_dh_builddeb_issue.html).

* [Timestamps in gzip headers](https://reproducible.debian.net/issues/timestamps_in_gzip_headers_issue.html)
  are a no-brainer.

* When there's a mismatching `Build ID` in an executable, it means a variation
  happens during the compilation. Investigation can be done using
  [sources.debian.org](https://sources.debian.org/) (see link at the top).

* First step should be a search for the [`__DATE__`, `__TIME__` or `__TIMESTAMP__`](https://reproducible.debian.net/issues/timestamps_from_cpp_macros_issue.html)
  using [codesearch](https://codesearch.debian.net/).  Otherwise, try to locate
  calls to `date` in `configure.ac`, `Makefile.am`, etc.

The [clean-notes](https://salsa.debian.org/reproducible-builds/reproducible-misc/blob/master/clean-notes)
script in the `misc` repository will detect outdated notes and re-order
packages by alphabetical order. It should be run before committing changes to
the `notes` repository.

## Fixing issues

Fixing reproducibility issues falls into two categories: either the problem is
specific to a single package or the cause is the output of another package
(then referenced as "toolchain" package).

### Fixing a single package

The usual steps are:

1. Use `debcheckout` or `apt-get source` to retrieve the source code.

1. Do the changes. With packages using the `3.0 (quilt)` format,
   `dpkg-source --commit` can be useful.

1. Update `debian/changelog`. New version is usually original version with
   `.0~reproducible1`.

1. Use `dpkg-buildpackage -S` to create source package.

1. Use [reprotest]({{ "/tools/" | prepend: site.baseurl }}) to test
   reproducibility. If the package is not reproducible, examine the diffoscope
   output `logs/PACKAGE.diffoscope.html` or compare build logs
   `logs/PACKAGE.build1` and `logs/PACKAGE.build2`, then repeat from step 2
   unless the issue comes from another package. In that case, see about
   "toolchain" packages below.

1. Use `debdiff` or `git format-patch` to create patches.

1. [Create a new bug report](https://wiki.debian.org/ReproducibleBuilds/Contribute#How_to_report_bugs),
   and don't forget to attach the patch!

1. Add an entry or reference the bug in `packages.yml` in
   [reproducible-notes](https://salsa.debian.org/reproducible-builds/reproducible-notes).

### Fixing a toolchain package

Fixing an issue in a package that affects the reproducibility of other packages
requires some more steps, but the general process is the same:

1. Use `debcheckout` or `apt-get source` to retrieve the source code.

1. Do the changes. With packages using the `3.0 (quilt)` format,
   `dpkg-source --commit` can be useful.

1. Update `debian/changelog`. New version is usually original
   version with `.0~reproducible1`.

1. Use `pdebuild` or `gbp buildpackage` to build the package.

1. Backup `base-reproducible.tgz`.

1. Use `pbuilder --login --save-after-exec --basetgz base-reproducible.tgz` to
   install the newly built package.

1. Test a package affected with `reprotest`. If the issue is still not fixed,
   repeat from step 2.

1. If the package is in Git, create a new repository on
   [salsa.debian.org](https://salsa.debian.org/reproducible-builds/packages).
   Push your changes to a (rebasable) `pu/reproducible_builds` branch.

1. Subscribe to the `upload-source` notification for the package on the
   [Package Tracking System](https://tracker.debian.org/). This is needed so
   you don't forget to update the custom package when a new version hits the
   archive.

1. [Upload](https://wiki.debian.org/ReproducibleBuilds/ExperimentalToolchain#Adding_a_package_to_the_APT_archive)
   the package to the reproducible APT repository.

1. Document the changes on the
   [wiki](https://wiki.debian.org/ReproducibleBuilds/ExperimentalToolchain#Modified_packages).

1. Reference the bug in `issues.yml` in
   [reproducible-notes](https://salsa.debian.org/reproducible-builds/reproducible-notes)
   and on the wiki page about the issue if there is one.

1. Everybody with a [Debian SSO](https://sso.debian.org) client certificate
   (both DDs and guests) can schedule source packages to be rebuilt by using
   the authenticated endpoint at
   <https://tests.reproducible-builds.org/cgi-bin/schedule>. There are handy
   icons (`♻`)in every package page that links to that cgi-bin script with the
   correct parameters.  If you don't have a valid client certificate or have
   any other trouble you can find somebody in the #debian-reproducible IRC
   channel to help you.  Also, if you need to mass schedule many packages (even
   over the daily limit imposed by the public scheduling script described
   here), you can find the jenkins administrators in that channel that can do
   mass scheduling for you.

1. If the changes don't break anything,
   [create a new bug report](https://wiki.debian.org/ReproducibleBuilds/Contribute#How_to_report_bugs).
   Don't forget to attach patches and to use the `toolchain` usertag.

## Continuous integration platform

Several jobs have been created to regularly test packages (from `main/sid`) on
[jenkins.debian.net](https://jenkins.debian.net). As a result there is the
[reproducible build overview of packages](https://reproducible.debian.net).

The setup is explained [in this blog post](http://layer-acht.org/thinking/blog/20140925-reproducible-builds/)
only, but this post is somewhat outdated by now and needs to be amended.

See the various `reproducible_*` scripts in the
[Jenkins Git repository](https://salsa.debian.org/qa/jenkins.debian.net/tree/master/bin/)

## Working on installation media or live systems

Having installation and live systems which can be built reproducibly would also
be great.

In Debian, [#900918](https://bugs.debian.org/900918) is being used to track the
progress of reproducible installation images. There is an
[analyze_image](https://github.com/adrelanos/Whonix/blob/master/help-steps/analyze_image)
Bash script that creates sha512 hashes of all files included within an image,
access rights, symlinks, partition table, bootloader and more. Doing this with
two images that should match and comparing the reports the script creates can
help to identify sources of non-determinism in images. It does not have iso
support yet. The author (Patrick Schleizer) is interested to generalize the
script for more generic, Debian use cases

## External links

* [Reproducible installs](https://wiki.debian.org/ReproducibleBuilds/ReproducibleInstalls)
* [Announcing Whonix's First Implementation of Verifiable Builds](https://lists.alioth.debian.org/pipermail/reproducible-builds/Week-of-Mon-20131209/000009.html)
* [Whonix Verifiable Builds](https://www.whonix.org/wiki/Verifiable_Builds)
* [Tails reproducible builds blueprint](https://tails.boum.org/blueprint/reproducible_builds/)
* [reproducible debootstrap](https://github.com/lamby/debootstrap/commits/pu/source-date-epoch)

## Donate

Another way to help is to financially support our project. We welcome any
kind of donation, of any size. Please see our
[donation page]({{ "/sponsor/" | prepend: site.baseurl }}) for more information.
