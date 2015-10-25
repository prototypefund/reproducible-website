---
title: Version information
layout: docs
permalink: /docs/version-information/
---

Version information embedded in the software need to be made
deterministic. Counter-examples are using the current date or an
incremental build counter.

The date and time of the build itself is hardly of value as an old
source code can always be compiled long after it has been released.
It's best when version information give a good indication of what source
code has been built.

The version number can come from a dedicated source file, a *changelog*,
or from a version control system. If a date is needed, it can be
extracted from the *changelog* or the version control system. A
cryptographic checksum can also help to pinpoint the exact source
content. This makes [Git](https://git-scm.com/) commit ids good
candidates as part of version information.

