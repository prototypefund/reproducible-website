---
title: Stable order for inputs
layout: docs
permalink: /docs/stable-inputs/
---

If building your software requires processing several inputs at once,
make sure the order is stable accross builds.

A typical example is creating an archive from the content of a
directory. Most filesystems do not guarantee that listing files in a
directory will always result in the same order.

Example Makefile
----------------

The following `Makefile` will result in unreproducible
builds[^sorted-wildcard]:

<div class="wrong">
{% highlight makefile %}
SRCS = $(wildcard *.c)
tool: $(SRCS:.c=.o)
	$(CC) -o $@ $^
{% endhighlight %}
</div>

Solutions:

a) List all inputs explicitely and ensure they will be processed in that order.

<div class="correct">
{% highlight makefile %}
SRCS = util.c helper.c main.c
tool: $(SRCS:.c=.o)
	$(CC) -o $@ $^
{% endhighlight %}
</div>

b) Sort inputs:

<div class="correct">
{% highlight makefile %}
SRCS = $(sort $(wildcard *.c))
tool: $(SRCS:.c=.o)
	$(CC) -o $@ $^
{% endhighlight %}
</div>

[^sorted-wildcard]: GNU Make used to sort the output of the [wildcard](https://www.gnu.org/software/make/manual/html_node/Wildcard-Function.html#Wildcard-Function) function until version 3.82.

Watch out for locale-related issues
-----------------------------------

When sorting inputs, one must ensure that the sorting order is not affected by
the system locale settings. For example, some locale will not make differences
between uppercase and lowercase.

For example, `tar` will by default use the filesystem order when
descending directories:

<div class="wrong">
{% highlight sh %}
$ tar -cf archive.tar src
{% endhighlight %}
</div>

A solution is to use `find` and `sort` but the following might still
have differences when run under different locales:

<div class="wrong">
{% highlight sh %}
$ find src -print0 | sort -z |
    tar --null -T - --no-recursion -cf archive.tar
{% endhighlight %}
</div>

The locale used to sort files must be specified to avoid any surprises:

<div class="correct">
{% highlight sh %}
$ find src -print0 | LC_ALL=C sort -z |
    tar --null -T - --no-recursion -cf archive.tar
{% endhighlight %}
</div>

This might not be the only changes required for [Tar and other archive
formats]({{ "/docs/archives/" | prepend: site.baseurl }}) as they
usually embed more metadata.
problems.
