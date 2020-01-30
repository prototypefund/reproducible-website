---
layout: default
title: Continuous tests
permalink: /citests/
order: 10
---

# Continuous tests

<div markdown="1">
The following projects are tested within the reproducible test infrastructure.
Click the different links to see current tests and results.
</div>

<div class="projects row bg-light p-md-5 p-sm-3 pt-5 pb-5">
    {% for project in site.data.projects %}
    {% if project.tests and project.tests_disabled != true and project.tests_external != true %}
    <div class="col-xs-12 col-sm-6 col-lg-4 col-xl-3 mb-4">
        <div class="card text-center" name="{{ project.name }}">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <a href="{{ project.tests }}">
                        <h4>{{project.name}}</h4>
                        <img class="card-img p-5" src="{{ project.logo | prepend: "/images/logos/" | prepend: site.baseurl }}">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    {% endif %}
    {% endfor %}
</div>

# Disabled tests

<div markdown="1">
The following projects were once tested within the reproducible test infrastructure, though now this tests
are disabled as they became unmaintained. Please contact us if you want to revive them.
</div>

<div class="projects row bg-light p-md-5 p-sm-3 pt-5 pb-5">
    {% for project in site.data.projects %}
    {% if project.tests and project.tests_disabled == true %}
    <div class="col-xs-12 col-sm-6 col-lg-4 col-xl-3 mb-4">
        <div class="card text-center" name="{{ project.name }}">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <a href="{{ project.tests }}">
                        <h4>{{project.name}}</h4>
                        <img class="card-img p-5" src="{{ project.logo | prepend: "/images/logos/" | prepend: site.baseurl }}">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    {% endif %}
    {% endfor %}
</div>

# External tests

<div markdown="1">
The following projects are being tested outside the reproducible test infrastructure.
</div>

<div class="projects row bg-light p-md-5 p-sm-3 pt-5 pb-5">
    {% for project in site.data.projects %}
    {% if project.tests and project.tests_external == true %}
    <div class="col-xs-12 col-sm-6 col-lg-4 col-xl-3 mb-4">
        <div class="card text-center" name="{{ project.name }}">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <a href="{{ project.tests }}">
                        <h4>{{project.name}}</h4>
                        <img class="card-img p-5" src="{{ project.logo | prepend: "/images/logos/" | prepend: site.baseurl }}">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    {% endif %}
    {% endfor %}
</div>
