---
layout: event_detail
title: stateofreproduciblebuilds
event: berlin2016
order: 290
permalink: /events/berlin2016/stateofreproduciblebuilds/
---


almost done
	* R-B the idea, the goal
	* 92% reproducible in Debian (2015: 83%, 2014: ~60%) when building in same buildpath
	* fully reproducible bitcoin, tor, coreboot, electrobsd, webconverger
	* communication channels setup: mailing list, IRC, webpage
	* test.r-b.o Debian
	* SOURCE_DATE_EPOCH specified, patches in gcc
	* diffoscope version one (already useful)
	* initial prototype of reprotest
	* buildinfo for Debian
	* Monthly IRC meetings
	* 2 summits, community
	* Weekly report (blog, RSS)
	* dpkg+toolchain in Debian main
	* 500 patches merged in Debian, +100 in openSUSE


half-done / in progress
	* definition of r-b
	* 77% reproducible in Debian (with build-path issue), 23% = 2000-5000 source packages missing
	* Talks, presentations given
	* advocacy / use cases
	* r-b for NetBSD, Archlinux, openSUSE, FreeBSD, Fedora, CEDE, Debian, F-droid
	* SOURCE_PREFIX_MAP specification / GCC build path patches
	* Diffoscope improvements
	* buildinfo for rpm, freebsd, coreboot
	* buildinfo distribution for DAK (Debian FTP)
	* general buildinfo spec
	* rpm support
	* tests.r-b.o * (for everything non-Debian)
	* reproducible live-media, containers, other images
	* Documentation
	* GNU coding guidelines / Debian Policy
	* 800 patches unmerged (in Debian)
	* r-b logo

Not started / in planning
	* User controls + verification
	* Gettext (reproducible translated content)
	* r-b for Android, OpenBSD, Ubuntu, Redhat
	* buildinfo file distribution (putting them on mirrors/blockchain/public-signed-logs)
	* analyze buildinfo files (detect dirty build envs, find differing binaries, find same binaries even though differing envs)
	* tests.r-b.o / * against the 'real world' (i.e. what is distributed to users)
	* compiler bootstrapping
	* cross distro issue-notes
	* pkgsrc (NetBSD & more)
	* IoT (software running in cars, fridges etc)
	* Windows (except ducible)
	* MacOS + iOS
	* Formal RFC
	* policy & laws
	* r-b book "r-b for Dummies", "Everything you wanted to know about r-b but were too afraid to ask"

-

