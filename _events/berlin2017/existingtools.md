---
layout: event_detail
title: Reviewing existing reproducible builds tools
event: berlin2017
order: 30
permalink: /events/berlin2017/existingtools/
---

diffoscope
----------

- diff two artefacts and check if they are the same.
- if not, it will open artefact and will try to find out what's wrong.
- it does this recursetly
- e.g. a zip file, will be open and it will identify which file within the archive is different.
- e.g. a elf file will be opened and the section is being identified.

stripnondeterminism
-------------------

- runs after the build
- remove known causes of non-reproducible
- e.g. jar's aren't reproducible and make it reproducible
- remove several timestamp
- should not exist by designed
- but upstream is hard or take a lot of time. it's an intermediate solution

disorderfs
----------

- fuse filesystem
- has different modes
- e.g. random
- ls -f / `can return every time a difference`
- e.g. invert
- invert the listing
- e.g. order
- will order mode

Good practices:
- runs once in "order" mode
- runs second in invert mode to have a deterministic non-deterministic way.

trydiffoscope.org
-----------------

- web service
- you don't have to install diffoscope with the lots of dependencies
- written in django
- cmdline client to avoid main diffoscope install
- upload
- diff on the server
- create a link to be shared into the bug report

reprotest
---------
- tool to run the a build run twice
- can use container
- reprotest `make` will run it twice. but changing the environemnt like TZ

tests.reproducible-builds.org
-----------------------------
- based jenkins
- doesn't run reprotest
- is running bunch of scripts to do the build twice
- is legacy, but moving to reprotest, isn't going to happen, as long reprotest is still under development

squashfs-tools
--------------
- the upstream is not reproducible
- lots of distribution patches
- unclear if the reproducible patches gonna accepted
- lynxis will do a fork because the maintainer isn't 
- not reproducible becaues of timestamps and scheduling problems

guix
-----
- packages manager guarantees reproducibility
- guix challenge compares difference sources of a binary

reproducibleopensuse
--------------------
can test a packages which has been uploaded to opensuse build system.
varies:
- hostname
- date

tool request
------------
- to make javascript reproducible, there should be a `npm-ls` to get all the npm packages.
- someone created a cross-ecosystem scraper to scrape npm, pypi
- prevent build systems to talk to the internet
- run a tcpdump on the system. if the .pcap file is greater than 0, you know the build talked to the internet. It helps create a good bug report to know, to which server it talks and what.
- Put the "is the build talking to the internet" feature into the build system.
- call `runc` without network
- create a namespace without network

Feedback results to the community

reproshilds.io??
--------------
- travis-ci integration
- create a tool to integrate it into their build process
- create a feedback api.
- get badges

The unreproducible packages
--------------------------
have a package full of non-reproducible things

next sessions
------------
- squashfs forking session
- reprotest

