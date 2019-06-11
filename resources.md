---
layout: new/default
title: Talks & Resources
permalink: /resources/
order: 2
---

# Talks & Resources

## Contribute

Find out how to contribute on our [Contribute]({{ "/contribute/" | prepend: site.baseurl }}) page.

## Talks

{% for x in site.data.presentations %}
{% assign slug = x.title | append: "-" | append: x.event.date | slugify %}

<div class="pt-3" id="{{ slug }}"></div>

*{{ x.title }}* [&#182;](#{{ slug }})<br>by {{ x.presented_by }}<br>
[{{ x.event.name }}]({{ x.event.url }}) &bull; {{ x.event.location }} {% if x.event.date %}&bull; {{ x.event.date | date: "%-d %B %Y" }}{% endif %}

{% if x.video.url %}<a href="{{ x.video.url }}" class="btn btn-sm btn-outline-primary">Video</a>{% endif %}
{% if x.video.youtube %}<a href="https://www.youtube.com/watch?v={{ x.video.youtube }}" class="btn btn-sm btn-outline-primary">YouTube</a>{% endif %}
{% if x.video.slides %}<a href="{{ x.slides }}" class="btn btn-sm btn-outline-primary">Slides</a>{% endif %}

{% endfor %}

## Slides

We store all of our presentations in PDF or HTML form
[here](/_lfs/presentations). We also have [the original sources available in Git](https://salsa.debian.org/reproducible-builds/reproducible-presentations).
