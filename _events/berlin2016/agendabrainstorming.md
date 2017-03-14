---
layout: event_detail
title: Agenda Brainstorming
event: berlin2016
order: 20
permalink: /events/berlin2016/agendabrainstorming/
---

SQUASHFS

 - fix for once SQUASHFS (1)
 - fix the mksquashfs file ordering (7)
 - have reproducible SQUASHFS
 - hack on squashfs (2)

RPM

 - Removing timestamps from RPM packages (3)
 - How to make repm-build produce repr. rpms (upstream)
 - Discuss RPM metadata reproduc... issues and solutions (2)
 - How to reproduce RPM metadata?

REPRODUCIBLE FILESYSTEM IMAGES (SEE ALSO: SQUASHFS)

 - What is a (cruft-free) way to save filesystems reproducibly? (defined order, etc.) (1)
 - Check/improve/update the makefs reproducibility patch in FreeBSD (1)
 - Learn how to generate filesystem images reproducibly (ISO, hybridUSB ...)
 - Figure out how to build _ext4 images_ reproducibly (in a VM for extra credit) (2)
 - How do we reproduce higher level artifacts, livecds, containers, installers, etc. (2)
 - Determine relevance of reproducibility for non-executable file formats (1)
 - Brainstorm about non-reproducible VCS->tarball steps (e.g. autoconf, etc.)
 - What do we use for base images? (2)

BUILDINFO (GENERAL, DOC, ADVOCACY)

 - What is the current status of .buildinfo files? Who uses them, for what reason? (1)
 - How do we use .buildinfo? (1)
 - Disucss .buildinfo service use cases, open questions etc. (7)
 - Write a generic .buildinfo file spec (2)
 - Spread buildinfo in other projects (1)
 - If an executable buildinfo file is good for one precise/pinned version... How do we make the same thing easy to use for future versions?

TOOL SUPPORT

 - Would like to work on security tools that can be used corss distro/platform. (3)
 - We need tools to find who has reproduced a build? (1)
 - What tooling is out there to help everyone determine reproducibility? (3)
 - How to solve the static library "ar" problem (without breaking apps which build from static libs).
 - How to make reproducibility issues easier to find/debug? (1)
 - How to deal with difference from compress tools like gzip.
 - Is there a way to mitigate the need to sort results of concurrent build operations?
 - Brainstorm/hack on useful docs/tools like SOURCE_DATE_EPOCH and diffoscope
 - How can we remove signatures from OSX applications (1)
 - How can we make _VM tests_ (e.g. OS system test suites) _reproducible_?
 - How should we explain package relationships OVER TIME? (1)

SOURCE CODE

 - reproducible path from upstream VSC tag to downstream package
 - referencing source state from binaries (1)
 - static analysis scripts/tools to detect possible reproducibility bugs
 - how to address with the timestamp merge

PROJECT STATUS

 - collect status on all projects that are trying to become reproducible (1)
 - I am using Mint; is it reproducible?
 - What about Ubuntu; is it reproducible?
 - Get pkgsrc on par with FreeBSD’s ports
 - do a regular inter-project xyz meeting (IRC? Voice?) (1)
 - make “important” packages reproducible, e.g. GCC, glibc, linux, etc (reliably + everywhere)
 - How about fixing legacy/ unmaintained software? (1)

DEFINITION

 - there is a perception / accusation amongst the “opponents” of reproducible builds that “we” disagree amongst ourselves what “reproducible” means.
 - which parts of the environment have to change for a repr. build to be allowed to generate a different output? (6)
 - how/what do we hash? (2)
 - can we produce an official definition of r-b?

BUILD INFO (IMPLEMENTATION) / DEBIAN INFRASTRUCTURE

 - (debian only) can we do anything productive to get =.buildinfo= files in ftp.debian.org?
 - how to patch dak (Debian Archive Kit) in 2016? (4)
 - implement/help with buildinfo distribution in Debian’s FTP (dak software)
 - hack on debrebuild
 - reach 100% r.b. for Debian pkg-pal packages
 - how do debian bulid profiles and reproducibility fit together?
 - question/Debian: building pkgs in contrib[?] reproducibly? Why do we not do it? :)
 - collect remaining infrastructure issues for reprod. Debian
 - how to make reproducible Debian chroot (get rid of non-deterministic post-installation stuff)? (2)
 - how to archive/distribute Debian buildinfos (1)
 - write dak patch to keep buildinfo files as a temporary measure.
 - discuss Debian “usrmerge” implications for reproducibility
 - scaling reproducibility testing problems and experiences

