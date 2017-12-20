---
layout: event_detail
title: Agenda brainstorming
event: berlin2017
order: 20
permalink: /events/berlin2017/agendabrainstorming/
---

In this session we individually wrote the following questions on pieces of paper, then sorted them by topic as shown below and then everybody had 4 green dots to mark topics we wanted to further work on.


### Marketing, etc. 1

- how can we better communicate our progress to the public? ** green
- are we making t-shirts ** green
- should we aim to publish a paper on RB in an academic journal to gain more support? 
- write and sign RB manifesto ** green
- talks/presentations and other "marketing"/outreach
- how should we communicate the importance of reproducibility
- how can we let even more developers know & care about reproducible builds?


### Marketing, etc. 2

- what made you see the value of repr. builds?
- I do not see much commercial interest in RB, why? *** red
- what % of a computer user's problems are because of package mgmt/environment/reproduce
- (discuss how to) get buy-in from projects that don't yet take part in RB.
- feedback results of tests.r-b.org to the developer


### Funding

- how can we become rich with Reproducible Builds? (or: Funding?) * green
- Funding our work in 2019 + 2020 *** green
- Funding reproducible builds
- who is interested in sustainable funding for R-B
- Create formal/legal organizational structure for R-B projects


### Code signing & metadata

- embedded signatures best practices **** green
- signing packages vs. signing metadata * green
- how to validate sources in 20 years? *** green
- how to verify sources ** green


### Technical end users

- Develop user-interface to check for reproducibility **** green
- other usertools than "do you really want to install that unreproducible package" * green
- can users configure their system to only install verified reproducible pacakges? if not, what do we need? * green
- What INTERFACES to build reproducibility info do we give to USERS? ** green
- What tools can we provide to _users_ to help them verify their software? **** green
- End-user "prompts" re. unreproducible packages, interfaces, etc
- client tools/strategy for verifying binaries
- how to let users know if a package has been reproduced
- who should be trusted when reproducible package is not actually reproducible? where to report suspicious build results? * green


### End users (not necessarily technical end users)

- Why is reprobuilds important for the end user?
- what RB means for end users
- which USERS should we expose build reproducibility info to? ** green
- what's the gain for the non-tech end user? * green


### Newbie docs

- Let's have a "hello world!" tutorial! * green
- Let's make the documentation noob-friendy! ** green
- Documentation for and questions from newcomers
- Is there a list of common mistakes that makes packages/systems not reproducible? = 70% timestamps
- What are the most common causes of non-reproducible builds ** green
- Define the ambition of Reproducible Builds
- How do we help projects define the SCOPE of their R.B. efforts? (e.g. inputs, build system variations...)


### Debian

- What parts of RB are too specific to Debian? is it worth changing them? * green
- Rebuild Debian packages from the archive. * green
- Let's fork Debian?!! *** green, ** red
- Debian: What is our next 1y realistic goal? 95.768%? Reproducible Installer ISO? Anything else?
- reproducibng SOURCE debian package from git snapshot
- Compatibility with signed .debs


### What is reproducibility

- can we do something about communities that cannot build dependencies from source? (npm, java, compiler builders?) : 1 green
- if we make an image by deterministically composing snapshots of unreproducibly built data... do we call that image reproducible? : 1 green
- how can we ensure the term "reproducible builds" is used consistantly across the internet


### Portability

- make sure more computer architectures are supported
- do we want/need reproducibility cross distributions? ("the i386 binary")
- reproducible cross-compiling (i.e. do we get the same as native compiling?) : 4 green


### Tools

- what tools can we all SHARE?
- session/list/introduction about all tools/methods RB works with : 3 green
- how far to bootstrap back the tools to be reproducible? : 1 green
- fork squashfs
- automated analysis of non-reproducible software ("linting")
- how can we let developrs test their software for reproducibility without external tools? : 2 green
- overview/walkthrough of the Reproducible Builds tools landscape. (diffoscope/reprotest/disorderfs/s-nd) : 3 green


### Java

