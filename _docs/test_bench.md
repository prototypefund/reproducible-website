---
title: Test bench
layout: docs
permalink: /docs/test-bench/
---

It is important to detect reproducibility problems in the build system
before the users do, to avoid any false alarms.

The method is usually as followed:

 1. Build a first time.
 2. Save the result.
 3. Perform as many changes to the environment as possible.
 4. Build a second time.
 5. Compare the results.

[diffoscope](https://diffoscope.org/) is a tool that has been initially
designed to help understand issues when comparing build results.

Here is a list of interesting variations that have been identified so
far:

 * date and time,
 * build path,
 * hostname,
 * domain name,
 * filesystem,
 * environment variables,
 * timezone,
 * language,
 * locale,
 * user name,
 * user id,
 * group name,
 * group id,
 * kernel version,
 * umask,
 * CPU type,
 * number of CPU cores.

[disorderfs](https://packages.debian.org/sid/disorderfs) can help in
testing variations due to filesystems in a deterministic manner.

The list of [variations tested for
Debian](https://reproducible.debian.net/reproducible.html#variation) is
available as an actual example.

{% comment %}
XXX: We should probably mention reproducible.debian.net, add contact info and mention ProfitBricks.
{% endcomment %}
