---
layout: default
title: News
permalink: /news/
order: 5
---

# News

<ul class="list-unstyled">
    {% for post in site.posts %}
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

Previously, since 2015, we published 206 weekly reports on what we had been up to:

{% assign posts = site.blog | sort: 'published' | reverse %}
{% for x in posts %}<a href="{{ x.url | prepend: site.baseurl }}" class="btn btn-outline-primary btn-sm mr-1 mb-1">{{ x.week }}</a>{% endfor %}
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_47/" class="btn btn-outline-primary btn-sm mr-1 mb-1">47</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_46/" class="btn btn-outline-primary btn-sm mr-1 mb-1">46</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_45/" class="btn btn-outline-primary btn-sm mr-1 mb-1">45</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_44/" class="btn btn-outline-primary btn-sm mr-1 mb-1">44</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_43/" class="btn btn-outline-primary btn-sm mr-1 mb-1">43</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_42/" class="btn btn-outline-primary btn-sm mr-1 mb-1">42</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_41/" class="btn btn-outline-primary btn-sm mr-1 mb-1">41</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_40/" class="btn btn-outline-primary btn-sm mr-1 mb-1">40</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_39/" class="btn btn-outline-primary btn-sm mr-1 mb-1">39</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_38/" class="btn btn-outline-primary btn-sm mr-1 mb-1">38</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_37/" class="btn btn-outline-primary btn-sm mr-1 mb-1">37</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_36/" class="btn btn-outline-primary btn-sm mr-1 mb-1">36</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_35/" class="btn btn-outline-primary btn-sm mr-1 mb-1">35</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_34/" class="btn btn-outline-primary btn-sm mr-1 mb-1">34</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_33/" class="btn btn-outline-primary btn-sm mr-1 mb-1">33</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_32/" class="btn btn-outline-primary btn-sm mr-1 mb-1">32</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_31/" class="btn btn-outline-primary btn-sm mr-1 mb-1">31</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_30/" class="btn btn-outline-primary btn-sm mr-1 mb-1">30</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_29/" class="btn btn-outline-primary btn-sm mr-1 mb-1">29</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_28/" class="btn btn-outline-primary btn-sm mr-1 mb-1">28</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_27/" class="btn btn-outline-primary btn-sm mr-1 mb-1">27</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_26/" class="btn btn-outline-primary btn-sm mr-1 mb-1">26</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_25/" class="btn btn-outline-primary btn-sm mr-1 mb-1">25</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_24/" class="btn btn-outline-primary btn-sm mr-1 mb-1">24</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_23/" class="btn btn-outline-primary btn-sm mr-1 mb-1">23</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_22/" class="btn btn-outline-primary btn-sm mr-1 mb-1">22</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_21/" class="btn btn-outline-primary btn-sm mr-1 mb-1">21</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_20/" class="btn btn-outline-primary btn-sm mr-1 mb-1">20</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_19/" class="btn btn-outline-primary btn-sm mr-1 mb-1">19</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_18/" class="btn btn-outline-primary btn-sm mr-1 mb-1">18</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_17/" class="btn btn-outline-primary btn-sm mr-1 mb-1">17</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_16/" class="btn btn-outline-primary btn-sm mr-1 mb-1">16</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_15/" class="btn btn-outline-primary btn-sm mr-1 mb-1">15</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_14/" class="btn btn-outline-primary btn-sm mr-1 mb-1">14</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_13/" class="btn btn-outline-primary btn-sm mr-1 mb-1">13</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_12/" class="btn btn-outline-primary btn-sm mr-1 mb-1">12</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_11/" class="btn btn-outline-primary btn-sm mr-1 mb-1">11</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_10/" class="btn btn-outline-primary btn-sm mr-1 mb-1">10</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_9/" class="btn btn-outline-primary btn-sm mr-1 mb-1">9</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_8/" class="btn btn-outline-primary btn-sm mr-1 mb-1">8</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_7/" class="btn btn-outline-primary btn-sm mr-1 mb-1">7</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_6/" class="btn btn-outline-primary btn-sm mr-1 mb-1">6</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_5/" class="btn btn-outline-primary btn-sm mr-1 mb-1">5</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_4/" class="btn btn-outline-primary btn-sm mr-1 mb-1">4</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_3/" class="btn btn-outline-primary btn-sm mr-1 mb-1">3</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_2/" class="btn btn-outline-primary btn-sm mr-1 mb-1">2</a>
<a href="https://people.debian.org/~lunar/blog/posts/reproducible_builds_stretch_week_1/" class="btn btn-outline-primary btn-sm mr-1 mb-1">1</a>
