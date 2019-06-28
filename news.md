---
layout: default
title: News
permalink: /news/
order: 1
---

# News

<br>

<ul class="list-unstyled">
    {% for post in site.posts limit: 4 %}
    <li>
        <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        <small class="text-muted">{{ post.date | date: "%b %-d, %Y" }}</small>
    </li>
    {% endfor %}
</ul>

## Reports

Every month we publish a report on what we have been up to. ([RSS/Atom feed]({{ "/blog/index.rss" | prepend: site.baseurl }}))

{% assign reports = site.reports | sort: 'year, month' | where: 'draft', 'false' | reverse %}
{% for x in reports %}
* [{{ x.title }}]({{ x.url | prepend: site.baseurl }})
{% endfor %}

## Weekly reports

We previously published weekly reports on what we have been up to:

{% assign posts = site.blog | sort: 'published' | reverse %}
{% for x in posts %}
* [Week {{ x.week }}]({{ x.url | prepend: site.baseurl }})
{% endfor %}
