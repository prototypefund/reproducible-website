---
layout: new/event_detail
title: Discussing the current status of .buildinfo files
event: berlin2017
order: 40
permalink: /events/berlin2017/statusbuildinfofiles/
---

build info craziness
--------------------

- Limitations Debian implem of build info
+ no checksum of dependencies in build info, deb limitation: #802241 (debian bug) 
+ no checksum of the source code. 
+ no architecture of the installed dependencies (e.g arm installed on x86_64, cross-compilation, multi arch binaries, ...)
- no actual specification of build info, only a man page of the debian implementation
+ other implementation: archlinux, OBS (open build service -- openSUSE). Need to follow-up on openSUSE buildenv.
+ man pages missing some information
+ Lot of things called build info but not necessary build info.
- what is debian specific in build info?
+ None of the field is debian specific
+ But format might be
- do we want to have a single format for all distribution?
+ Not essential...
+ But ease the adoption of repro build: easier to compare, easier to share tooling, ...
+ Maybe they want to use something that feel native to them
- Build info specification on the debian wiki 
+ Do we need to have a repro-build level specification? (in https://reproducible-build.org/specs)

We narrowly avoided an argument about csh

- Build info file for ISO distribution, what format would that be? 
+ A separate topic that other people might want to discuss? Not a topic for us now.

