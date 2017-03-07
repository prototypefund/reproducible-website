---
layout: event_detail
title: testinfrastructure
event: athens2015
order: 140
permalink: /events/berlin/2016/testinfrastructure/
---

who is here?

- 1 freebsd person 
- 1 openwrt/coreboot
- many debian people
- 1 tails person

SUMMARY OF TODOS/MINUTES

1. tests.reproducible-builds.org test setup
- get ride of iframes -- talking to "u" about it

2. reproducing testing set up
- vagrant can try setting up a test set up for the builders themselves
   - then freebsd can try to replicate the same environments
- lynsis: document how to build openwrt2 -- change the openwrt script and coreboot script so that is doesn't depend on debian
- tails will make a link of the results of testing tails iso so we can link from tests.r-b.org

3. merge the postgres code and create new schema
- change to postgres
- make a script to update schema design

4. data useful for other projects
4.1 notes
- cross distro notes?
- way to mark a package as fixed in notes, and not display them?
- ways to specific whether issue is debian specific

4.2 making the database schema more cross distro friendly
- CPE -- unique identifier / match names of packages across distros

4.3 other people doing reproducible tests and reporting back
- Holger wanted them to send yaml files
- lynxis thinks kernelci.org is cool -- has an API for accepting results of kernal builds and boots


raw minutes

* the other project problems using jenkins test set up
- cannot reproduce the test set up?
- simplier to replicate the jenkins test environment -- too many debian dependencies?
- bash scripts long and complicated -- maybe break out important parts so less intimidating to other potential contributors?

* debian test.reproducible-builds.org
- get rid of iframes
- the present group less interested in talking about usability
* scripts for creating different environments for projects (Aspirational)
- debian
--> hopefully build once and compare against the debian archive
- one freebsd person / fedora
--> system.d container
- one openwrt/coreboot
--> build on debian

* lots and lots of talk about wanting to test jenkins
* what can we do right now:
- external test set up to feed to postgres
- jernalci project? linux kernal testing? hardware set up for reporting things back? make can use similar style api?
- other job: maybe create yaml and send tests.r-b.org to display. like tails? tails is builing iso twice and producing diffoscope result

TAILS:
-  at some point tails will give link to redirect the tails test page 

DEBIAN: 
compare the builds to the debian builders
* NOTES / YAML file
- want: cross distro notes
- currently SOME notes are debian specific
- CPE -- match names of packages accross distros -- unique idenfier of a package.

-





