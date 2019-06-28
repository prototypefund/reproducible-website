---
layout: event_detail
title: Use cases
event: berlin2016
order: 220
permalink: /events/berlin2016/usecases/
---

old list: [https://reproducible-builds.org/docs/buy-in/](https://reproducible-builds.org/docs/buy-in/)

philosophical: doing the right thing (tm) - similar to having ingredients lists on sold food

security = detect compromised build environments
  cl: I think the Xcode Ghost example in docs/buy-in makes this sufficiently clear.

security = legal enforcement backdoors
  How is this different from malicious backdoors?

increased development speed by limiting number of rebuilds of dependent packages => lower cost
  Build systems can be significantly faster to rebuild software if the build is reproducible. It improves caching and reuse of artifacts. Tests don't need to be rerun if the binary hasn't changed.
  Submitted: [https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000192.html](https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000192.html)

increased development speed by less QA work before release = because you can verify that large parts did not change
  => better security by reduced exposure time to 0day exploits
  Submitted: [https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000187.html](https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000187.html)

prove that cross-compompiling generates same result as native compiling and then speed up build on slow architectures (e.g. x86_64 is faster than arm) = in the long run spending more time on core instead of on toolchain
  Submitted: [https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000192.html](https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000192.html)


QA and code quality = detecting issues of failing builds under rare circumstances (timing/races, number of cores, locales)
  Submitted: [https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000185.html](https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000185.html)

bandwidth savings = faster updates with binary-delta-packages (e.g. xdelta / drpm)
save bandwidth: torbrowser build locally and remotely and then just compare the checksum
use less storage = save money / hardware to operate
  Submitted: [https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000187.html](https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000187.html)

quality = r-b implies being able to rebuild in an automated way (which is not a given in some places), so can help business-continuity and also security when it makes it easier/possible to add security patches

reliability = detecting hardware problems (bit-flips)
debian: using buildinfo files to detect builds in unclean environments
  = increased awareness of who builds what how

easier to rebuild binaries from source = more developers/happyness
 = not one developer being a SPOF knowing about a build, reduced responsibility of individual developers

easier refactoring of build-system = identical output means all good
  easier refactoring of any tool run during the build (scripts, compilers, code generators, etc.)
  Submitted: [https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000190.html](https://lists.reproducible-builds.org/pipermail/rb-general/2016-December/000190.html)

improved/increased trust in binaries delivered by third parties
+also helps licensing information when buildinfo describes original build env and other parties are able to reproduce identical binaries from source

helps trusting-trust using reverse double compilation

out-of-scope (list of problems not to be solved by r-b):
	* having understandable source code
		* having source code without backdoors or exploitable bugs
	* trusting hardware (some improvements with cross-compilation and emulation reproducing same binaries)
	* 


Ensure your developers are using the real, official toolchain and libraries

For mobile development, developers are often downloading the toolchains and libraries via sources that are difficult or impossible to verify.

Find developers who are using unofficial or bad versions of tools and/or libraries.  This also isolates the release process from all of the problems and risks associated with the developers' own machines.
  cl: I think this is sufficiently documented in [https://reproducible-builds.org/docs/buy-in/](https://reproducible-builds.org/docs/buy-in/) with the 'Resisting Attacks' section on Xcode Ghost.

<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/usecases_01.jpg" | prepend: site.baseurl }}" alt="Usecases Post-It notes" />
