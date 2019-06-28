---
title: Timestamps
layout: docs
permalink: /docs/timestamps/
---

Timestamps make the biggest source of reproducibility issues. Many build
tools fancy recording the current date and time. The filesystem does,
and [most archive formats]({{ "/docs/archives/" | prepend: site.baseurl }})
will happily record modification times on top of their own
timestamps. It is also customary to record the date of the build in the
software itself…

Timestamps are best avoided
---------------------------

Often the time of the build was used as an approximate way to know which
version of the source has been built, and which tools had been used to do
it. With reproducible builds, recording the time of the build becomes
meaningless: on one side, the source code needs to be tracked more accurately
than just a timestamp, and on the other side, the build environment needs to be
defined or extensively recorded.

If a date is required to give users an idea on when the software was
made, it is better to use a date that is relevant to the source code
instead of the build: old software can always be built later. Like
[version information]({{ "/docs/version-information/" | prepend: site.baseurl }}),
it's best to extract such a date from the revision control system or
from a *changelog*.

External tools
--------------

Some tools used in build processes, like code or documentation
generators, write timestamps which will create unreproducible build
products.

The Debian reproducible builds effort proposed the
`SOURCE_DATE_EPOCH` environment variable to address the problem. Tools
that support it[^list] will use its value—a number of seconds since January 1st
1970, 00:00 UTC—instead of the current date and time (when set). The
variable has been [formally
defined](https://reproducible-builds.org/specs/source-date-epoch/) in
the hope of wider adoption.

[^list]: As of 2015-10-26, the following tools are known to support `SOURCE_DATE_EPOCH`: help2man, Sphinx. Also, [others have been modified locally in Debian](https://wiki.debian.org/ReproducibleBuilds/TimestampsProposal#Reading_the_variable) already to support this.

Changes required to support `SOURCE_DATE_EPOCH` are usually fairly
small and easy to write. Patches for tools which don't yet support the
environment variable have been usually well received and help all users
wanting *reproducible builds*.

In case where that is not possible, an option is to do post-processing on
the output. The idea is to either remove the timestamps entirely or to
normalize them to a predetermined date and time.
[strip-nondeterminism](https://packages.debian.org/sid/strip-nondeterminism)
was designed as an extensible program to perform such normalization on
various file formats.

Another option is to run these tools using
[libfaketime](http://www.code-wizards.com/projects/libfaketime/).
This library is loaded through the `LD_PRELOAD` environment variable and
it will intercept function calls retrieving the current time of day. It will
reply instead with a predefined date and time. In some cases, it works
just fine and can solve problems without requiring many
changes to a given build system. But if any part of the build process is
relying on time differences, things will go wrong. One case
of bad interaction between `libfaketime` and parallel
compilation has been identified as a source of [reproducibility issue in
the Tor Browser](https://bugs.torproject.org/12240). So beware.
