---
layout: page
title:  Who is involved?
permalink: /who/
order: 6
---

<div class="row">
  <div class="four columns title">&nbsp;</div>
  <div class="eight columns text">
    <p>
      Various free software projects are working on providing reproducible builds
      to their users:
    </p>
  </div>
</div>

{% for project in site.data.projects %}
<div class="row">
  <div class="four columns title">
    <a name="{{ project.name }}"></a>
    <a href="{{ project.url }}"><img src="{{ project.logo | prepend: "/images/logos/" | prepend: site.baseurl }}" /></a>
  </div>
  <div class="eight columns text">
    <h3><a href="{{ project.url }}">{{ project.name }}</a></h3>
    <ul>
      {% for resource in project.resources %}
      <li><a href="{{ resource.url }}">{{ resource.name }}</a></li>
      {% endfor %}
    </ul>
  </div>
</div>
{% endfor %}

<div class="row">
  <div class="four columns title">
   <h2>reproducible-builds.org</h2>
  </div>
  <div class="eight columns">
    <p>
      Contributors:
      Chris Lamb,
      Lunar,
      h01ger,
      Vagrant Cascadian,
      Ximin Luo.
    </p>
    <p>
       <a href="mailto:contact@reproducible-builds.org">Contact us!</a>
    </p>
  </div>
</div>

<div class="row">
  <div class="four columns title">
   <h2>Sponsors</h2>
  </div>
  <div class="eight columns">
    <div style="margin-bottom: 1rem;">
      <a href="https://www.profitbricks.co.uk/"><img style="vertical-align: top;" src="{{ "/images/logos/profitbricks.png" | prepend: site.baseurl }}" alt="ProfitBricks" /></a>
    </div>
  </div>
</div>
