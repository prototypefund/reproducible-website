---
layout: event_detail
title: Defining Reproducible Builds I
event: berlin2016
order: 120
permalink: /events/berlin2016/reproduciblebuildsdefinition/
---

### What's the definition of a reproducible build?

We agree on 3 factors:

 * Input - same source code.
 * Output - bit by bit identical output, verifiable by a checksum. But we
   need to define the output files, because a build can also generate
   debugging files or other output.
 * Environment - what's an environment? kernel, source tree, build path,
   versions of all installed packages. discussion about trust and shipping
   VMs as build environments.


We agree on saying that:

### reproducible builds is:
 * bit-by-bit identical
 * checksum verifiable
 * specified outputs
 * no specialized comparator (make stripping part of your build - output
must still be usable)

We've set up an axis to define INPUTS (source and build environments).

<pre>
Axis
----

(the y-axis is "relevance", the x-axis is how hard it is to fix)

 *  same source code
 * build instructions (command line)
 * same environment configuration, build flags
 * dependencies and their versions
 * locations where dependencies are installed
 * pre-existing keys

ABOVE THIS LINE: Ideal reproducible build
----
BELOW THIS LINE LEFT: Minimal viable reproducible build

ON THE RIGHT: these are things which should not be done

 * LOCALE
 * saved optimization metadata
 * build path prefix
 * SOURCE_EPOCH_DATE
                                             * different person building
                                           * host dependent optimization

EASY -------------------------------------------------> HARD TO PIN/FIX

ON THE RIGHT: these are things which are not reproducible and should not
matter

* other filesystem content
                                                         * Signing keys
                                                         * system time
                                                         * readdir order
                                                                                        
                                             * random data (/dev/random)

</pre>

### The ideal reproducible build
 
 * same source code
 * build instructions (command line)
 * same environment configuration, build flags
 * dependencies and their versions
 * locations where dependencies are installed

<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/reproduciblebuildsdefinition_01.jpg" | prepend: site.baseurl }}" alt="Reproducible Builds definition Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/reproduciblebuildsdefinition_02.jpg" | prepend: site.baseurl }}" alt="Reproducible Builds definition Post-It notes" />
