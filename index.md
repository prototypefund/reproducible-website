---
layout: new/no_sidebar
title: Home
title_head: Reproducible Builds &mdash; a set of software development practices that create an independently-verifiable path from source to binary code
order: 0
---

<div class="text-center mt-md-5">
    <a href="{{ "/" | prepend: site.baseurl }}">
        <img class="img-fluid" src="{{ "/assets/images/index/header-logo.png" | prepend: site.baseurl }}" alt="Reproducible Builds" style="height: 150px;" />
    </a>

    <p class="lead mt-3 mt-md-5 mx-md-5 px-md-5">
        <strong>Reproducible builds</strong> are a set of software development
        practices that create an independently-verifiable path from source
        to binary&nbsp;code.

        <small class="d-none d-sm-inline">
            (<a href="{{ "/docs/definition/" | prepend: site.baseurl }}">more</a>)
        </small>
    </p>
</div>

{% include new/nav_buttons.html %}

## Why does it matter?

Whilst anyone can inspect the source code of free and open source software for
malicious flaws, most software is distributed pre-compiled with no method to
confirm whether they correspond.

This incentivises attacks on developers who release software, not only via
traditional exploitation, but also in the forms of political influence,
blackmail or even threats of violence.

This is particularly a concern for developers collaborating on privacy or
security software: attacking these typically result in compromising
particularly politically-sensitive targets such as dissidents, journalists and
whistleblowers, as well as anyone wishing to communicate securely under a
repressive regime.

Whilst individual developers are a natural target, it additionally encourages
attacks on build infrastructure as an successful attack would provide access to
a large number of downstream computer systems. By modifying the generated
binaries here instead of modifying the upstream source code, illicit changes
are essentially invisible to its original authors and users alike.

The motivation behind the **Reproducible Builds** project is therefore to allow
verification that no vulnerabilities or backdoors have been introduced during
this compilation process. By promising **identical results** are always
generated from a given source, this allows **multiple third parties** to come
to a consensus on a "correct" result, highlighting any deviations as suspect
and worthy of scrutiny.

This ability to notice if a developer has been compromised then
deters such threats or attacks ocurring in the first place as any
compromise would be quickly detected. This offers comfort to front-liners
that they not only can be threatened, but they would not be co-erced into
exploiting or exposing their colleagues or end-users.

[Several free software projects]({{ "/who/" | prepend: site.baseurl }})
already, or will soon, provide reproducible builds.

## How?

First, the **build system needs to be made entirely deterministic**:
transforming a given source must always create the same result. For example,
the current date and time must not be recorded and output always has to be
written in the same order.

Second, the set of tools used to perform the build and more generally the
**build environment** should either be **recorded or pre-defined**.

Third, users should be given a way to recreate a close enough build
environment, perform the build process, and **validate that the output matches
the original build**.

Learn more about [how to make your software build reproducibly…]({{ "/docs" | prepend: site.baseurl }})

## News

<ul class="list-unstyled">
    {% assign by_week = site.blog | sort: "week" | reverse  %}
    {% for page in by_week limit: 2 %}
    {% if page.published %}
    <li>
        <span class="text-muted">{{ page.published | date: "%b %-d, %Y" }}</span>:
        <a href="{{ "/blog/posts/" | append: page.week | append: "/" | prepend: site.baseurl }}">Reproducible Builds: Weekly report #{{ page.week }}</a>
    </li>
    {% endif %}
    {% endfor %}

    {% for post in site.posts limit: 3 %}
    <li>
        <span class="text-muted">{{ post.date | date: "%b %-d, %Y" }}</span>:
        <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </li>
    {% endfor %}
</ul>

<br>

{% include new/nav_buttons.html %}
