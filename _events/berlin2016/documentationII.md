---
layout: event_detail
title: Documentation II
event: berlin2016
order: 190
permalink: /events/berlin2016/documentationII/
---

riseup notepad for facillitating feedback: 
    [FAQ Feedback]({{ "/events/berlin2016/FAQfeedback/" | prepend: site.baseurl }})


* [https://reproducible-builds.org/](ttps://reproducible-builds.org/)
* [https://wiki.debian.org/ReproducibleBuilds](https://wiki.debian.org/ReproducibleBuilds)  - should deprecate / eventually delete this
* [https://tests.reproducible-builds.org/](https://tests.reproducible-builds.org/) - surprisingly hard to find yet it has the most interesting and current info, not just for Debian but other projects' package sets

Personas
--------
* users
  - what does a user need to know to make a package build reproducibly?
  - what is a reproducible build?
  - link to definition
* upstreams
  - how do i make my software reproducible?
  - how to avoid certain programming pitfalls?
  - timestamps, etc. link to FAQ for upstream?
* package maintainers (Debian specific?)

Homepage
--------
   * Definition for RB (to be defined)

Involved Projects
-----------------

Current status?  no, it will get out of date quicker than anyone can update it

  * Debian - 92% of source packages are reproducible (link to tests.r-b.o ?)
  * FreeBSD - base is mostly ok, loader not, kernel not (but some patch/flag exists), ports (80% with external patch on the framework)

distro / project-specific pages!

  * find a list of contacts for these projects and propose them to add information to the website or to send a link to their documentation,
  *  also ask them to add a contact for RB who people can talk to

  * Debian:  https://lists.reproducible-builds.org/listinfo/rb-general, #debian-reproducible @ OFTC
  * ArchLinux
  * Baserock
  * Bitcoin
  * Coreboot: ask lynxis
  * ElectroBSD: https://archive.fosdem.org/2016/schedule/event/electrobsd/
  * F-Droid
  * FreeBSD: -> email alias or ML to be provided (reproducibility@FreeBSD.org)
  * Fedora
  * Guix
  * LEDE
  * NetBSD
  * NixOS
  * openSuSe
  * OpenWRT: ask lynxis
  * Tails: Public development list: tails-dev@boum.org

Debian-related
--------------
 * don't forget to copy and then remove current Debian wiki pages
 
Top level pages
---------------
 * adding talks page! (most from debian), videos
 * reproducible builds definition

  
Projects
--------

  * add bazel to tool page

FAQ sections (instead of personified personas, let's ask concrete questions!)
------------
introduction to faq: to add things/links that does fit into five sections

 * "what is reproducible builds?"
 * "what is the status of reproducible builds?"
 * "why should I (as a user) care about reproducible builds?"

(single page so it is easier to search everything at once)

 * I'm interested in verifying the reproducibility of software I use
 * I'm interested in making reproducible software
 * I'm interested in packaging/distributing software in a reproducible way
 * But it still doesnt work! -> link to Currently unresolved issues
 * What are the benefits of reproducible builds
  - how can help with license compliance
  - (take the work on use cases and side-benefits and put it here)
 * I don't think reproducible builds are actually useful
  - here we need to answer all the questions like "I want to hardcode paths" etc.
  - why can't we just normalise the <build path, environment, dependencies, whatever>?
  - I really like <timestamps, machine/person who built the binary>!
 * how to build your how build farm?


Get involved page
-----------------
 * A "Get involved" page should be created
 * it should link to Currently Unresolved Issues
 * see https://wiki.debian.org/ReproducibleBuilds/Contribute for an out-of-date list of stuff we had before

FAQ
---
1/ how to deal with compression tools?
  * GZIP: use gzip -n
	* how do I make (GZIP, etc...) give reproducible output?
    (section: projects)

2/ why is reproducibility important?
	* where do I get information for XYZ?
	  (section: users)
	
3/ why using SOURCE_DATE_EPOCH and not simply set everything to 0 (epoch time)
  lots of build system will reject dealing with files that have a timestamp that old (we need concrete example
  (section: project)
 
4/ how to write reproducible code in specific languages - e.g. Rust, Go

* Python: Pyc files, PYTHONHASHSEED
* C: uninitialized memory (msan, asan), readdir order
* emacs bytecode
* how/who to contact for cross distro collaboration? answer: here!
* how to handle signatures in binaries
* squashfs?

To be discussed
---------------
* Merge /tools to the documentation?

How to get involved?
-----------
* how to help various projects?
* how to help with documentation?
* how to help with outreach
* how can I sponsor the effort?


Talks
-----
 * http://www.bsdcan.org/2016/schedule/events/714.en.html
 * https://archive.fosdem.org/2016/schedule/event/reproducible_freebsd_packages/
 * https://osem.seagl.org/conference/seagl2016/program/proposal/166
 * OpenWrt/LEDE: video: https://www.youtube.com/watch?v=Y1D706JCISw, slides: https://people.debian.org/~holger/2016-10-13-OpenWrt-Summit.pdf
 * DebConf16: https://debconf16.debconf.org/talks/7/
 * LibrePlanet: https://media.libreplanet.org/u/libreplanet/collection/beyond-reproducable-builds/


tools
------
* where to find the tools


