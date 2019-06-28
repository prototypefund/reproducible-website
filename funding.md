---
layout: default
title: Help fund the Reproducible Builds effort&hellip;
order: -1
permalink: /funding/
---

# Help fund the Reproducible Builds effort&hellip;

**The Reproducible Builds effort needs your help to continue its work towards
ensuring the security of computer systems of all shapes and sizes around the
world.**

Whilst anyone can inspect the source code of free and open source software for
malicious flaws, most software is distributed pre-compiled to end users.

The motivation behind the Reproducible Builds project is to permit verification
that no flaws have been introduced during the compilation process—either
maliciously or accidentally—by promising identical results are always generated
from a given source, thus allowing multiple third-parties to come to a
consensus on whether a system is compromised.

Your continued support will be key in solving this problem, which affects
systems of all sizes, from embedded microcontrollers to the largest government
systems.

## Future work

The Reproducible Builds team has demonstrated that it is, in principle,
possible to build a Linux distribution in a reproducible manner and have solved
many of the issues in doing so.

However, the next release of Debian ("buster") is currently not yet 100%
reproducible and funding to support on-going maintenance of critical
infrastructure will be absolutely essential to reach this goal.

This not only includes the administration of over 50 build nodes across
multiple architectures, it requires continuous and patient work with package
maintainers and upstreams to merge reproducibility-related patches. It also
includes extending the scope of [our testing
framework](https://tests.reproducible-builds.org/) to even more projects, as
well as improving the existing tests and reports.

In addition, there are currently no tools that let a user know whether packages
that they are installing are reproducible or not, required to "close the loop"
and allow end-users to finally truly validate the software they are running on
their machines.

Furthermore, maintaining momentum — both in terms of public perception and in
private — around the various related projects such as *diffoscope*, etc. will
be key in ensuring a reproducible "buster" becomes a reality.

## Past work

* 94% of packages in [Debian](https://debian.org/) are reproducible
  in our tests, and [Debian Policy](https://www.debian.org/doc/debian-policy/)
  now recommends that builds are reproducible. Support for our build metadata
  format (`.buildinfo`) has been merged into the official toolchain.

* Large amount of cross-distribution collaboration —
  [Tails](https://tails.boum.org/) and [Coreboot](https://www.coreboot.org/)
  now offer reproducible ISO images based heavily on our work, and
  [NetBSD](https://www.netbsd.org/) offer a reproducible base system to
  complement considerable progress from [F-Droid](https://f-droid.org/en/),
  [openSUSE](https://www.opensuse.org/) and
  [ArchLinux](https://www.archlinux.org/). In addition, we are also providing
  continuous reproducible builds testing for eight Linux distributions.

* Core patches written and submitted for GCC, R and Go, Rust introduced
  "file maps" in support of reproducibility after our feedback.

* A number of highly lauded presentations (LCA, Embedded Linux onference,
  LibrePlanet, Scale15x, CCC, OSSE, LinuxCon China, Open Compliance Summit,
  etc.) as well highly-productive meetups in "real life".

* Countless features in [diffoscope](https://diffoscope.org/)
  and other tools; 1000s of lines changed with extensive use outside of a
  reproducibility context.

* Mentoring in [Outreachy](https://www.outreachy.org/) and
  [GSoC](https://summerofcode.withgoogle.com/) to ease inclusion of new
  contributors especially ones from under-represented groups in technology.

* Almost 3 years of regular weekly newsletters as well as IRC-based
  meetings. Friendly communications have ensured that newcomers from all
  backgrounds feel involved and welcome.

## Contact

Please do not hesitate to get in touch (`info@reproducible-builds.org`) if you
would like any more information. Thank you for your consideration and we thank
you in advance for your support.

![]({{ "/images/groupphoto_rws3_berlin_2017_small.png" | prepend: site.baseurl }})
