---
layout: new/default
title:  Who is involved?
permalink: /who/
order: 6
---

# Who is involved?

Various free software projects are working on providing reproducible builds to
their users and developers.

## Core team

* [Chris Lamb](https://chris-lamb.co.uk) (*lamby*)
* [Holger Levsen](http://layer-acht.org/thinking/) (*h01ger*)
* [Mattia Rizzolo](https://mapreri.org/) (*mapreri*)
* [Vagrant Cascadian](http://cascadia.debian.net/trenza/Journal/) (*vagrantc*)

[Contact us!](mailto:contact@reproducible-builds.org)

## Sponsors

<div class="row bg-light p-md-4 p-sm-2 pt-5 pb-5">
    {% for x in site.data.sponsors %}
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 mb-4">
        <div class="card text-center">
            <a href="{{ x.url }}" >
                <img class="p-5" src="{{ x.logo | prepend: "/assets/images/who/" | prepend: site.baseurl }}" alt="{{ x.name }}">
            </a>
        </div>
    </div>
    {% endfor %}
</div>

<br>

Fiscal sponsor:

[![Software Freedom Conservancy]({{ "/assets/images/who/conservancy.png" | prepend: site.baseurl }})](https://sfconservancy.org/)

Previous sponsors: [Core Infrastructure Initiative](https://www.coreinfrastructure.org/).

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
