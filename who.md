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

{% for project in site.data.projects %}
<a name="{{ project.name }}"></a>

### [{{ project.name }}]({{ project.url }})

![]({{ project.logo | prepend: "/images/logos/" | prepend: site.baseurl }}#right)

{% for resource in project.resources %}
* [{{ resource.name }}]({{ resource.url }})
{% endfor %}

<br>
{% endfor %}
