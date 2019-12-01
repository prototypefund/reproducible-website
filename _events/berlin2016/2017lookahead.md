---
layout: event_detail
title: 2017 Look ahead
event: berlin2016
order: 310
permalink: /events/berlin2016/2017lookahead/
---

## 1) ADVOCACY / OUTREACH / POLICY / EDUCATION

### Documentation

* teaching people to write reproducible code
* SOURCE_PREFIX_MAP spec done
* document all indirect highly valuable side-effcts of reproducible-builds

### policy & law

* uk demands reproducible firmware by law from HUAWEI
* china asks the same from cisco

### outreach

* reproducible summit 3 2017
* more talks at conferences around the world
* reproducible hacking sprint 2017 (hackotlaw)
* whitepapers and academic research
* explain r-b to my grandmother/grandparent/grandchild in 5 sentences
* all conferences have r-b tracks
* start outreach to embedded device manufacturers
* "reproducibility" is discussed as a new aspect of software trust (e.g., in security/privacy circles)

### distro specific

* debian-policy packages should be reproducible


### generic/all distro

* members from all distros
* all distro package managers know about reproducible builds
* post list of funded reproducibility projects


### upstream/elsewhere
  
* shouting loudly to upstreams
* interest outside floss projects (closed software, internal development)
* we will have convinced industry reproducibility is important
* "ecosystem janitor team": group to make sure upstream sources remain available & mirrored with checksum
* collaboration between industry and community much more significant
* google chrome is reproducible and user verifyable
* upstreams should be encouraged to issue a statement about reproducibility of their systems


### misc

* get as many people supporting bootstrapping efforts as we have reproducible people now
* reproducible builds is explained in CS courses
* we have a logo

## 2) COMMUNITY / DOCUMENTATION

### COMMUNITY

* meetings
  * regular 2-month IRC/voice meeting
  * more reproducible builds cross-project in person meetings
  * small 3-5 person hack sessions targeting specific goals
* network tooling/services
  * a community of “rebuilers”(?) publishing logs about rebuilds exists
  * central webservice for submitting/retrieval of =.buildinfo= files
* untitled column
  * more embedded dev work in the community
* collaboration
  * =notes.git= will be more widely shared among distros
  * have more reproducibility teams in other distros
  * cross-distro outreach

### DOCUMENTATION
* reproducible-builds.org
  * move content from debian pages to r-b.org
  * common place for all repro builds talks that everyone uses
  * there will be a “get involved” section
  * common (cross-distro) =.buildinfo= format specification written
  * blog planet/aggregator
  * we built a standard base for =.buildinfo= files
  * all cross-project tools documented not in specific projects only
* projects or distributions
  * fedora reproducible docs on how to reproduce builds
  * produce a template for projects that wish to make a public statement about reproducibility
  * link to Nix docs from r-b.org
  * improved RB-related doc on Bazel website
  * how to attach signatures without disrupting reproduce? guidelines for packagers.
* untitled columns
  * searchable database of reproducibility issues (e.g. manpages)
  * examples of non-reproducibility problems explained (3-4 package examples — what did it cause?)
  * the FAQ section will be full of tips on how to use various tools in a reproducible way
  * Encyclopedia for working around common non-repro issues
  * index collection with repro issues and solutions with search
  * reproducible docs as manpages
  * HOWTO about creating reproducible packages
  * teach people how to easily build and test existing software
  * document setting up tests.r-b.org type infrastructure


## 3) COVERAGE / UPSTREAMS

### common

- upstream projects adopting SOURCE_PREFIX_MAP
- reproducibility stats collected and reported (for debian, freebsd, macports, openwrt/lede, coreboot, netbsd, f-rdoird, arch linux, etc)
- upstream git repos pass __???___ commits after cutoff date
- reproducible iso images
- all distros publish a statement about reproducibility

### FreeBSD

- reproducible base system 100%
- freebsd packages 90% reproducible by default (by count of pkgs)
- all reproducible build options on by default
- expectation for reproducibility understood by freebsd committers

### other distros

