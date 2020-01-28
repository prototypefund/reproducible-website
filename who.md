---
layout: default
title:  Who is involved?
permalink: /who/
order: 4
---

# Who is involved?

Various free software projects are working on providing reproducible builds to their users and developers via the not-for-profit Reproducible Builds project.
{: .lead}

<div class="row">
<div class="col-md-6" markdown="1">

### Core team

* [Chris Lamb](https://chris-lamb.co.uk) (`lamby`)
* [Holger Levsen](http://layer-acht.org/thinking/) (`h01ger`)
* [Mattia Rizzolo](https://mapreri.org/) (`mapreri`)
* [Vagrant Cascadian](https://www.aikidev.net/about/story/) (`vagrantc`)

[`contact@reproducible-builds.org`](mailto:contact@reproducible-builds.org)

</div>
<div class="col-md-6" markdown="1">

### Steering Committee

* [Allen Gunn](https://aspirationtech.org)
* [Bdale Garbee](http://gag.com/bdale/)
* [Holger Levsen](http://layer-acht.org/thinking/)
* [Keith Packard](https://keithp.com)
* [Mattia Rizzolo](https://mapreri.org/)
* [Stefano Zacchiroli](https://upsilon.cc/)

</div>
</div>

## Sponsors

If you are interested in the work of the Reproducible Builds project, please consider [becoming a sponsor]({{"/sponsor/" | prepend: site.baseurl }}).
{: .lead}

[![Software Freedom Conservancy]({{ "/assets/images/who/conservancy.png#right" | prepend: site.baseurl }})](https://sfconservancy.org/)

The Reproducible Builds project is a member of the [Software Freedom Conservancy](https://sfconservancy.org/), a [501(c)3](https://en.wikipedia.org/wiki/501(c)(3)_organization) non-profit organisation. The Conservancy has allowed us to pool organisational resources with other projects, such as Selenium, Inkscape, Samba, and Wine, in order to reduce the management overhead associated with creating our own, dedicated legal entity.

The majority of sponsorship funds go directly towards supporting the Reproducible Builds project, such as development and server expenses. A small portion of the funds are set aside for the Conservancy to continue their work in supporting Reproducible Builds and other open source initiatives.

<div class="row bg-light p-md-4 p-sm-2 pt-5 pb-5">
    {% assign xs = site.data.sponsors | sort: 'name' %}
    {% for x in xs %}
    <div class="col-xs-12 col-sm-6 mb-5">
        <div class="card text-center">
            <a href="{{ x.url }}" name="{{ x.name }}">
                <img class="p-5" src="{{ x.logo | prepend: "/assets/images/who/" | prepend: site.baseurl }}" alt="{{ x.name }}">
            </a>
        </div>
    </div>
    {% endfor %}
</div>

<br>

#### Non-fiscal sponsors

<div class="row bg-light p-md-4 p-sm-2 pt-5 pb-5">
    {% assign xs = site.data.sponsors_nonfiscal | sort: 'name' %}
    {% for x in xs %}
    <div class="col-xs-12 col-sm-4 mb-5">
        <div class="card text-center">
            <a href="{{ x.url }}" name="{{ x.name }}">
                <img class="px-5 pt-5 pb-2" src="{{ x.logo | prepend: "/assets/images/who/" | prepend: site.baseurl }}" alt="{{ x.name }}">
            </a>
            <div class="card-body">
                <small class="text-muted">({{ x.description }})</small>
            </div>
        </div>
    </div>
    {% endfor %}
</div>


## Projects

<div class="projects row bg-light p-md-5 p-sm-3 pt-5 pb-5">
    {% for project in site.data.projects %}
    <div class="col-xs-12 col-sm-6 col-lg-4 col-xl-3 mb-4">
        <div class="card" name="{{ project.name }}">
            <a href="{{ project.url }}" name="{{ project.name }}">
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
                {% if project.tests %}
                    <li class="list-group-item">
                        <a href="{{ project.tests }}">Continuous tests</a>
                    </li>
                {% endif %}
            </ul>
        </div>
    </div>
    {% endfor %}
</div>
