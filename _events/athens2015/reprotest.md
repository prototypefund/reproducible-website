---
layout: event_detail
title: Design an ideal reproducibility testing tool
event: athens2015
order: 190
permalink: /events/athens2015/reprotest/
---

*60-minute session on day 3*

Exercise in *README driven development*: think what the user documentation
could be for the perfect tool to answer the question “How can I know if a piece
of software is reproducible?”

This tool is intended for developers who want to test whether their software is reproducible.

Let's call it “*reprotest*”.

Typical usage
-------------

    $ git clone https://github.com/foo/bar.git
    $ cd bar
    $ reprotest ./build.sh

Exit status :

 - `0` if reproducible
 - `1` if not
 - `2` in case of problems

Provide useful information in both cases, links to reproducible documentation.

Variations
----------

The default is to do all possible variations. The first thing tested will be
the software in its current environment—with whichever tools the developer
has in their normal environment. If it is shown to be reproducible there, it
will attempt to try other environments similar to the systems which reported it
unreproducible (e.g. reproducible.debian.net).

To control which variations are being tested:

    $ reprotest --keep-same=buildpath build.sh

    $ reprotest --variations=date build.sh
    # fail with something like:
    #     Sorry, date is not suported in direct mode
    # (or do we want to use libfaketime?)

    $ reprotest --variations=date --runner=virtualbox build.sh

    $ reprotest --variations=date --runner=qemu --qemu-image=debian-sid.img build.sh

    $ reprotest --variations=cpu,kernel,user,domain,date,filesystem make

(filesystem will use disorderfs)

Artifacts
---------

To control which artifacts will be compared at the end of the build:

    # do not consider *.o file as files that need to match
    $ reprotest --ignore=*.o build.sh

    # only do a diff of *.deb files to determine if the thing is reproducible or not
    $ reprotest --accept=*.deb dpkg-buildpackage

Commands
--------

To compare different commands:

    $ reprotest --command='make' --command='make CFLAGS=-g' --command='make CFLAGS=-O3'

Project configuration file
--------------------------

If you have a `.reprotest` file in the current directory, you can run reprotest without
any arguments to use the command and variations specified there:

    $ reprotest

By default, it will re-use the current system to run the build. To test with another toolchain:

    $ reprotest --use-system-root=/path/to/chroot make

To recreate another build:

    $ reprotest --buildinfo=file.buildinfo --os=debian make

    # try to guess which kind of buildinfo if --os is not specified
    $ reprotest --buildinfo=file.buildinfo make

If Debian allows all variations except build path then you can assess software is good for Debian by:

    $ reprotest --profile=debian build.sh

User configuration file
-----------------------

`~/.reprotestrc`:

    default-runner = qemu

    [qemu-runner]
    default-image = ~/.reprotest/debian-sid.img

Output
------
    
    $ reprotest --text=reprotest.txt => run diffoscope on all created files?

    $ reprotest --html=reprotest.html

    $ reprotest --junit=reprotest.junit (for jenkins) <- parsable output

    # create reprotest-differences/build1/ and create reprotest-differences/build2/
    $ reprotest --save-differences=reprotest-differences/

    # create reprotest-differences.build1.tar.gz reprotest-differences.build2.tar.gz
    $ reprotest --save-difference-archives=reprotest-differences

    # create a json file with index and details about the test
    $ reprotest --json=reprotest.json --save-differences=reprotest-differences/

    # pass options to diffoscope
    $ reprotest --diffoscope-options="--ignore=coverage/ --ignore=*.log"

Options can be combined:

    $ reprotest --html=reprotest.html --save-differences=reprotest-differences/

If no output option is specified, plain text will be printed to the standard output.

----

Other possibilities:

Run build twice, reproducing `$DEFAULT` set of information from build environment:

    $ reprotest make

Run build once, reproducing `$DEFAULT` set of infomation from `xxx.buildinfo`:

    $ reprotest --buildinfo=bash_amd64.buildinfo make

Run build once, reproducing fields `buildpath`, `username` from `bash_amd64.buildinfo`:

    $ reprotest --reproduce=buildpath,username --buildinfo=bash_amd64.buildinfo make 

Check that `*.buildinfo` have the same result hash, find all the fields that
have the same value across all files, reproduce those common fields, then run
build once, and check if output has same hash:

   $ reprotest --buildinfo=1.buildinfo --buildinfo=2.buildinfo --buildinfo=3.buildinfo make