- macports will be 50% reproducible by count of pkgs
- get gentoo on board!
- more distros and FLOSS OSes join reproducible builds
- OpenWrt & LEDE to 90% RB
- proprietary software incorporating reproduciblity
- first 100% reproducible OS (with packages too)
- reproducible pkg src packages

### RPM-based

- support for `.buildinfo` in necessary tools
- common discussion space for sharing problems and solutions
- some simple RPM pkgs already reproducible
- tools to reproduce

### Guix

- GNU Guix will have measurements of pkg reproducibility
- GNU Guix will have fixed repro issues in core packages: guile, python, gcc

### Debian

- debian unstable is 95% reproducible
- maintainers WANT to make reproducible debs
- `.buildinfo` in archive
- block debian testing migration on reproducibility regressions

### Arch Linux

- write documentation
- tools for users to verify reproducibility
- 100% reproducible core repo

### NixOS

- reach milestone: make NixOS minimal ISO (+al deps) reproducible
- Hydra (CI): graph or reproducibility progress
- write nixpkgs documentation
- investigate reproducibility for OSX in nixpkgs
- nix: allow users to configure desired trust level (i.e. "wont only want only binaries builtby N out of K builders)
- provide a verifiable bootstrap chain in nixpkgs going back ~10 years

## 4) HARDWARE / EMBEDDED

### Hardware
- How can we improve trust in hardware?
- Open Hardware Specs
- Reproducible RISC-V implementation on FPGA
- Where are reproducible/verifiable CPUs/microchips?
- Reproducible HDL synthesis deemed feasible
- Will have built/ported a free system to OpenRISC
- How do we improve trust in our networking hardware?

### Firmware
- Binary blobs are evil – how do we get more open source firmware?
- Reproducible OS images
- Tool to generate reproducible image
- How can end-users verify their firmware?
- Can we convince companies to open source firmware?
- Can we have firmware audits with checksums by independent third parties?
- We have more Laptops supported without Management Engine

### Internet of Things
- We will have first devices with >= 50% reproducible software
- Security updates for IoT devices will be a thing
- There will be massive IoT botnets
- Governments should force IoT manufacturers into maintenance!
- Devices should be sold with clear maintenance period labels
- Yocto/OpenEmbedded builds provide `.buildinfo` & are reproducible

### Manufacturing
- Convince manufacturers to give out reproducible firmware
- Start conversations with vendors over benefits of reproducibility
- Talk to OEMs/ODM/...

## 5) DEV TOOLS / TOOLCHAIN

### Metadata, etc.
* PoC for apt to verify signature by multiple rebuilders
* buildinfo. d. n to publish buildinfo of builds it _wants_ to have
Compilers
* GCC patches to upstream!
* Rush reproducibility patches (inc. buildpath indep debug info)
* Popular toolchains (C++, Java) work reproductibly and support SOURCE_PREFIX_MAP
* LLVM / CLANG on pair with GCC regarding reproducible "patches"
* OCaml has no more reproducibility issues
* Intentional nondeterminism patches
Developer utilities
* Git properties as "secure VCS" are analysed
* PDF generating docs reproducible!
* R data files are reproducible
* Strip-nondeterminism is smaller due to issues fixed "properly"
Diffoscope
* Parallel diffoscope
* More supported file formats
* Integration with Taskotron
* FreeBSD pkg format
* Waterfall/ time-series gpaph at what diffoscope is doing (like Chrome Dev tools -> Network tab)
* Detection of order difference in many files
Reprotest
* Upstream devs are using reprotest to check for reproducibility
* Reprotest has great usability
* Reprotest runs on many different platforms
Bootstrapping
* Have fully mapped out bootstrapping chains for GCC, GHC, JDK, FPC, gradle, Maven
* I want to have raised awareness about bootstrap binaries & shared work on GNU toolchain bootstrap
* User accessible tools for fully bootstrap compilers
* Compilers will be buildable with at least one _other_ compiler.
* Tool to cross-bootstrap any Debian arch
.buildinfo files
* Define a way to _select_ which buildinfo record should be compared
* Automated buildinfo creation/inspection/comparassion tool
* Extra optional fields in .buildinfo to help identify more causes of unreproducibility
* Translation tool from .buildinfo specs to Guix/Nix deriviations + vice versa
 Specific toolchains
* RPM toolchain(s) analysed for sources of non-reproducibility
* Reproducible autotools
* Reproducible ELF Tool chains
* No more buildpath issues (SOURCE_PREFIX_MAP widely adopted)
 
## 6) USER TOOLS

### Predictions

* Make F-Droid.org provide simple links to reproducibility results
* A tool to find who has been able to reproduce a package
* Package managers allow installing reproducible packages only
* FreeBSD pkg will policy/query for attributes like reproducibility or binary transparency
* Users have the possibiltiy to only install reproducible packages
* Users should be able to gather statistics about reproducibliity of packages installed on their system
* We have a reproducible build "notary witness" server runnable by everyone
* Tools available to give system reproducibility stats
* F-Droid will have a binary transeparency log for all releases
* Script to rebuild a package and compare your results against the distro's
* Guix will allow users to select "k of n" binary providers
* Guix will have a "health" command listing CVEs and suspicious (non-reproducible) binaries
* Tool for any user to execute reproduce instructions
* Tooling to create "reproducibility transparency" logs exist

### Unknowns/questions

* How to get fixes accepted by the Android Tools team at Google
* Can a crowdsourced database of reproducibility test results limit its search space enough to be useful?
* Will enough test infrastructure exist to establish reproducibility confidently?


## 7) TESTING INFRASTRUCTURE

### Analyzing non-RB
* Automatically classifying the causes of non-reproducibility
* Advanced statistics (research on trends, tendencies, etc.)
* Static Analysis in order to detect possible non-reproducible bugs in source code

### Misc improvements
* Rebuild for each variation, to detect what effects the output

### Dev helping
* Maintainers can upload packegs for repro. testing
* Create a "fuzzing" tool to modify time/date/hostname/cwd etc. so that devs can test whether that affects them

### Deploy
* Testing infra should be reproducible
* Be able to setup tests.r-b.org locally to test patches
* Be able to set up build for a pkg locally without whole CI infra (too)

### Non-Debian
* ci.freebsd.org will run the testing infra for packages
* GNU Guix will be on tests.repro-b.org
* Measure cross-arch reproducibility of noarch RPMs

### Debian tests
* Test arch:all separately
* Test arch:all cross-architecture
* One build on one arch, per Jenkins.d.n job-run (not just in pairs build1+build2)

### Data storage
* PostgreSQL is used
* Store all the build artifacts of completed builds

## 8) NEW DIRECTIONS

 * Define secure VCS (Version Control System)
 * Understand/analyze security properties of Git
 * Run transparency log for software
 * Debian FTP archive distributing build info file
 * Better cross-distro build info support
 * Design security-related logic, workflows and algorithms for buildinfo Files
 * Having more people even at the Summit
 * Crypto-signing more (reproducible) releases
 * Sharing distributed databases of hashes for reproducible releases
 * Having raised awareness of bootstrapping
 * Start working on reproducible package installs
 * Encourage projects, distros and software maintainers to publish a statement about reproducibiility of their stuff
 * Store all build outputs...run diffs *later* to understand more
 * Efforts on making major compilers bottstrappable has started
 * Incorporate reproduible build results into binary transparency log
 * Define schema for records so that two different paths to build same artifact looks good
 * Write SOURC_PREFIX_MAP specification
 * Push GCC guild path patches
 * Push SOURCE_PREFIX_MAP into other build tools
 * Achieve 97%+ reproducibility with build-path independence
 * Government should require r-b by law for critical infrastructure SW
  

<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_01.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_02.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_03.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_04.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_05.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_06.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_07.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_08.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_09.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_10.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_11.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_12.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_13.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_14.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/2017lookahead_15.jpg" | prepend: site.baseurl }}" alt="2017 Look ahead Post-It notes" />



