---
layout: event_detail
title: Secure GIT
event: berlin2016
order: 240
permalink: /events/berlin2016/securegit/
---

We discussed:

- is SHA-1 safe?  How easy is to to make collisions that are valid git internal structures?  This is what the "potential variables" list is about.

- are any of the git internal structures ambiguous about their type in a dangerous way?  (We couldn't think of any.)

- are there any info that git *doesn't* cover in the hash, that it should?  (We couldn't find any.)

- are there any times git *has* a hash, but doesn't actually *check* it?  YES, and this is TERRIFYING and REALLY DANGEROUS. It's actually a problem in some repos containing linux firmware blobs and we don't know how to sound the fire alarm loud enough!!

- what do git signatures cover?  are they missing anything important?  (We didn't find anything scary.  But it might be possible to swap tags between repos in some cases, which might be weird, but we didn't (yet) describe any useful attack to do with it.)

- What would it take to begin a migration, if we did want to move smoothly to a system with SHA-384 (or other stronger hash)?


More about it on Hacker News at [https://news.ycombinator.com/item?id=13195849](https://news.ycombinator.com/item?id=13195849).


Overall, this whole desire for an Ecosystem Janitor Team again, which would keep an eye on all of these upstream contents and make sure their changes are publicly logged and visible so everyone is always getting the same view of upstreams, so upstream sources can be downloaded and checksummed against the public log, etc.

<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/securegit_01.jpg" | prepend: site.baseurl }}" alt="Secure GIT Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/securegit_02.jpg" | prepend: site.baseurl }}" alt="Secure GIT Post-It notes" />
<img style="margin-top: 10px; vertical-align: top;" src="{{ "/images/berlin2016/securegit_03.jpg" | prepend: site.baseurl }}" alt="Secure GIT Post-It notes" />
