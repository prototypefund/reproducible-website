---
title: Developer FAQ
layout: faq
permalink: /faq/upstream/ 
---

### Why should I write reproducible software?

Writing reproducible software helps with 

### How do I write reproducible software?

Test that your software is reproducible, then look at the differences and modify your build to avoid this difference. A number of general guidelines are available in the "Achieve deterministic builds" section of [the documentation](/docs/).

### How do I test whether my software is reproducible?

Build your software once. Add a variation to the build environment which should not influence the output, for example by moving it to another path, and create a second build. Then compare the resulting binaries using the [@diffoscope@](/tools/) tool. Make sure there are no differences. See the [test bench documentation](/docs/test-bench/) for a number of parameters that can be varied.

### Can my favorite language be used to write reproducible software?

#### C

 - Avoid ```__FILE__```.
 - Avoid ```__DATE__```, ```__TIME__```, and ```__TIMESTAMP__``` (you can also disable them using the flag -D in gcc/clang).
 - Do not read uninitialized memory (msan, asan) (if your tool is part of a toolchain)
 - Ensure to not rely on ```readdir()``` order (if your tool is part of a toolchain) - e.g. similar to how ```find | cpio -o``` needs a sort in the middle

#### Python

 - Python does hash randomization. Anything that depends on the value of a hash is not deterministic (e.g. iterating over a hash table). Setting the environment variable ```PYTHONHASHSEED``` can disable this behavior, but the proper fix is not to depend on specific hash values.
 - Pyc files: you may simply discard .pyc and .pyo files

#### Emacs byte code

### Can my favorite compression tool produce deterministic output?

#### gzip

 - Use option ```-n``` (does not record timestamp)
 - ```ziptime``` resets timestamps in ZIP files to 2008-01-01, meant for Android APKs


#### ar

 - Use option ```D``` ("Operate in deterministic mode").

### Can a multi-threaded producer (e.g. compression, compiler) be reproducible?

Frequently, no. Many multi-threaded software provides non predictable output which results in non reproducibility. Forcing them to run mono/single-threaded ensures the output is predictable.
