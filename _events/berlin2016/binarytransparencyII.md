---
layout: event_detail
title: binarytransparencyII
event: athens2015
order: 280
permalink: /events/berlin/2016/binarytransparencyII/
---

Can we use the same idea as certificate transparency for the packages?
Why do we need this:
 * To get the common idea of what build result should be;
 * People who do not want to build from sourced can read who had produced the same binary they are trying to install;
How does it work for website certificates: we have the information about when the certificate was issued and when does it expire. But what do we do with the idea of revocation?
Problems with revocation:
 * How do I know the patch manifesto is the most recent one?
 * Man-in-the middle can defy us the ubility to get information that the certificate was revoked (or even remember the "right" answer and use it later).
 
What can we use for the packages:
Hash of the log file.
We need information about all previous changes - maybe there were revocations?
Do we need every change of every, e.g. Debian package?
Or can we keep the separate revocation log: not really useful.

Revocation problem: there are at least 2 different situations:
1. I found the bug in my test infrastructure, so please ignore my last result(s)
2. I reproduced the build yesterday, but failed to reproduce it today.
Do we need to treat them differently?

Keep the logs;
Keep buildinfo files. If we reproduced - good, if not - check the inputs. If the inputs are different, this is not so surprising (although still can be a sign of non-reproducibility)

Look through all the logs:
1. Select all buildinfo-s for the packages;
2. Do all the output match?
3. If output is different - are inputs different?

Put buildinfos into a log. Log has tree structures. Log infrastructure should be:
* public: no targeted attacks.
* audible: if log is permanent, view is consistent both over time and between users.

We want to look up output binaries later to run diffoscope on them.
Keep them somewhere (cloud) stored by hash instead of names.

Hash tree log:
-> Trust buildinfo records visible
-> We can share it share this between distros!
We put buildinfo in there, because:
-> Now anyone can collect it and check if info was gathered correctly.

The fact that buildinfo captures output hash gives us the opportunity to look up this hash later, find the stored output binary and run diffoscope.

Outcome:
Just agree to log, then everyone can choose how to interpret them.

-
