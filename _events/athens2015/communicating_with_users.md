---
layout: event_detail
title: Communicating reproducible builds to users
event: athens2015
order: 110
permalink: /events/athens2015/communicating-with-users/
---

*50-minute session on day 2*

Motivating questions
--------------------

 1. What is the mechanism for publishing and sharing the results of reproducible builds?
 2. How do end users verify a reproucible build?
 3. What happens when verifiers can't agree on the result of a reproducible build?

Prior art
---------

In GNU Guix, users can build a package by first building a container which only includes the inputs to the build, and then running the build in that container. There is an option to “challenge” a build, whereby users compare their results to other user-submitted results.

It's easy for everyone to

 * *Build*: re-build packages locally
 * *Share*: share their results with other users
   - Idea: it might be more efficient to share the hash of artifact along with the
     signature of builder, instead of sharing the full entire artifact.
 * *Challenge*: compare results with those of other users

Currently, lots of packages are not deterministic, so this facility is used to _detect_ instances of non-determinism.

Apt: `apt challenge` would hash locally-installed binaries and compare them to those published by Debian servers. It's difficult to do this securely: if you only trust one server then you can DoS it. If you use multiple servers then you need a voting scheme which may be arbitrary.

One option: you have a CA-like authority that verifies reproducible builds. Users would have a pre-defined trusted CA list.

Suggested primitives / APIs
---------------------------

Four APIs that would be useful:

**Build info**: Standard for representing a reproducible build (debian build info, equivalent)

**Rebuild tool**: Tool that given a “package spec” fetches the sources and rebuilds the package, outputting the hash of the build artifact
correct versions of build tools must be available.

One possible solution: insert the build tools in the source repo. Full source code history must be available or within some retention policy, if storage is a concern.

**Binary transparency log**: every time Debian generates a package, they insert the build info and binary hash into the log. Multiple authorities (institutions or individuals, with diverse political affiliations and legal constraints) could verify these builds. If they lie, they might be detected by other authorities and their reputations would be compromised.

The ownership structure of the log is important. If it's centralized, we end up with a single point of failure, or an authority that we cannot circumvent. We should prefer a decentralized log, for example the blockchain.

**Reproducibilty policy**: people specify the requirements on the code that they run. Sample policies:

 * If authorities agree then I accept the package, otherwise I verify it myself
 * I don't care about verifiability
 * I only accept a single authority

Open question: What happens when verifiers can't agree on the result of a reproducible build?

Open question: if I run a verification service as an individual user, I may not want to reveal that I am using (building). Can we allow users to do that, perhaps using Tor.

A front-end would need to know various services to check against, validate the append-only log. The UI could tell you when your trusted authorities don't agree.

⚠ There are different notions of reproducibility:

 * being able to rebuild a package in practice (e.g. build tools and source code are available, but bit-by-bit equality of the result is not guaranteed);
 * having bit-by-bit equality. This is what we usually mean by “reproducible builds”.

⚠ We have to be careful about the terms we use to describe the verifiers. If we use the term “authority”, that implies that there is a small number of institutional actors that you end up trusting, and we might end up in the same state as right now. We should move towards a flat peer-to-peer model, where verifiers can be both individuals and institutions, and people are free to choose which verifiers they trust.
