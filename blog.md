---
layout: new/markdown
title: Blog
permalink: /blog/
order: 5
---

# Blog

Every week we publish a weekly report on what we have been up to. ([RSS/Atom feed]({{ "/blog/index.rss" | prepend: site.baseurl }}))

{% assign by_week = site.blog | sort: 'week' | reverse %}

{% for page in by_week %}
{% if page.published %}
* [Week {{ page.week }}]({{ "/blog/posts/" | append: page.week | append: "/" | prepend: site.baseurl }})
{% endif %}
{% endfor %}
