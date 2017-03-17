---
layout: event_detail
title: SOURCE_PREFIX_MAP
event: berlin2016
order: 180
permalink: /events/berlin2016/SOURCE_PREFIX_MAP/
---

 * set by a build-tool
 * for mapping build paths
 * honoured by GCC and every build tool that generates build-paths
 * how to support multiple mappings

one or multiple mappings?
 * multiple is better, allows for more intuitive overrides by child processes

env variable preferred over cli

separator character, space or newline?

how to apply the mappings when eventually set?
 * multiple ordered mappings, child build processes append to this map (to the end)
 * child build tools apply the mapping last to first

the exact format of the envvar
 * expressings multiple paths into a single string is hard
 * "common things easy, uncommon things possible"

TODO:
 * (infinity0, doko) research passing newlines through shell, m4, autoconf
 * look how gdb parse and loads symbol paths to source code paths

<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/SOURCE_PREFIX_MAP_01.jpg" | prepend: site.baseurl }}" alt="SOURCE_PREFIX_MAP Post-It notes" />