DIFFOSCOPE

 - hack diffoscope to make tests less hard linked to specific tool versions (1)
 - what is the state of parallel diffoscope? (7)
 - we need parallel diffoscope
 - collect improvement ideas for tools like diffoscope, stripad[?] (2)
 - what are the main usability issues with diffoscope?
 - bring diffoscope to more platforms (1)
 - look at integrating debdiff & diffoscope
 - hacking session on diffoscope (1)
 - hands on diffoscope, check the new features (1)
 - discuss how diffoscope got better and how it could be even better
 - automatic classification of reproducibility issues in diffoscope (2)

FUNDING

 - Sustained funding
 - How to keep funding sustained & fair (5)
 - Where do we get (more) funding for reproducible builds work? (1)

ADVOCACY TO PROJECTS

 - Discuss/advocacy how reproducible builds can improve binary diff (1)
 - Help Mozilla prioritize R.B. HIGHER (2)
 - How to get more upstreams to care
 - How do we socialize benefits of reproducible builds? (overcome developer aversion) (1)

SKILL SHARE

 - Share how Tails takes snapshots of Debian archive
 - How can I address a snapshot of e.g. the Debian archives?
 - Request for skill sharing: vagrant ???? common problems for reproducibility
 - What variables are (surprising) variables affecting builds? (3)
 - Find argument for/against different ways how pkgs built
 - Find the best way of making various packages reproducible
 - https://maintainer.zq1.de/

LEGAL AND LAW

 - Using reproducible builds to improve GPL compliance (4)
 - Are there any legal implications or obstacles to reproducible builds? If so, which jurisdictions are affected? Can we somehow influence the law? In what direction? (2)
 - discuss reproducible builds benefit for GPL enforcement

OUTREACH / COMMUNICATIONS (NON TECHNICAL PEOPLE)

 - What's the business case for reproducible builds? (A.K.A. How do I convince non-technical people?)
 - Explaining r-b to non-technical people (2)
 - What can we do to persuade the world that reproducibility really is important?
 - Add new stuff to SELLING POINTS web page
 - Collect benefits of reproducible builds for advocacy
 - Get reproducible builds into space! (NASA? Satellites) Mars colony?) In other words: spread it to more organizations, esp. public research or impacting
 - How do we make the every day user care? (2)
 - How to raise awareness about reproducible builds?

OUTREACH / COMMUNICATIONS (DEVELOPERS)

 - Documenting non-obvious benefits of reproducible builds (7)
 - How do we explain with repro.builds are "GOOD"?
 - Are there any projects important for RB, which (we feel) are not cooperative enough? What can we do to address their issues? (1)
 - Convince tool authors about the benefits of reproducibility
 - Coordinate reproducible builds talks at every conference in 2017
 - Selling the reproducible story.
 - How do we communicate the importance of bit-for-bit reproducible?
 - Make a shared statement about bundling and binaries in the package graph. (1)
 - What are all/new uses of reproducible builds? (3)
 - Convince package authors about the benefits of reproducibility
 - How to keep in touch better after this meeting, especially news/changes/improvements (4)
 - Advocacy: How to deal with people that rejects for the sake of debuggability
 - Outrach to potential reproducers: Who can we get to run build farms?

BINARY TRANSPARENCY

 - Figure out how binary artifact transparency fits into reproducible builds
 - semi OT: What's the status of binary transparency? (4)
 - What strategies exist for reproducing binaries without build metadata? (1)

USER VERIFICATION

 - Design methods for end-user verification of reproducible builds (1)
 - How do we push these benefits to end users? (e.g. apt config to require reproducibility)
 - How can we _expose_ reproducibility to _end users_? (.e.g user can configure pkg manager to only install pkgs that have been built by >= N people) (1)
 - What tools can we provide for _users_ to gain trust in their systems? (3)
 - If reproducibility is used to increase trust, who actually(!) does the verification?
 - Find a good way to verify coreboot for end users (1)
 - What user-facing tools can we start building now to verify a build? (1)
 - How to let users verify builds on computers w/o keyboards (phones, embedded, etc.)
 - How can we create a "trust infrastructure" on top of reproducible builds? (4)
 - Empower users to verify builds in practice (7)
 - Where do we go next? Assure we get to 100% reproducible package collections, what else should we do? (1)
 - How do we compare reproducible build output (between developers, between projects?, etc.)
 - Discuss _user interfaces_ to repro builds: - ways to _check_ 3rd-party binaries, - ways to _choose binaries_ coming from different orgs

REPROTEST

 - Discuss how reprotest could benefit outside Debian
 - Hack on reprotest (2)
 - Make reprotest great & cross-distro (1)
 - Which features should we add to build systems to help reproducibility?
 - How can we simplify finding reproducible build problems?

