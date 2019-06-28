---
title: Buy-in
layout: new/docs
permalink: /docs/buy-in/
---

Working on *reproducible builds* might look like a lot of effort with
little gain at first. While [this applies to many types of work related to
security](https://www.schneier.com/blog/archives/2008/09/security_roi_1.html),
there are already some good arguments and testimonies
on why *reproducible builds* matter.

Resisting attacks
-----------------

In March 2015, The Intercept
[published](https://theintercept.com/2015/03/10/ispy-cia-campaign-steal-apples-secrets/)
from the Snowden leaks the abstract of a talk at an
[internal CIA conference in
2012](https://theintercept.com/document/2015/03/10/tcb-jamboree-2012-invitation/) about 
[Strawhorse: Attacking the MacOS and iOS Software Development
Kit](https://theintercept.com/document/2015/03/10/strawhorse-attacking-macos-ios-software-development-kit/).
The abstract clearly explains how unnamed researchers have been creating
a modified version of XCode that would — without any knowledge of the
developer — watermark or insert spyware in the compiled applications.

A few months later, a malware dubbed “XcodeGhost” has been found
targeting developers to make them unknowingly distribute malware
embedded in iOS applications. Palo Alto Networks
[describes](http://researchcenter.paloaltonetworks.com/2015/09/novel-malware-xcodeghost-modifies-xcode-infects-apple-ios-apps-and-hits-app-store/) it as:

> XcodeGhost is the first compiler malware in OS X. Its malicious code is
> located in a Mach-O object file that was repackaged into some versions
> of Xcode installers. These malicious installers were then uploaded to
> Baidu’s cloud file sharing service for used by Chinese iOS/OS X
> developers

The purpose of *reproducible builds* is exactly to resist such attacks.
Recompiling these applications with a clean compiler would have made
the problem easily visible, especially given the size of the added
payload.

As Mike Perry and Seth Schoen explained in December 2014 during [a talk at
31C3](https://media.ccc.de/events/31c3_-_6240_-_en_-_saal_g_-_201412271400_-_reproducible_builds_-_mike_perry_-_seth_schoen_-_hans_steiner),
problematic changes might be more subtle, and a single bit
might be the only thing required to create a remotely exploitable
security hole. Seth Schoen also demonstrated a kernel-level
malware that would compromise the source code while it is read by
the compiler, without leaving any traces on disk. While to the best of
our knowledge such attacks have not been observed in the wild,
<strong>reproducible builds are the only way to detect them
early</strong>.

Quality assurance
-----------------

Regular tests are required to make sure that the software can be built
reproducibly in various environments. Debian and other free software
distributions require that their users must be able to build the
software they distribute. Such regular tests help in avoiding *fail to
build from source* bugs and can uncover rare build problems such as
timing problems, race conditions, or builds affected by locale.

Build environments may evolve after a project is no longer receiving
major developments. While working on Debian, several high impact but
hard to detect bugs were identified by testing builds in varying
environments. To give some examples: [a library had a different
application binary interface for every
build](https://bugs.debian.org/773916), [garbled strings due to
encoding mismatch](https://bugs.debian.org/801855), [missing
translations](https://bugs.debian.org/778486), or [changing
dependencies](https://bugs.debian.org/778707).

The constraint of having to reflect about the build environment also
helps developers to think about the relationship with external software or
data providers. Relying on external sources with no backup plans might
cause serious troubles in the long term.

Reproducible builds also enable the recreation of matching [debug
symbols](https://en.wikipedia.org/wiki/Debugging_data_format) for a
distributed build which can help understanding issues in software used
in production.

Smaller Binary Differences
--------------------------
Having reproducible builds means that only changes in source code or
build environment (such as the compiler version) will lead to
differences in the generated binaries. This minimizes the changes in
artifacts which reduces storage requirements and network traffic for
delta updates.

With similar artifacts, testing can focus on parts that changed while
still preserving confidence about unchanged code. This can speed up
quality assurance and development speed.

Changes to the build system can be tested easily with reproducible
builds: If the output artifacts are identical, the changes will not
affect runtime behavior.

Increased Development Speed
---------------------------
Dependent packages do not need to be rebuilt and dependent tasks do not
need to be rerun if a rebuild of a package does not yield different
results. This can significantly reduce build times and lead to faster
development speeds and lower cost.

Build speeds can also be improved by showing that cross-compilation
produces the same result as native compilation and then doing the
mojority of builds with cross-compilation on faster machines.

“But how can I trust my compiler?”
----------------------------------

A common question related to *reproducible builds* is how is it possible
to know if the build environment is not compromised if everyone is using
the same binaries? Or how can I trust that the compiler I just built
was not compromised by a backdoor in the compiler I used to build it?

The latter is known in the academic literature since the
[Reflections on trusting
trust](https://dx.doi.org/10.1145%2F358198.358210) paper from
Ken Thompson published in 1984. It's the paper mentioned in the
description of the talk about “Strawhorse” mentioned earlier.

The technique known as [Diverse
Double-Compilation](http://www.dwheeler.com/trusting-trust/), formally
defined and researched by David A. Wheeler, can answer this question.
To sum up quickly how it works: given two compilers, one trusted and
one under test, the compiler under test is built twice,
once with each compiler. Using the compilers created from this build,
the compiler under test is built again. If the output is the same, then
we have a proof that no backdoors have been inserted during the
compilation. For this scheme to work, the output of the final
compilations need to be the same. And that's exactly where *reproducible
builds* are useful.

Other resources
---------------

The following articles might contain even more arguments:

 * [Cyberwar and Global Compromise](https://blog.torproject.org/blog/deterministic-builds-part-one-cyberwar-and-global-compromise) by Mike Perry from the Tor Project, 2013-08-20
 * [Software Transparency: Part 1](https://zyan.scripts.mit.edu/blog/software-transparency/) by yan, 2014-07-11.
