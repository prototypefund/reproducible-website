---
layout: new/default
title: Reports
permalink: /reports/
order: 6
---

# Blog

Every week we publish a weekly report on what we have been up to. ([RSS/Atom feed]({{ "/blog/index.rss" | prepend: site.baseurl }}))

{% assign posts = site.blog | sort: 'week' | where_exp: 'item', 'item.published' | reverse %}

{% for x in posts %}
* [Week {{ x.week }}]({{ x.url | prepend: site.baseurl }})
{% endfor %}
