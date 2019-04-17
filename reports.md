---
layout: new/default
title: Reports
permalink: /reports/
order: 6
---

{% assign reports = site.reports | sort: 'year,month' | where_exp: 'item', 'item.published' | reverse %}

{% if reports.size > 0 %}

# Reports
Every month we publish a report on what we have been up to. ([RSS/Atom feed]({{ "/blog/index.rss" | prepend: site.baseurl }}))

{% for x in reports %}
* [{{ x.title }}]({{ x.url | prepend: site.baseurl }})
{% endfor %}

## Weekly reports

We previously published weekly reports on what we have been up to:
{% else %}

# Blog

Every week we publish a weekly report on what we have been up to. ([RSS/Atom feed]({{ "/blog/index.rss" | prepend: site.baseurl }}))

{% endif %}

{% assign posts = site.blog | sort: 'week' | where_exp: 'item', 'item.published' | reverse %}

{% for x in posts %}
* [Week {{ x.week }}]({{ x.url | prepend: site.baseurl }})
{% endfor %}
