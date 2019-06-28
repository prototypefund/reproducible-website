---
title: Timezones
layout: new/docs
permalink: /docs/timezones/
---

Unless the build timezone is [made part of the build environment]({{ "/docs/perimeter/" | prepend: site.baseurl }}),
care must be taken to get the build output when the build is run in two
different timezones.

Avoid writing the current timezone
----------------------------------

Some tools will write date and time with the associated timezone:

<div class="wrong">
{% highlight sh %}
$ LC_ALL=C date -d'@2147483647' --rfc-2822
Tue, 19 Jan 2038 04:14:07 +0100
{% endhighlight %}
</div>

Despite being given a pre-determined time in the form of a [Unix
time](https://en.wikipedia.org/wiki/Unix_time) (also called *epoch*),
this output would fail to be reproducible in a different timezone
than UTC+0100. The easy solution is to set the required environment
variable to force tools to use UTC as the timezone:

<div class="correct">
{% highlight sh %}
$ LC_ALL=C date -u -d'@2147483647' --rfc-2822
Tue, 19 Jan 2038 03:14:07 +0000
{% endhighlight %}
</div>

When there is no dedicated option, it is most often possible to set the `TZ`
environment variable:

<div class="correct">
{% highlight sh %}
$ TZ=UTC LC_ALL=C date -d'@2147483647' --rfc-2822
Tue, 19 Jan 2038 03:14:07 +0000
{% endhighlight %}
</div>

A related concern is for formats which don't contain timezone
information. Zip archives are a good example: the same timezone must
always be used to unpack them to prevent variations on the file
modification times.

Use date string with timezone information
-----------------------------------------

Time strings like “Wed, 21 Oct 2015 11:18:50” are inherently ambiguous.
Which timezone does it use? How should it be understood?

In the context of reproducible builds, it's best if time strings all
contain timezone information. A fallback option is to assume they are all
specified as UTC.

If time strings without timezone specification are parsed in the
timezone of the build system, hard to understand behavior might happen.
An example is doing time difference computations in timezones
with different daylight saving changes. As different timezones have
different policies, a user might get more or less hours depending on
the timezone used to perform the build.
