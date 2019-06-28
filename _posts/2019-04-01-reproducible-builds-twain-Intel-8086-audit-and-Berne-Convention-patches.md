---
layout: post
title:  "Reproducible Builds Announces a Crowd-funded Intel<sup>®</sup> 8086<sup>®</sup> Audit"
date:   2019-04-01 00:00:01
categories: org
---

<h4 style="font-weight: normal;">… and proposes a patch to the Berne Convention on Copyright Law</h4>

<span style='color: red; font-weight: bold'>Ed. Note: This was our April Fools' Day prank for 2019.</span>

We are excited to launch a crowd-funded audit of Intel<sup>®</sup>'s classic desktop
computer processor, the 1978-vintage 8086<sup>®</sup>!

The 8086<sup>®</sup> is the primogenitor of the ubiquitous `x86` CPU architecture, which powers
the lion's share of desktop and server CPU's around the world.

Modern `x86` CPUs power virtually all Internet servers that all of us use daily,
from 80% of the supercomputers in [TOP500](https://www.top500.org/) to Google's data
centers to digital information displays inside municipal buses to
consumer-grade desktops and laptops.
What's more, the `x86` architecture is also the platform which the software
developers and sysadmins who design, implement, and maintain the Internet do
their day-to-day work on.  The ubiquity and criticality of the `x86` architecture
to the global economy cannot be understated.

Those `x86` CPUs run computer programs.  The Reproducible Builds project seeks
to make it possible to establish the provenance of runnable computer programs,
as installed on server and customer computers, _in situ_.  That is needed to
defend against attacks whereby Eves and Mallories try to change the code Alice
and Bob run.  (That proves, again, that sufficiently advanced cryptography is
indistinguishable from soap operas.)

Such attacks range from the trivial [evil maid attack][evil_maid], wherein the
attacker modifies a device that had been left unattended and unlocked, to
sophisticated attacks such as Ken Thompson's venerable [_Reflections on
Trusting Trust_ (RoTT)][RoTT] attack, wherein an attacker installs a
self-propagating backdoor that cannot be detected by source inspection alone.

In security, one must always have a trusted base from which to build.  Since it
is infeasible to verify even a single binary program by hand, let alone all the
programs installed on any single computer, when we at the Reproducible Builds
project audit a particular runnable computer program, we do this by running
another computer program, [`cmp(1)`][cmp].  We therefore must have a trusted
computer on which to run `cmp(1)`; that computer will be our trusted base upon
which we will build trust in all other computers, using techniques such as
([Wheeler, 2009][wheeler-ddc]).

However, we cannot discount the possibility that [Elvis installed a RoTT
backdoor][Elvis_impossible] in the original 8086 [software models][HDL], before the 8086 was
[fabricated][fabrication], and that that backdoor has propagated ever since to
every new Intel<sup>®</sup> CPU, since Intel Corporation uses their own latest-generation
CPU's to design the next generation ones.  Thus, in order to establish trust in
our chosen base CPU, we must not only audit our base CPU's software models, but
also audit the physical CPU hardware to confirm that it behaves according to
its software models.  That is required to rule out the possibility of a
hardware-level RoTT backdoor.

<br/>

Regrettably, it would be illegal to conduct said audit in an open-source manner,
out in the open under [Justice Brandeis](https://en.wikiquote.org/wiki/Louis_Brandeis)' sunlight
and [Linus Torvalds](https://en.wikipedia.org/wiki/Linus%27s_Law)' many
eyeballs, due to intellectual property (IP) law provisions.  Put simply, we
cannot compare the physical chips to the software models because we cannot
obtain the software models.  The original software models of the 8086<sup>®</sup>
[die][die] are copyrighted by Intel Corporation, who refuse to provide their
customers with the schematics of what they had purchased, arguing those
schematics are a trade secret; reverse engineering those schematics from the
physical chips is impractical for engineering reasons and might constitute a
breach of the chips' <acronym title="End-user License Agreement">EULA</acronym>;
and even if we were handed the schematics tomorrow,
copyright law would prevent us from sharing them amongst ourselves without
Intel's consent, which they are neither required nor expected to provide.

Facing these legal obstacles, the Reproducible Builds project has decided to
grab the bull by the horns and, in an [unprecedented][citation_needed] move by
an open source project, actively work to change the law.  The Reproducible
Builds project will pursue law changes that enable us to do our open source
work which increases the security of end users and decreases the risk of using
computers.  We announce, without further ado, our intention to propose changes
to the _[Berne Convention][berne] for the Protection of Literary and Artistic Works_
aimed at finding a new and improved
balance between the rights of authors, corporate middlemen, and end-users.

<br/>

Holger Levsen, a [Debian](https://www.debian.org/) developer and a long-time
contributor to the Reproducible Builds effort, welcomes the audit effort with
open arms.  "I have fond memories of using `x86` on my Amiga 1000 sidecar back in
the days," says Levsen, "and I am excited that this platform is finally getting
the thorough hardware verification it deserves."

"The Berne Convention often gets in the way of my volunteer work," summarizes
Daniel Shahaf, an [Apache Software Foundation](https://www.apache.org/) member
emeritus and a contributor to the Reproducible Builds effort.  "I hope the
Convention maintainers will consider our forthcoming pull request positively
and look forward to testing the next release candidate of the Convention," he
added.

[evil_maid]: https://en.wikipedia.org/wiki/Evil_maid_attack
[RoTT]: https://www.win.tue.nl/~aeb/linux/hh/thompson/trust.html
[wheeler-ddc]: https://dwheeler.com/trusting-trust/dissertation/html/wheeler-trusting-trust-ddc.html
[cmp]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/cmp.html
[fabrication]: https://en.wikipedia.org/wiki/Semiconductor_device_fabrication
[x86 supercomputers (2008)]: https://www.theinquirer.net/inquirer/news/1008702/supercomputing-dominated-x86-architecture
[Elvis_impossible]: https://soundcloud.com/miguel-estevan/its-impossible-elvis-cover
[HDL]: https://en.wikipedia.org/wiki/Hardware_description_language
[die]: https://en.wikipedia.org/wiki/Die_%28integrated_circuit%29
[ICLDP]: https://en.wikipedia.org/wiki/Integrated_circuit_layout_design_protection
[citation_needed]: https://xkcd.com/285/
[berne]: https://en.wikipedia.org/wiki/Berne_Convention
