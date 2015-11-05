---
title: Locales
layout: docs
permalink: /docs/locales/
---

The locale of the build system might affect the build products. While
it is important that developers have access to error messages in the
language of their choice, tools which output is influenced by the
current locale can make locale a source of reproducibility issues.

There are many aspects regarding locales (see [GNU libc locale(1)
manpage](http://manpages.debian.org/locale)). The ones that follow are the
most important ones to consider in the context of reproducible builds.

Time format
-----------

Several common time formatting functions will have output depending
on the current locale. On POSIX system the formatting will depend on
the `LC_CTIME` environment variable, which can be overridden by
`LC_ALL`.

For build systems, it's thus best to use `LC_ALL` directly:

<div class="correct">
{% highlight sh %}
$ LC_ALL=C date -u -d '2015-10-21'
Wed Oct 21 00:00:00 UTC 2015
{% endhighlight %}
</div>

The system [timezone]({{ "/docs/timezones/" | prepend: site.baseurl }})
and `TZ` environment variable will also affect the output of time
formatting functions.

Collation order
---------------

Common sorting functions are affected by the `LC_COLLATE` environment
variable, which can which can be overridden by `LC_ALL`. Some locales can
be quite surprising:

This typically shows when using `sort`. The `fr_FR` locale will sort
independently of the character case:

<div class="wrong">
{% highlight sh %}
$ echo B a c | tr ' ' '\n' | LC_ALL=fr_FR.UTF-8 sort
a
B
c
{% endhighlight %}
</div>

The `C` locale will sort according to the byte values and is always
available:

<div class="correct">
{% highlight sh %}
$ echo B a c | tr ' ' '\n' | LC_ALL=C sort
B
a
c
{% endhighlight %}
</div>

Default character encoding
--------------------------

The default system character encoding will affect both the input and
output of many tools. It is defined using the `LC_CTYPE` environment
variable, and can also be overridden using `LC_ALL`.

Here's an example when using `lynx` to convert HTML documentation into
text:

<div class="wrong">
{% highlight sh %}
LC_ALL=fr_FR lynx -dump -width 72 docs.html | file -
/dev/stdin: ISO-8859 text
{% endhighlight %}
</div>

The `C.UTF-8` pseudo-locale can always be used to get the default strings with
UTF-8 output:

<div class="correct">
{% highlight sh %}
LC_ALL=C.UTF-8 lynx -dump -width 72 docs.html | file -
/dev/stdin: UTF-8 Unicode text
{% endhighlight %}
</div>