- making Java software reproducible : 5 green
- improve Maven packaging in Debian
- what's the status of reproducible builds in the Java/Android ecosystem?
- easy to use F-Droid rebuilding by user
- Tor Browser latest make it available in F-Droid


### Binary artifact formats

- let's make comparison table of filesystem pack formats! (tar vs squashFS vs Ostree vs zip, cpio, etc) : 1 green
- binary artifact explainer workshop : 1 green
- sharing metadata about artifacts between different systems /apt, rpm, jar/ : 1 green
- binary transparency --- can we get it started? : 2 green
- what should be the source of reproducible build? tarball, repository, something else...? : 3 green


### Buildinfo

- create an overview of projects doing .buildinfo files : 1 green
- should all distributions agree on the same buildinfo format, so that we can provide tools to work with them? : 4 green
- require the .buildinfo file standard
- best practice on .buildinfo
- buildinfo storage for the next 6--12 months
- buildinfo format for RPM
- what's the current status? what are solved problems / hard challenges?


### System image

- status of generating reproducible system images? : 4 green
- reproducible debootstrap (basic OS image)
- reproducible containers? : 1 green
- reproducible Debian images eg. ISO images / etc. : 1 green
- how do we build reproducible system images? : 1 green
- are reproducible packages = reproducible OS? What about configuration?


### Distributions

- merging/moving away from being "Debian" specific, e.g. 2 mailing lists, 2 IRC rooms, etc. : 3 green
- How to make SLES join our party? (SLES = commercial SUSE)
- set up / encourage adversarial public re-builders : 1 green
- status of reproducing RPM (on Fedora?) : 2 green
- what is the status and future plans for RPM packages? : 1 green


### Encouraging upstreams 1

- how could we encourage developers to write self-sustained test suites for sub-projects? *** green
- how easy it is for a dev to make a project reproducible? * green
- what to do with uncooperative upstream projects? *** green
- feedback of reprod. to upstream
- only contribute to master branch ** red
- let other systems up on T.R-B.O * green


### Encouraging upstreams 2

- best practices for submitting patches upstream *** green
- explore alternate solutions for lost metrics (as s/w becomes mirrored)
- develop legal guidance for developers / distributors facing pressure to ship malware * green


### Web apps :)

- how do we verify reproducibility of web applications * green


### Distribute

- is there a list of similarities / differences between operating systems reproducibility? * green
- which could be better ways to distribute / check package signatures * green
- how to securely and automatically sign packages/package lists
- what to do with (not) reproducibly built software? ** green
- testing reproducibility, integrating with tests.r-b.org
- how can we make GitHub store immutable tarballs for tagged versions? (pristine tar?) * green
- how can we make a database of signed build inputs and outputs
- where should we collect reproducibility instructions / checksums of results?


### Bootstrap 1

- how acceptable is a not fully from source bootstrappable GCC
- what do we call black boxes in boostrap?
- how far are we from diverse dual compilation?
- find a way to bootstrap the Haskell compiler GHC without using a binary GHC. * green
- find a complete bootstrap path for GCC. *** green
- find a way to reduce the number of binaries we need to trust when building compilers. * green


### Bootstrap 2

- who wants to help: C compiler in Scheme, Scheme interpreter in simple assembly? * green
- realize diverse-double compilation in the real world ** green
- what does bootstrap "from source" mean?
- what is a good bootstrap vs a bad bootstrap?


### BUILD_PATH_PREFIX_MAP

- how to convince GCC to support BUILD_PATH_PREFIX_MAP? **** green
- final specification for BUILD_MAP_PREFIX_MAP * green


### Build environment

- are Flatpak, Snapd etc the right way to build
- how can we convince people that application bundles (like Docker images) are inferior to building software reproducibly? *** green
- what are viable build environments for RB? (Docker, Vagrant, chroot...) * green
- How do we handle other, sloppy package managers (like npm, etc)...? Import tools, mirror scripts? ** green
- Is Bazel compatible with ReproBuild specs? (SOURCE_DATE_EPOCH, .buildinfo file...)
- what should be done to make not only builds but system state reproducible?
- why to use standardized build environments or not? * green

