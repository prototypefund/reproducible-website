---
layout: default
title: Events
permalink: /events/
order: 4
---

# Events

Irregular events are organized to exchange ideas about reproducible builds, get
a better understanding or cooperate on improving code or specifications.

We meet on IRC twice a month; see the [mailing list](/resources/) for the next
meeting's date and agenda. [Summaries and full text archives](http://meetbot.debian.net/reproducible-builds/) of previous meetings are automatically published.

{% assign sorted_events = site.events | sort: 'event_date' | reverse %}
{% for page in sorted_events %}
{% if page.event_date_string and page.event_hide != true %}
## {{ page.title }}

*{{ page.event_date_string }}* — {{ page.event_location }}

{{ page.event_summary }}

[Read more…]({{ page.permalink | prepend: site.baseurl }})
{% endif %}
{% endfor %}
