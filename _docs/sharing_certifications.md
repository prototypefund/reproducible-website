---
title: Sharing certifications
layout: new/docs
permalink: /docs/sharing-certifications/
---

How could users gain trust that a build has not been compromised by
exchanging certifications attesting that they all have been able to
get the same build results?

Debian is thinking of allowing [multiple Debian Developers to upload
signatures](https://wiki.debian.org/ReproducibleBuilds/BuildinfoSpecification#buildinfo_signatures)
attesting that they have been able to reproduce a build.

The question is also related to the work lead by Ben Laurie on [binary
transparency](https://groups.google.com/forum/#!forum/binary-transparency).
The idea is to have an append-only log similar to [Certificate
Transparency](https://www.certificate-transparency.org/) which could be
used to authenticate binaries.

More research is required in this area to make reproducible builds more
effective in detecting compromise early.
