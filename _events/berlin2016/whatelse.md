---
layout: new/event_detail
title: What else…
event: berlin2016
order: 160
permalink: /events/berlin2016/whatelse/
---

### What Else for the Auditable Ecosystem?

What other gaps from Upstream code to User-facing binary artifacts?

binary transparency etc...

The promise is that we have verifiable source code, we can get
benefits of trust in the code by running stuff that was made from it.

 gaps:

  * repo to tarball
  * server to user

Multiple builders is not the same as binary transparency.

Does binary-transparency-style logging perform the same functionality as trusting n of k ?

"append-only" is the feature we want from publication.

git fsck should be on by default.

can we hire someone to do a formal security analysis of git?

can we get git with a different hash?

what would a "git2" look like?

git commit IDs -- how do we leverage existing deployment?

### git issues:

  * {transfer,fetch,receive} fsckobjects on by default -- what happens
    to existing broken git repos?  can we say "only fsck after commit
    X, which has ground truth"?

  * new hash -- can we have a combined history with SHA1 before a
    certain point and something better afterward?  is there a way to
    make this backward-compatible for pushes?

  * can we have a cryptographic review of git, addressing these goal:

------

 0) do we know the complete contents of the source tree at commit X?

 1) do we know the full history of the source tree at commit X?


###  VCS -> tarball problems

Why are people using tarballs or other distribution mechanisms other
than strong VCSen?

can we push for people to offer a strong VCS as a default interface?

we might need an "ecosystem janitor" team:

 * identify important upstreams that don't do strong VCS
 * import their releases into a strong VCS
 * document what their import processes are

Eric Mehyre suggests considering IPFS or other content-addressable
store.

