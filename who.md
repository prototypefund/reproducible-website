---
layout: new/default
title:  Who is involved?
permalink: /who/
order: 6
---

# Who is involved?

Various free software projects are working on providing reproducible builds to
their users.

* Chris Lamb
* Lunar
* h01ger
* Vagrant Cascadian
* Ximin Luo

[Contact us!](mailto:contact@reproducible-builds.org)

## Sponsors

[![ProfitBricks]({{ "/images/logos/profitbricks.png" | prepend: site.baseurl }})](https://www.profitbricks.co.uk/)

## Projects

<div class="projects row bg-light p-md-5 p-sm-3 pt-5 pb-5">
    {% for project in site.data.projects %}
    <div class="col-xl-4 col-sm-6 col-xs-12 mb-4">
        <div class="card" name="{{ project.name }}">
            <a href="{{ project.url }}" >
                <img class="card-img-top p-5" src="{{ project.logo | prepend: "/images/logos/" | prepend: site.baseurl }}" alt="{{ project.name }}">
            </a>
            <div class="card-body">
                <h4 class="card-title"><a href="{{ project.url }}">{{ project.name }}</a></h4>
            </div>
            <ul class="list-group list-group-flush">
                {% for resource in project.resources %}
                    <li class="list-group-item">
                        <a href="{{ resource.url }}">{{ resource.name }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
    {% endfor %}
</div>