TEST-R-B.ORG (GENERIC)

 - Rebuild everything sytsematically?  Can we?  Should we?  Who is "we?" (1)
 - Drop iframes, how? (2)
 - Make t.r-b.org more accessible to screen readers
 - Build and diffoscope debian-cd images on Jenkins
 - Find out how to relay RB test results to the central RB Jenkins
 - *Executable* reproduce instructions? (2)

TEST.R-B-ORG CROSS DISTRO

 - Hack the site for easier extendability to other tested projects (2)
 - Adding GNU Guix to t.r-b.org (1)
 - Adding openSUSE to t.r-b.org
 - Better include non-Debian in t.r-b.org (6)
 - Work on FreeBSD Jenkins instance (1)
 - Find out how to relay r test results to the central rb Jenkins (2)
 - Build and diffoscope FreeBSD release ISOs (1)
 - Start running r-b tests (arch_dep + arch_indep) on Debian GNU/kFreeBSD and more, submit buildinfos
 - Create a centralized approach/place to share reproducible build patches across distros

CROSS DISTRO

 - Easy to use build environment ot make "stand-alone" apps reproducible (2)
 - Talking about reproducibility across very different domains: Android apps, GNU/Linux distctros, JavaEE, ROMs (1)
 - Hack/share issues regarding package systems and format and tools (rpm/deb/freebsd) (5)
 - Move forward the shared database of issues (vz from ath)
 - Discuss more cross-distro coordination opportunitise on an *ongoing* basis
 - Can we build common tools to record the build environment and dependencies? (2)
 - How do we better collaborate between projects?  Debian, Fedora, FreeBSD, .... Issues, technology, patch tracking (3)
 - Are there any good crossplatform build containers/VM setups? (1)
 - Can we make builds verifiable below the distro package level?

DOCS

 - How do we share reproduce instructions?
 - Get safe hashes everywhere (5)
 - Plan to facilitate collaborative redaction of documentation online (r-b.org)
 - Can we identify formats and toolchains, which are either critical or important for reproducible builds, which are still not taken care of? Is such a list closed?
 - Documentation for package maintainers/upstream to avoid certain pitfalls
 - What are the "best practices" for reproducible builds and we do we spread them? (2)
 - How to make RB project look even less Debian-specific (in marketing, etc.)
 - FAQ: Best practices on website

SOURCE_DATE_EPOCH

 - Encourage other toolchains (clang) to adopt SOURCE_DATE_EPOCH and similar approaches (3)
 - Why do we want a SOURCE_DATE_EPOCH other than 1 Jan 1970? (2)
 - Hack Bazel to work with SOURCE_DATE_EPOCH (1)

BUILD PATHS / SOURCE_PREFIX_MAP

 - Get GCC build path patches accepted
 - Turn -fdebug-prefix-map environment variable into a standard like SOURCE_DATE_EPOCH
 - Write specification for SOURCE_PREFIX_MAP and promote it (8)
 - Patch LLVM/clang to support SOURCE_PREFIX_MAP (1)
 - Discuss spec for embedded build paths
 - Look at using debugedit in strip-nondeterminism (1)

COMPILERS

 - Hack on LLVM/clang/non-GNU toolchains (3)
 - Reproducing binaries with clang (5)
 - Compilers output reproducibility: What's the current state?  Hack on rustc (2)
 - Figure out how to deal with pkgs that use profile-directed optimization (like GCC) (2)
 - How to reproduce Python bytecode .pyc/.pyo files? (4)
 - Is reproducibility attainable between cross builds and native ones? (4)

BOOTSTRAPPING

 - Moving on from x86: bootstrapping new architectures without legacy hardware/software
 - Trusting trust: How close can we get to auditable bootstrapping? (3)
 - Discussing ways to bootstrap GCC from a tinyC compiler (5)
 - Can we build the whole world of Java from source? (3)
 - Drafting recommendations for compiler writers about bootstrapping (1)
 - Debating our stance towards opaque binaries used for bootstrapping (1)
 - Create vision of trustworthy system: free, reproducible, transparent, ...
 - Ensure source packages don't contain binaries/pre-built binaries (1)
 - How to reproduce packages from source only in Debian-like distros
 - How can we trust firmware? (7)
 - How can we trust hardware?
 - Reproducible binaries vs. host dependencies: what is the limit?
 - Are we okay with self-hosted languages? (2)

<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_01.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_02.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_03.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_04.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_05.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_06.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_07.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_08.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_09.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_10.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_11.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/agendabrainstorming_12.JPG" | prepend: site.baseurl }}" alt="Agenda brainsorming Post-It notes" />
