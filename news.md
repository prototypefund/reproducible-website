---
layout: default
title: News
permalink: /news/
order: 8
---

# News

{% for post in site.posts %}

## [{{ post.title }}]({{ post.url | prepend: site.baseurl }})

<span class="text-muted">
{{ post.date | date: "%b %-d, %Y" }}
</span>

{{ post.excerpt }}

<a href="{{ post.url | prepend: site.baseurl }}" class="btn btn-outline-primary">
    Read more…
</a>
{% endfor %}
