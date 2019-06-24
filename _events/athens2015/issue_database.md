---
layout: new/event_detail
title: Shared database of issues
event: athens2015
order: 90
permalink: /events/athens2015/issue-database/
---

*50-minute + 10-minute session on day 2*

Use cases for sharing notes:

 * For toolchain developers: what am I breaking.
 * For leaf software developers: what's wrong with my code.
 * For distributions developers: check out the status and *history* on other distributions and comparing.

We should keep it streamlined, like keep it in git as the Debian project is currently doing.

YAML seems to be cool for everybody.

Issues:

 - They can be fixed in different ways.
 - They can be distro-specific.
 - They can be implementation-specific.
 - …

It would be handy to have meta-issues.

Regarding history:

 - Link to example patches and keep old issues.

Linking packages between distros:

 - CPE (from CVE stuff)
 - [distromatch](https://wiki.debian.org/Services/distromatch) (currently abandoned)

Maintaining the notes:

 - We need a format where we can separate “upstream” issues, distro-specific issues, distro-specific versions, etc.
 - Different distros might have different way to fix issues.

For Debian, moving remaining stuff from the wiki to the notes. (→ lamby)

Possible format:

      issue:
        url:
        description:
        distro:
          debian:
            state: fixed
            comment: |

      package:
        distros:
          debian:
            issues:
              - issues1
              - issue2 / free text            #   ← fixed issue
            comments:
            bugs: []
            version:
          freebsd:
            version:
            bugs: []
        comments:
        bugs: []
        issues: []
