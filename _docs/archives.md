---
title: Archive metadata
layout: docs
permalink: /docs/archives/
---

Most archive formats record metadata that will capture details about the
build environment if no care is taken. File last modification time is
obvious, but file ordering, users, groups, numeric ids, and permissions
can also be of concern. Tar will be used as the main example but these tips
apply to other archive formats as well.

File modification times
-----------------------

Most archive formats will, by default, record file last modification
times, while some will also record file creation times.

Tar has a way to specify the modification time that is used for all
archive members:

{% highlight sh %}
$ tar --mtime='2015-10-21 00:00Z' -cf product.tar build
{% endhighlight %}

(Notice how `Z` is used to specify that time is in the UTC
[timezone]({{ "/docs/timezones/" | prepend: site.baseurl }}).)

For other archive formats, it is always possible to use `touch` to reset
the modification times to a [predefined value]({{ "/docs/timestamps/" | prepend: site.baseurl }})
before creating the archive:

{% highlight sh %}
$ find build -print0 |
    xargs -0r touch --no-dereference --date="@${SOURCE_DATE_EPOCH}"
$ zip -r product.zip build
{% endhighlight %}

In some cases, it is preferable to keep the original times for files
that have not been created or modified during the build process:

{% highlight sh %}
$ find build -newermt "@${SOURCE_DATE_EPOCH}" -print0 |
    xargs -0r touch --no-dereference --date="@${SOURCE_DATE_EPOCH}"
$ zip -r product.zip build
{% endhighlight %}

A patch has been written to simplify the latter operation with GNU
Tar. It is currently available in Debian since
[tar](https://packages.qa.debian.org/tar) version 1.28-1. Hopefully it
will be integrated upstream soon, but you might want to use it with
caution. It adds a new `--clamp-mtime` flag which will only set the time
when the file is more recent than the value specified with `--mtime`:

{% highlight sh %}
# Only in Debian unstable for now
$ tar --mtime='2015-10-21 00:00Z' --clamp-mtime -cf product.tar build
{% endhighlight %}

This has the benefit of leaving the original file modification time
untouched.

File ordering
-------------

When asked to record directories, most archive formats will read their
content in the order returned by the filesystem which is [likely to be
different on every run]({{ "/docs/stable-inputs/" | prepend: site.baseurl }}).

With version 1.28, GNU Tar has gained the `--sort=name` option which will
sort filenames in a locale independent manner:

{% highlight sh %}
# Works with GNU Tar 1.28
$ tar --sort=name -cf product.tar build
{% endhighlight %}

For older versions or other archive formats, it is possible to use
`find` and `sort` to achieve the same effect:

{% highlight sh %}
$ find build -print0 | LC_ALL=C sort -z |
    tar --no-recursion --null -T - -cf product.tar
{% endhighlight %}

Care must be taken to ensure that `sort` is called in the context of the
C locale to avoid any surprises related to collation order.

Users, groups and numeric ids
-----------------------------

Depending on the archive format, the user and group owning the file
can be recorded. Sometimes it will be using a string, sometimes using
the associated numeric ids.

When files belong to predefined system groups, this is not a problem,
but builds are often performed with regular users. Recording of the
account name or its associated ids might be a source of reproducibility
issues.

Tar offers a way to specify the user and group owning the file. Using
`0`/`0` and `--numeric-owner` is a safe bet, as it will effectively
record 0 as values:

{% highlight sh %}
$ tar --owner=0 --group=0 --numeric-owner -cf product.tar build
{% endhighlight %}

Full example
------------

The recommended way to create a Tar archive is thus:

<div class="correct">
{% highlight sh %}
# requires GNU Tar 1.28+
$ tar --sort=name \
      --mtime="@${SOURCE_DATE_EPOCH}" \
      --owner=0 --group=0 --numeric-owner \
      -cf product.tar build
{% endhighlight %}
</div>

Post-processing
---------------

If tools do not support options to create reproducible archives, it is
always possible to perform post-processing.

[strip-nondeterminism](https://packages.debian.org/sid/strip-nondeterminism)
already has support to normalize Zip and Jar archives. Custom scripts
like Tor Browser's
[re-dzip.sh](https://gitweb.torproject.org/builders/tor-browser-bundle.git/tree/gitian/build-helpers/re-dzip.sh)
might also be an option.

Static libraries
----------------

Static libraries (`.a`) on Unix-like systems are *ar* archives. Like
other archive formats, they contain metadata, namely timestamps, UIDs,
GIDs, and permissions. None are actually required for using them as
libraries.

GNU `ar` and other tools from
[binutils](https://www.gnu.org/software/binutils/) have a *deterministic
mode* which will use zero for UIDs, GIDs, timestamps, and use consistent
file modes for all files. It can be made the default by passing the
`--enable-deterministic-archives` option to `./configure`. It is already
enabled by default for some distributions[^distros-with-default] and so
far it seems to be pretty safe [except for
Makefiles](https://bugs.debian.org/798804) using targets like
`archive.a(foo.o)`.

When binutils is not built with deterministic archives by default, build
systems have to be changed to pass the right options to `ar` and
friends. `ARFLAGS` can be set to `Dcvr` with many build systems to turn on the
deterministic mode. Care must also be taken to pass `-D` if `ranlib` is
used to create the function index.

Another option is post-processing with
[strip-nondeterminism](https://packages.debian.org/sid/strip-nondeterminism)
or `objcopy`:

    objcopy --enable-deterministic-archives libfoo.a

[^distros-with-default]: Debian since [version 2.25-6](https://tracker.debian.org/news/675691), Ubuntu since version 2.25-8ubuntu1. It is the default for Fedora 22 and Fedora 23, but it seems this will be [reverted in Fedora 24](https://bugzilla.redhat.com/show_bug.cgi?id=1195883).
