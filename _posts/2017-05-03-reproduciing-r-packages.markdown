---
layout: post
title: "Reproducing R packages"
date: 2017-05-03 12:37:58
draft: false
---

In the past couple of weeks, Ximin Luo worked on making R generate reproducible
output. This is now mostly complete, and we're waiting on feedback from
upstream about our patch. In the meantime, there are a few packages that remain
unreproducible, but the issue probably lies in those specific packages rather
than the R toolchain. Perhaps you can help out with them, after reading this!

----

R packages compile into a `.rdb` database format that contains the package's
definitions, plus a `.rdx` index file for easy lookup in the `.rdb` file.
Usually, there is a main rdb with the package contents, plus another rdb that
stores the help data. There is also a `paths.rds` (same format as `.rdx`) that
contains some more stuff.

One can actually read these files by hand using `Rscript`, see the diffoscope
code in
[rdata.py](https://salsa.debian.org/reproducible-builds/diffoscope.git/tree/diffoscope/comparators/rdata.py?h=04e39d7cb5dc2a3f9f48823bd36e531ee8428b32#n34).
If you run that, you can see that `path.rds` contains some obvious paths, but
the other files contain less obvious stuff, and in fact these scripts give
identical output for the `.rdb` files, even though they are bitwise different.
To get to the bottom of this, we'll have to use the R debugger.

Attached to this post is [a script](/blog/data/r-mini-repro-test.sh) that
smooths this process. I ran this against Debian's R packages, but it probably
also works with other distros' R packages - try it and see.

You run it like `./r-mini-repro-test.sh $pkgdir $builddir` and it will output
some hashes for you; make sure to install the build dependencies first. You
should manually vary both `$pkgdir` and `$builddir` to introduce the build-path
variations; `$builddir` can be an arbitrary string but `$pkgdir` should point
to the actual R package's source directory, so I just copy that to two
locations and point the script at each of them in turn.

Now, we can begin debugging. Before I did this, we had 478 unreproducible R
packages so the biggest problem was likely with R itself. I downloaded the
source code of both R and a small example package ([[!pkg r-cran-tensor]]), then figured
out how the R packages were actually being built. This resulted in me writing
the script above, to speed up debugging. You can read about R's debugger [here
(no HTTPS)](http://www.stats.uwo.ca/faculty/murdoch/software/debuggingR/), it's
a bit primitive but it supports the basic stuff (step, continue, where,
print/eval) and that was adequate for me.

Debugging R core
----------------

So let's take a small example with Debian R 3.4.0-1:

    $ ../r-mini-repro-test.sh r-cran-tensor-1.5 123
    [..]
    * installing *source* package ‘tensor’ ...
    ** package ‘tensor’ successfully unpacked and MD5 sums checked
    ** R
    ** preparing package for lazy loading
    ** help
    *** installing help indices
    ** building package indices
    ** testing if installed package can be loaded
    * DONE (tensor)
    [..]
    c71a766429151a13e46039f3c37a14edc704004f410c34f8f37a2f098506421d  ./debian/123/usr/lib/R/site-library/tensor/R/tensor.rdx
    736b5b4a885db71fb3fe2a538faeefe43c500c4080dbf2c75b97135b98401acd  ./debian/123/usr/lib/R/site-library/tensor/R/tensor.rdb
    8a3f9616de7ee78a83b07395dd6ec43c5259d3f1b1b653d397808fc9fc5d96c2  ./debian/123/usr/lib/R/site-library/tensor/help/tensor.rdx
    d1ac634987b24606a5da627ec073f45edce2bddf071391dd17c246a0a01eba63  ./debian/123/usr/lib/R/site-library/tensor/help/tensor.rdb
    80796cc1a2cfcac40c394153f67617d575e103a405430b8483c2261a903db046  ./debian/123/usr/lib/R/site-library/tensor/help/paths.rds
    $ ../r-mini-repro-test.sh r-cran-tensor-1.5 1234
    [..]
    5f081f4d6f9da1fbe06e374067e6636d926de4cdf09886058b15c5928c636c0d  ./debian/1234/usr/lib/R/site-library/tensor/R/tensor.rdx
    7145669891e1b766ca0d8d89fa9c317af716e61a62650abe3a11a848240f1d57  ./debian/1234/usr/lib/R/site-library/tensor/R/tensor.rdb
    8a3f9616de7ee78a83b07395dd6ec43c5259d3f1b1b653d397808fc9fc5d96c2  ./debian/1234/usr/lib/R/site-library/tensor/help/tensor.rdx
    d1ac634987b24606a5da627ec073f45edce2bddf071391dd17c246a0a01eba63  ./debian/1234/usr/lib/R/site-library/tensor/help/tensor.rdb
    80796cc1a2cfcac40c394153f67617d575e103a405430b8483c2261a903db046  ./debian/1234/usr/lib/R/site-library/tensor/help/paths.rds

The files are created by the `** preparing package for lazy loading` and `**
help` steps. In retrospect this seems somewhat obvious from the output, but I
had never done R before so I spent a while using `strace` to be sure; one can
see that those files are indeed written to after those strings are printed.

Then we can grep the R source code for these strings.

    r-base-3.4.0$ grep -Ri "preparing package for lazy loading" src
    src/library/tools/R/install.R:                starsmsg(stars, "preparing package for lazy loading")

Reading the file, we see that this happens in the `tools:::.install_packages`
function, and reading it further we see that it calls `makeLazyLoading` then
`code2LazyLoadDB` then `makeLazyLoadDB`. Seems promising, let's confirm it
before chasing potential wild geese.

**Important**: In the rest of these command-line outputs I'll prepend what I
input with `>>>` but this doesn't actually get printed by `Rscript`. So don't
be surprised that you don't see these, when you're trying to recreate my steps.

Also I am a total R noob so possibly there are more elegant ways to do what I'm
about to show you; this is what I came up with after 2-3 hours of research.

    $ DEBUG=1 ../r-mini-repro-test.sh r-cran-tensor-1.5 123
    enter (some or all of) the following into R:
    [.. helpful commands ..]
    + R_DEFAULT_PACKAGES= LC_COLLATE=C /usr/lib/R/bin/R --no-restore --slave --args nextArg-lnextArgdebian/123/usr/lib/R/site-librarynextArg-dnextArg.nextArg--built-timestamp="Thu, 01 Jan 1970 00:00:00 +0000"
    >>> debug(tools:::makeLazyLoadDB)
    >>> tools:::.install_packages()
    processing ‘.’
    [..]
    ** preparing package for lazy loading
    debugging in: makeLazyLoadDB(ns, dbbase, compress = compress)
    debug: {
    [.. source code of makeLazyLoadDB, not yet run ..]
    }

OK so we just entered the function and it's paused, in a separate shell let's check what it's doing:

    $ find r-cran-tensor-1.5 -name '*.rdb'
    [ no output ]

So, no files have been written yet, which means none of the parent functions
did anything, we are in the right function (or it's in a child). If we continue
the function, we get:

    >>> c
    exiting from: makeLazyLoadDB(ns, dbbase, compress = compress)
    ** help
    debugging in: makeLazyLoadDB(db, file.path(manOutDir, basename(outDir)))
    debug: {
    [.. source code of makeLazyLoadDB, not yet run ..]
    }

    $ find r-cran-tensor-1.5 -name '*.rdb'
    r-cran-tensor-1.5/debian/123/usr/lib/R/site-library/tensor/R/tensor.rdb

Then continuing again:

    >>> c
    exiting from: makeLazyLoadDB(db, file.path(manOutDir, basename(outDir)))
    *** installing help indices
    ** building package indices
    ** testing if installed package can be loaded
    * DONE (tensor)

    $ find r-cran-tensor-1.5 -name '*.rdb'
    r-cran-tensor-1.5/debian/123/usr/lib/R/site-library/tensor/help/tensor.rdb
    r-cran-tensor-1.5/debian/123/usr/lib/R/site-library/tensor/R/tensor.rdb

So it seems likely this function is the correct one. After reading the source
code of `makeLazyLoadDB`, even though I don't understand the whole thing, it
looks like possibly this part is the one that does the actual writing:

        for (i in seq_along(vars)) {
            key <- if (is.null(from) || is.environment(from))
                lazyLoadDBinsertVariable(vars[i], from, datafile,
                                         ascii, compress,  envhook)
            else lazyLoadDBinsertListElement(from, i, datafile, ascii,
                                             compress, envhook)
            assign(vars[i], key, envir = varenv)
        }

So let's step through it and see if the data contains any paths.

    $ DEBUG=1 ../r-mini-repro-test.sh r-cran-tensor-1.5 123
    [..]
    >>> debug(tools:::makeLazyLoadDB)
    >>> tools:::.install_packages()
    processing ‘.’
    [..]
    ** preparing package for lazy loading
    debugging in: makeLazyLoadDB(ns, dbbase, compress = compress)
    debug: {
    [.. source code of makeLazyLoadDB, not yet run ..]
    }
    >>>                                                                             # pressing <Enter> just means "step"
    debug: ascii <- as.logical(ascii)                                               # this is the first line of the function
    >>>                                                                             # keep stepping
    [..]
    >>>
    debug: for (i in seq_along(vars)) {
    [.. source code of the inside of the block, not yet run ..]
    }
    >>>
    debug: key <- if (is.null(from) || is.environment(from)) lazyLoadDBinsertVariable(vars[i],
        from, datafile, ascii, compress, envhook) else lazyLoadDBinsertListElement(from,
        i, datafile, ascii, compress, envhook)
    >>>
    debug: lazyLoadDBinsertVariable(vars[i], from, datafile, ascii, compress,
        envhook)                                                                    # not yet run

If we look at the source code we see that it will try to insert the value of
`.Internal(getVarsFromFrame(vars[i], from, FALSE))\[[1L]]` into the file, so let's evaluate it:

    >>> .Internal(getVarsFromFrame(vars[i], from, FALSE))\[[1L]]
    function (x, y)
    tensor(x, y, 2, 2)
    <environment: namespace:tensor>
    >>> typeof(.Internal(getVarsFromFrame(vars[i], from, FALSE))\[[1L]])
    [1] "closure"
    >>> environment(.Internal(getVarsFromFrame(vars[i], from, FALSE))\[[1L]])        # get the environment of a closure
    <environment: namespace:tensor>
    >>> envlist(environment(.Internal(getVarsFromFrame(vars[i], from, FALSE))\[[1L]])) # environment as an envlist, more detailed output
    $`%*t%`
    function (x, y)
    tensor(x, y, 2, 2)
    <environment: namespace:tensor>

    $`%t*%`
    function (x, y)
    tensor(x, y, 1, 1)
    <environment: namespace:tensor>

    $`%t*t%`
    function (x, y)
    tensor(x, y, 1, 2)
    <environment: namespace:tensor>

    $.__NAMESPACE__.
    <environment: 0x55eb55d00be0>

    $.__S3MethodsTable__.
    <environment: 0x55eb55d166e8>

    $.packageName
    [1] "tensor"

    $tensor
    function (A, B, alongA = integer(0), alongB = integer(0))
    {
    [.. function definition ..]
    }
    <environment: namespace:tensor>

Nothing obviously containing paths so far, let's keep stepping and dumping the objects

    >>>
    debug: assign(vars[i], key, envir = varenv)
    >>>                                                                             # next iteration now
    debug: key <- if (is.null(from) || is.environment(from)) lazyLoadDBinsertVariable(vars[i],
        from, datafile, ascii, compress, envhook) else lazyLoadDBinsertListElement(from,
        i, datafile, ascii, compress, envhook)
    >>>
    debug: lazyLoadDBinsertVariable(vars[i], from, datafile, ascii, compress,
        envhook)
    >>> .Internal(getVarsFromFrame(vars[i], from, FALSE))\[[1L]]
    function (x, y)
    tensor(x, y, 1, 1)
    <environment: namespace:tensor>
    >>>
    [.. more stepping ..]
    debug: lazyLoadDBinsertVariable(vars[i], from, datafile, ascii, compress,
        envhook)
    >>> .Internal(getVarsFromFrame(vars[i], from, FALSE))\[[1L]]
    <environment: 0x55eb55d00be0>
    >>> envlist(.Internal(getVarsFromFrame(vars[i], from, FALSE))\[[1L]])
    $S3methods
         [,1] [,2] [,3]

    $dynlibs
    NULL

    $exports
    <environment: 0x55eb55d0a4f8>

    $imports
    $imports$base
    [1] TRUE


    $lazydata
    <environment: 0x55eb55d0a178>
    attr(,"name")
    [1] "lazydata:tensor"

    $path
    [1] "/mystupidbuildpath/r-tests/r-cran-tensor-1.5/debian/123/usr/lib/R/site-library/tensor"

    $spec
        name  version
    "tensor"    "1.5"

Oh, here we go. (In fact we could have got this earlier, it was part of the
`.__NAMESPACE__.` key of the first environment that we examined.) Naturally,
you'll sometimes miss stuff, and sometimes go down dead ends when doing
something like this, perseverance is important.

The names are also a hint, after grepping the R source code for names like
"S3methods" and "lazydata" we see that `src/library/base/R/namespace.R` is the
only one that contains all of them, then reading that code in more depth
reveals [this](https://sources.debian.net/src/r-base/3.4.0-1/src/library/base/R/namespace.R/#L252).

After patching it, rebuilding r-base, installing this patched version, then
running our tests again, we see that we've eliminated differences in the main
rdb file but not the help rdb file. :(

In fact, after some more time stepping through the loop repeatedly and printing
out all the objects, nothing obvious shows up. Time to re-read the source code
of `makeLazyLoadDB`. We notice that all the `lazyLoadDBinsert*` functions have
a `hook` parameter that we haven't been stepping through because it's in a
separate function. So let's do that. Since it's an inner function, one has to
call `debug()` inside `makeLazyLoadDB`:

    $ DEBUG=1 ../r-mini-repro-test.sh r-cran-tensor-1.5 123
    [..]
    >>> debug(tools:::makeLazyLoadDB)
    >>> tools:::.install_packages()
    processing ‘.’
    [..]
    ** preparing package for lazy loading
    debugging in: makeLazyLoadDB(ns, dbbase, compress = compress)
    debug: {
    [.. source code of makeLazyLoadDB, not yet run ..]
    }
    >>> c
    exiting from: makeLazyLoadDB(ns, dbbase, compress = compress)
    ** help
    debugging in: makeLazyLoadDB(db, file.path(manOutDir, basename(outDir)))
    debug: {
    [.. source code of makeLazyLoadDB, not yet run ..]
    }
    [.. stepping through the function ..]
    debug: envhook <- function(e) {
    [.. function definition ..]
    }
    >>>                                                                             # step next, to define that function
    [.. next statement, we don't care about it ..]
    >>> debug(envhook)
    [.. then keep stepping through makeLazyLoadDB ..]
    >>>
    debug: lazyLoadDBinsertVariable(vars[i], from, datafile, ascii, compress,
        envhook)
    [.. then keep stepping through makeLazyLoadDB ..]
    debug: lazyLoadDBinsertVariable(vars[i], from, datafile, ascii, compress,
        envhook)
    [.. hook wasn't run for these previous iterations for some reason, but keep stepping ..]
    [.. eventually we get ..]

    debugging in: (function (e)
    {
    [.. function definition ..]
    })(<environment>)                                                               # "(..)(<environment>)" is R's name for that function (actually a closure)
    debug: {
    [.. source code, not yet run ..]
    }
    >>> e
    /mystupidbuildpath/r-tests/r-cran-tensor-1.5/man/tensor.Rd
    >>> typeof(e)
    [1] "environment"
    >>> envlist(e)
    $Enc
    [1] "UTF-8"

    $encoding
    [1] ""

    $filename
    [1] "/mystupidbuildpath/r-tests/r-cran-tensor-1.5/man/tensor.Rd"

    $timestamp
    [1] "2002-01-16 11:51:14 CET"

    $wd
    [1] "/mystupidbuildpath/r-tests/r-cran-tensor-1.5"

After doing the same thing as before, i.e. grepping the R source code for "Enc"
"timestamp" etc, we spot a [few different places](https://sources.debian.net/src/r-base/3.4.0-1/src/library/base/R/srcfile.R/)
that are setting the `wd` field.

Then after some experimenting, we find that overwriting this in a different
file (`src/library/tools/R/parseRd.R`) seems to work to get rid of this
unreproducibility. (This may not be the best; our exact strategy is still being
discussed with upstream, but at least we know which areas of the code are
responsible.)

Exercise for the reader to figure out how to get rid of the `paths.rds`
difference. After doing the previous two, this one is fairly easy.

These three issues allowed us to write a [preliminary
patch](https://stat.ethz.ch/pipermail/r-devel/2017-April/074138.html) that
enabled us to reproduce
[r-cran-tensor](https://tests.reproducible-builds.org/debian/rb-pkg/unstable/amd64/r-cran-tensor.html).

    $ ./r-mini-repro-test.sh r-cran-tensor-1.5 123
    [..]
    bca9de1351ab265475cf6f1af3f6aff49bde1d209e8fafb33954caa8d90f3462  ./debian/123/usr/lib/R/site-library/tensor/R/tensor.rdx
    ac7fffeb751ffc2d13c5317704b19787a7078446d97d1c6f259c93f282e04cef  ./debian/123/usr/lib/R/site-library/tensor/R/tensor.rdb
    d989603340d1e8f14c35551ef379956653bf3b6e7b1868b4bf9a66d85820998e  ./debian/123/usr/lib/R/site-library/tensor/help/tensor.rdx
    30e543cda9f97c202dc9c0291933940dfe71b94d352f66d8ed6c035c1a722b41  ./debian/123/usr/lib/R/site-library/tensor/help/tensor.rdb
    e9f78ba2cca39a6face1ed88fce4bb718d911d567d01db49bc00a3011720ac50  ./debian/123/usr/lib/R/site-library/tensor/help/paths.rds
    $ ./r-mini-repro-test.sh r-cran-tensor-1.5 1234
    [..]
    bca9de1351ab265475cf6f1af3f6aff49bde1d209e8fafb33954caa8d90f3462  ./debian/1234/usr/lib/R/site-library/tensor/R/tensor.rdx
    ac7fffeb751ffc2d13c5317704b19787a7078446d97d1c6f259c93f282e04cef  ./debian/1234/usr/lib/R/site-library/tensor/R/tensor.rdb
    d989603340d1e8f14c35551ef379956653bf3b6e7b1868b4bf9a66d85820998e  ./debian/1234/usr/lib/R/site-library/tensor/help/tensor.rdx
    30e543cda9f97c202dc9c0291933940dfe71b94d352f66d8ed6c035c1a722b41  ./debian/1234/usr/lib/R/site-library/tensor/help/tensor.rdb
    e9f78ba2cca39a6face1ed88fce4bb718d911d567d01db49bc00a3011720ac50  ./debian/1234/usr/lib/R/site-library/tensor/help/paths.rds
    $ ./r-mini-repro-test.sh r-cran-tensor 1234
    [..]
    bca9de1351ab265475cf6f1af3f6aff49bde1d209e8fafb33954caa8d90f3462  ./debian/1234/usr/lib/R/site-library/tensor/R/tensor.rdx
    ac7fffeb751ffc2d13c5317704b19787a7078446d97d1c6f259c93f282e04cef  ./debian/1234/usr/lib/R/site-library/tensor/R/tensor.rdb
    d989603340d1e8f14c35551ef379956653bf3b6e7b1868b4bf9a66d85820998e  ./debian/1234/usr/lib/R/site-library/tensor/help/tensor.rdx
    30e543cda9f97c202dc9c0291933940dfe71b94d352f66d8ed6c035c1a722b41  ./debian/1234/usr/lib/R/site-library/tensor/help/tensor.rdb
    e9f78ba2cca39a6face1ed88fce4bb718d911d567d01db49bc00a3011720ac50  ./debian/1234/usr/lib/R/site-library/tensor/help/paths.rds


Testing the patch
-----------------

Of course r-cran-tensor is just 1 package, so then we tested this patch on all
478 [tagged R
packages](https://tests.reproducible-builds.org/debian/issues/unstable/randomness_in_r_rdb_rds_databases_issue.html).
Before the patch, all of these were unreproducible. Now 463/478 are
reproducible, hurray!

The first version of the patch made 2 packages FTBFS ("fail to build from
source"), [[!pkg r-bioc-biobase]] and [[!pkg r-cran-shinybs]]; this was fixed
in a subsequent version of the patch. (Some other packages, [[!pkg
r-cran-randomfields]] [[!pkg r-cran-randomfieldsutils]], FTBFS even with an
unpatched r-base, due to differences between 3.3.3 and 3.4.0 ([[!bug 861333]]),
and not because of our patch.)

Given the overwhelming proportion of packages that *did* reproduce, the other
14 packages that are still unreproducible, are quite probably due to issues in
those specific packages. Only 2 of these are certainly due to build-path
differences: [[!pkg r-cran-runit]] [[!pkg r-cran-rinside]]. This is because, we
currently see they are reproducible in Debian testing but not Debian unstable.
This is slightly misleading, the real reason is not testing vs unstable
directly; rather the fact that we (at the time of writing) use the same build
path when trying to reproduce Debian testing packages, and different paths for
unstable. The other 12 are unreproducible in both testing and unstable, so it
either suffers from a non-build-path issue as well as a build-path issue, or
only a non-build-path issue.

So, further investigation *of each package* is needed. This is where you can
help. :)


Debugging R packages
--------------------

To investigate why (for example) [[!pkg r-cran-runit]] doesn't reproduce
despite our patches, we just do the above process again:

    $ DEBUG=1 ../r-mini-repro-test.sh r-cran-runit
    [..]
    >>> debug(tools:::makeLazyLoadDB)
    >>> tools:::.install_packages()
    processing ‘.’
    a directory
    * build_help_types=
    * DBG: 'R CMD INSTALL' now doing do_install()
    * created lock directory ‘/mystupidbuildpath/r-tests/r-cran-runit/debian/r-cran-runit/usr/lib/R/site-library/00LOCK-r-cran-runit’
    * installing *source* package ‘RUnit’ ...
    ** package ‘RUnit’ successfully unpacked and MD5 sums checked
    ** backing up earlier installation
    ** R
    ** inst
    ** preparing package for lazy loading
    debugging in: makeLazyLoadDB(ns, dbbase, compress = compress)
    debug: {
    [.. source code of makeLazyLoadDB ..]
    }

We know our unreproducibility is with the help files and not the main package,
so `c` to skip this part:

    >>> c
    exiting from: makeLazyLoadDB(ns, dbbase, compress = compress)
    ** help
    debugging in: makeLazyLoadDB(db, file.path(manOutDir, basename(outDir)))
    debug: {
    [.. source code of makeLazyLoadDB ..]
    }

Examine the "from" object, grep the output for our builddir

    >>> from
    $`RUnit-internal`
    [..]
    $`RUnit-intro`
    [..]
    [.. etc ..]
    [..]
    $checkFuncs
    \title{RUnit check [..]
    [..]
      For a simple example see the provided test cases in
      /mystupidbuildpath/r-tests/r-cran-runit/debian/r-cran-runit/usr/lib/R/site-library/RUnit/examples/runitVirtualClassTest.r.
    [..]

Found it, now we quit, patch the source code, and try again.

    >>> Q
    [..]
    exit code 1
    [.. hack hack hack ..]
    $ ../r-mini-repro-test.sh r-cran-runit-0.4.31/ 123
    [..]
    01347305351a45bb88dab909c56942498e97f5edbe583cf6ab1327138914e315  ./debian/123/usr/lib/R/site-library/RUnit/R/RUnit.rdx
    ecde40bdfac5b070acc30a0d5889d9d7f65418844d14312aceff6af5b9d0bf7a  ./debian/123/usr/lib/R/site-library/RUnit/R/RUnit.rdb
    182d38ac5adc160eb9edd40d5bd7e27b95b756b8f14cee7d912ba4745ae81bdc  ./debian/123/usr/lib/R/site-library/RUnit/help/RUnit.rdx
    f8a9f22acc9f937cb47a92f3979d619e83a791ad734796c2fcd9d0a34e1f11ca  ./debian/123/usr/lib/R/site-library/RUnit/help/RUnit.rdb
    5c37672fdc1f325b8a3846f4eafd2624b246ec70ce01d197134fa1b97a9ee849  ./debian/123/usr/lib/R/site-library/RUnit/help/paths.rds
    $ ../r-mini-repro-test.sh r-cran-runit-0.4.31/ 1234
    [..]
    01347305351a45bb88dab909c56942498e97f5edbe583cf6ab1327138914e315  ./debian/1234/usr/lib/R/site-library/RUnit/R/RUnit.rdx
    ecde40bdfac5b070acc30a0d5889d9d7f65418844d14312aceff6af5b9d0bf7a  ./debian/1234/usr/lib/R/site-library/RUnit/R/RUnit.rdb
    182d38ac5adc160eb9edd40d5bd7e27b95b756b8f14cee7d912ba4745ae81bdc  ./debian/1234/usr/lib/R/site-library/RUnit/help/RUnit.rdx
    f8a9f22acc9f937cb47a92f3979d619e83a791ad734796c2fcd9d0a34e1f11ca  ./debian/1234/usr/lib/R/site-library/RUnit/help/RUnit.rdb
    5c37672fdc1f325b8a3846f4eafd2624b246ec70ce01d197134fa1b97a9ee849  ./debian/1234/usr/lib/R/site-library/RUnit/help/paths.rds

Works! All finished. :) If yours doesn't, just repeat the above loop; hopefully
eventually you'll get there.
