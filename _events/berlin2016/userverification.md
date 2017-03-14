---
layout: event_detail
title: User verification
event: berlin2016
order: 60
permalink: /events/berlin2016/userverification/
---

user-facing reproduciblity interactions
=======================================



review
------

(A couple of the raw post-it notes reproduced below, expanded with a little more context)

- it's important that we incentivise repro-attempt builds *actually* being done by multiple different parties
- we may want to use a check at package installation time for reproducibility status to encourage package creators to be reproducible!
- we may want to use a check at package installation time for reproducibility status for safety: non-repro may indicate security issues or attacks
- question: who is the pool of builders?  how do (mechanically) define their identity?  e.g. is "debian" an identity or is "buildserver123" an identity?
- challenge: we want to determine which build reports *should* describe the same build -- we're lacking a clear (or efficient for large groups of builds) way to find that!!
- there are many failure modes -- "not enough builds attempted" vs "too many builds conflict" -- how do we want to represent these?
- broad agreement there should be no UI -- should mean users get repro builds by default, no interaction required, default mode is the safe mode.
- concern that there is not a lot of easy ways to tell if the system you *have already* is actually composed of only safe things.  maybe make review-and-score tools?
- "k-of-n" means "given N build records, at least K of them must agree".
- (not listed) there is a really tricky question in what happens *over time*: if there are 2/3rds of builders agreeing on result, then you install it, then several more reports come in which makes it only 1/3 agreement... does your existing system become unsafe? what do we do about that?


short summary
-------------

Reproducible builds are becoming available -- now it's time to answer questions about how we want regular users (not just developers and advanced system administrators) to experience the benefits.

Changing package managers so that they will *ONLY* install builds which are reproducibile seems like one likely avenue (both to improve end-user security, and to incentivize distro packages to demand reproducibility before releasing).

We believe it is necessary to *SHOW* the full records of *multiple builds* to the end-user's package manager, so that the package manager can locally confirm that the builds were reproducible -- there is no improvement if we simply trust a single signature from an upstream *claiming* a package is reproducible: we want to see *multiple signitures* of independent parties who performed their own builds.

Future work is necessary to describe how we identify different builders, how we share their logs, and how we should determine which build records are appropriate to compare.

raw post-it content
-------------------

- distributing build responsibility
- reproducibility as barrier to installation
- trusted pool of builders (what trust model?)
- define necessary inputs for builds (visible to user's pkg manager)
- identifiable builders
- policy grant e.g. k-of-n in agreement
  - fall back to build from source (?)
- treat dissenters same as compromised keys or VCEs
- how to determine agreement in build reports
- workflow for failure modes
- something ismilar to apt list-bugs
- no UI (except for errors)
- treat non-reproducibility as lack-of-signature
- how do you find this info
- "system health" (crossed out: "security number") score for operating system as a whole
- random sampling rebuild (e.g. guix challeng)
- using reproducibility to audit toolchain (easily)
- reporting non-reproducibility
- cross-platform build sepcs

<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/userverification_01.JPG" | prepend: site.baseurl }}" alt="User verification Post-It notes" />

