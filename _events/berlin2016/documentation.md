---
layout: event_detail
title: documentation
event: berlin2016
order: 50
permalink: /events/berlin2016/documentation/
---


in between :colons: are action items, meaning somebody offered to do
this, or if it's not a name, then we still miss somebody to do it.

=====================================================================

Previously
----------
wiki.debian.org -> everyone could edit it

Current doc on reproducible-builds.org

-> One issue with the website is also that there is not a lt of structure.
-> Doc was not edited since 1 year
-> it might be nice to edit 1 PDF generated from 20 pages currently

Problem currently
-----------------
RB repo / website - not enough people do have access to the git repo
How do we give access to more people / how can they contribute?

What's missing? -> we do not want a webpage, we want documentation

Discussion
-----------

Who is the audience of the current documentation?
-> Package maintainers for example
-> OpenBSD and other people who have not started making their stuff
reproducible

Documentation should not be only for Debian but cross-distro
-> does this constitute a barrier or can it be done cross-distro?

Distros or build tools?
-> In Debian = easy to define how many percent of the repo are
reproducible, because we have official repos. With Android apps it
mightbe different, because there is no central build infrastructure. But
one might just look at F-Droid, Holger answers to this. So, how many out
of these are reproducible?
-> As an example, one could also want to build a browser on Windows
reproducibly and want to look into how TorBrowser did it.

- Patches applied to Debian are not easily applied upstream, and are
hard to find for other distros/projects.
-> document stuff which is only patched in Debian and not upstream
-> this could be done automatically (scanning through debian/patches
meta headers)

- Best practices documentation, but this needs to be ordered somehow.
-> One could use personas or categories for restructuring the page:
User, Upstream, Distro, Developers etc.

Holger wants to get rid of the Debian wiki. and propose all information
for Debian, Gentoo, RPMs etc. on r-b.org
Because there is not that much Debian specific stuff to it.
-> Several solutions have a similar mindsets, so it's a good idea to mix
all this information on the website documentation, but using well
structured categories (user, upstream, distro, general) and sections for
each distro or build tool.

- Some tools are shared, like GCC,  but some aren't like dpkg. But the
approaches that one takes are relevant.

What's the tools behind the r-b.org website?
-> Git repository on the bottom. markdown + jekyll. -> then one can send
patches, pull requests or commit rights.
-> Proposal to mirror this one Github, so that people can easily edit
stuff and make pull requests -> but we also want mirroring :ho1ger:
-> This should then be mentioned on the website and mailing list! :ho1ger:

Who should work on this?
- It could be cool to have an intern/Outreachy person work on the
reorganization of the documentation, contact distros, understand how
this works
-> don't forget that this needs mentoring
-> put this proposal on the agenda of Outreachy for the next round
:actionitem:

- proposal: document examples of projects that have worked on RB.
storytelling. What's the expected reponse: See that something is
happening? Gives a sense of the scale of RB.
-> There should be talks and slides linked. Vagrant, Lunar, Torproject
etc. :actionitem:
-> Moving talks from the Debian wiki to the website :actionitem:
-> remove the old pages from the Debian wiki so that content does not
get duplicated :actionitem:

-> don't just have a long documentation, but also a very consice FAQ for
upstreams for example.
-> why is reproducibility important, where do i get information for this
or that?
-> the ideal documentation, how would it look like? realistically!

- What is the definition of "Reproducible Build"?
-> We want to have an agreement on what it means to be reproducible. :we
might try to define this during the summit:
- it's better to have some definition, because we currently we don't
have anything.
- some proposal was "RB is the result of creating a binary from a source
and ensure it is bit by bit identic."
- we do have a problem about metadata and its definition
- it's like with Free Software licenses, some are more free than others ;)
- we could try to agree on a sentence which we all agree on at least :)
- because "there is a lot of things we actually agree on"
- Which tools can be used to verify reproducibility?
        - we don't use special diff tools to see if something is the same. We
need to have the same way of verifying and we need to include this into
the definition or a subsection of this definition.
        - Why? : problem with apk (android), contains jar signature, same with
rpm which includes signatures inside the rpm. In Debian, we have the
idea to use SHA-sums. OTOH, iOS binaries are all different, because each
one uses a special device key
        - that's an attack factor.
        - Signal i.e. has a specific tool to compare two signal builds. That's
very wrong.

-
