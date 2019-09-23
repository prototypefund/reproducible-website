---
layout: default
title: News archive
permalink: /news-archive/
---

# News archive

<ul class="list-unstyled">
    {% for post in site.posts %}
    <li>
        <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        <small class="text-muted">{{ post.date | date: "%b %-d, %Y" }}</small>
    </li>
    {% endfor %}
</ul>


