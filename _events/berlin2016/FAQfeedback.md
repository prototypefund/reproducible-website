---
layout: event_detail
title: FAQ Feedback
event: berlin2016
order: 195
permalink: /events/berlin2016/FAQfeedback/
---

Please add questions you would like to see answered in the following FAQs!

FAQ QUESTIONS
=============

## What are reproducible builds?
 *  -> Link to definition?
 *  see [Defining Reproducible Builds definition II]({{ "/events/berlin2016/reproduciblebuildsdefinitionII/" | prepend: site.baseurl }}) session

## Why should I care?
 *  -> Give one example for each persona (user, dev/packager, non-technical ppl) and link to [buy-in](/docs/buy-in/) for details.
 *  -> Integrate info from [Use cases]({{ "/events/berlin2016/usecases/" | prepend: site.baseurl }}) session

## Is there any reproducible distribution that I can use today?

* Sadly we are not there yet, but multiple distributions are putting a lot of effort to reach that goal.

## What is the current status of reproducible builds?

* [answer missing]

# I am interested in making my software reproducible - FAQ

## When did the reproducible builds project start?

Some of the earliest public work on reproducible builds started in [Bitcoin (2011)](https://gitian.org/) and [TorBrowser (2013) ](https://blog.torproject.org/blog/deterministic-builds-part-one-cyberwar-and-global-compromise).

## How do I make my software reproducible?

Check that your software is reproducible (see [#check]), then look at the differences and modify your build to avoid this difference. A number of general guidelines are available in the "Get deterministic builds" section of [the documentation](/docs/).

## Is it possible?

Yes it is possible and actually rather simple by following some best practices. see (tips & helps in [https://reproducible-builds.org/docs/](https://reproducible-builds.org/docs/)) 

## How do I check that my software is reproducible?

Build your software once. Add a variation to the build environment which should not influence the output, for example by moving it to another path and create a second build. Then compare the resulting binaries using the [@diffoscope@](/tools/) tool. Make sure there are no differences. See the [test bench documentation](/docs/test-bench/) for a number of parameters that can be varied.

## Are there common mistakes to avoid?

### In general

During the build, many different programs might be executed, for example compilers, code generators and other scripts. To ensure that the output is reproducible, each program should have a deterministic behavior and not leak information about the system into the produced output artifacts (e.g. program binaries).

#### For a C program

 * Avoid `__FILE___`.
 * Avoid `__DATE__`, `__TIME__`, and `__TIMESTAMP__` (you can also disable them using the flag -D in gcc/clang).
 * Do not read uninitialized memory (msan, asan) /!\ not in openssl /!\ (if your tool is part of a toolchain)
 * Ensure to not rely on readdir() order (if your tool is part of a toolchain) - e.g. similar to how `find | cpio -o needs` a sort in the middle

#### For a Python program

 * Python does hash randomization. Anything that depends on the value of a hash is not deterministic (e.g. iterating over a hash table). Setting the environment variable PYTHONHASHSEED can disable this behavior, but the proper fix is not to depend on specific hash values.
 
 * Pyc files
   * you may also simply discard .pyc and .pyo files

#### For emacs byte code

  * elc files

## How do I make compression tools produce reproducible output?

### gzip

 * use "gzip -n"
 * `ziptime` resets timestamps in ZIP files to 2008-01-01, meant for Android APKs
 

### ar

 * Use option "D" ("Operate in deterministic mode").

### multi-threaded producers (compression, compilers etc)
Most multi-threaded software provides non predictable output which results in non reproducibility. Forcing them to run mono/single-threaded ensures the output is predictable.


# I'm interested in verifying the reproducibility of software I use - FAQ
(this section might not have any answerable questions right now...)


# I'm interested in packaging/distributing software in a reproducible way. - FAQ

# I'm a developer of a distribution and would like to make my distribution reproducible. - FAQ
* sign up for the the mailing list:
    * [https://lists.reproducible-builds.org/listinfo/rb-general](https://lists.reproducible-builds.org/listinfo/rb-general)

* talk to us on irc:
    irc.oftc.net #reproducible-builds
* link to documentation:
    * [https://reproducible-builds.org/docs/](https://reproducible-builds.org/docs/)
* link to tools:
    * [https://reproducible-builds.org/tools/](https://reproducible-builds.org/tools/)
    ** update to be non-debian-specific links
* documented known issues, bugs, etc. (currently very debian, plans to generalize for cross-distro)
    * [https://salsa.debian.org/reproducible-builds/notes.git](https://salsa.debian.org/reproducible-builds/notes.git)


# I'm interested in creating a build farm that tests the reproducibility of my distribution/project - FAQ
* how to best run the tests (parallelized?)
  * example of some imperfect helper scripts [https://github.com/bmwiedemann/reproducibleopensuse](https://github.com/bmwiedemann/reproducibleopensuse)
* where to report results, in what format?
* how frequent should tests be?
* Which parts of the build environment should be varied between builds?
  See the [test bench documentation](/docs/test-bench/)


# Common concerns about reproducible builds

## When I debug I'd like to see the full path of the sources my binary was built from
 * (Why? maybe for editing source files before compiling and testing again)
 * SOURCE_MAP_... PATH/PREFIX? is optional?

## I really need to know where and when the binary used by users has been built
 * this could be tracked in metadata outside of the shipped binary - e.g. a database mapping hash-of-binary to actual build time and place or a (build-log-)file acompanying the binary
 * once your software builds fully reproducibly, meaning you get the same binary built on every host at any time, the values do not matter anymore


How to get involved?
-----------
* how to help various projects?
* how to help with documentation?
* how to help with outreach
* how can I sponsor the effort?


OTHER QUESTIONS
===============

Instructions: Please add answers to the below questions

# What are the benefits of reproducible builds?

* see also [Use cases]({{ "/events/berlin2016/usecases/" | prepend: site.baseurl }}) session or rather the refined outcome from it


# What are yet unsolved problems in reproducible builds?




UNSORTED FAQ QUESTIONS
======================

Instructions: If you have a question you'd like to see in a Reproducible FAQ, but don't know where to add it, please write the question here.



set up website mirror on github:

 * create account on github for automatic pushes from alioth
 * setup post-receive hook to push to github mirror
   * include username/password of auto-push account
 * push to [https://github.com/reproducible-builds/website](https://github.com/reproducible-builds/website)
 * [https://www.chiliproject.org/projects/chiliproject/wiki/howto_mirror_your_git_repository_on_github](https://www.chiliproject.org/projects/chiliproject/wiki/howto_mirror_your_git_repository_on_github)

