---
layout: new/event_detail
title: Reproducible Summit III event documentation
event: berlin2017
order: 05
permalink: /events/berlin2017/ReproducibleSummitIIIEventDocumentation/
---

#### Berlin, Germany. October 31 – November 2, 2017 ####

### Event documentation

This is work in progress: currently this very document still contains notes, which shall all be moved to separate pages at which point this URL will vanish and everything will be accessible via the **Agenda**

#### Session Notes
####  Day 1

Agenda brainstormin

###### Working sessions I:

- Reviewing existing reproducible builds tools
- Discussing the current status of `.buildinfo` files
- What is the ecosystem around RPM?
- End user tools: What does exist, what is still needed

- ------------------------------------------------------------

###### Working sessions II

- How to fix the current issues with **BUILD_PATH_PREFIX_MAP**

#### Day 2

###### Working sessions III

- Improving reproducible builds in Java
- Bootstrapping: Mapping the problem best practices and open issues in
- How can policies help the end user to define what they want in terms of -reproducibility?

###### Working sessions IV

- Mapping out archive formats
- Building a system image from existing binaries
- How to preserve software integrity in different legal contexts?
- Marketing: Why is it valuable to support the reproducible builds work and who is our audience?

##### Day 3

###### Working sessions V

- Defining terminology: reproducible, bootstrappable, reliable
- SOURCE\_DATE\_EPOCH specification: Overview and improvements needed
- Setting up build environments for reproducibility
- What is needed to run rebuilders?

--------------------------------------

###### Working sessions VI

- Mapping out our short- and long-term goals
- How to onboard new contributors
- Identifying next actionable steps for marketing outreach
- Funding reproducible builds work

--------------------------------------
####### Working sessions VII

- Enabling cross-distro reproducibility
- Exploring reproducibility for Mac and Windows
- What does code-signing means in terms of reproducibility?
- Prioritizing the minimum viable set of tools needed for end users
- Discussing current status and potential improvements in regards to `.buildinfo` files for RPM and iso.

--------------------------------------------------------------------

##### Brainstorming the reproducible builds logo design

#### Session Notes

###### Day 1

- Working sessions I
- Working sessions II

**How bootstrapping relates to reproducible builds and how to improve it**

- Bootstrappable.org

- Bootstrappable builds

- Open questions:

- What is the relationship to reproducibility?

- Why should we care?

- We need to trust binaries used during build. If build binaries are not trustworthy, this makes build results less trustworthy.

##### If we have a exe at the top and a lib it depends on, do we call the exe reproducible even if the lib is not reproducible? is trust binary / black & white? no…

**overlap:**

- Build as much from source to need less trust in binaries, and to be able to read/review the source

- Increase trust in the software we build

- Trust gets added with every way you can build a software from source

**diff:** reproducible builds: done when 100% of packages are building reproducibly

**bootstrappable:** (C-part) done when one can take any C-compiler and compile the production C-compiler and with that get bit-identical binaries of anything

###### Requirement for doing bootstrappable builds:

- A **“seed set”** of bootstrap binaries has to be declared by a project (e.g. see f-droid below or a binary with a specific checksum), must not be implicit (e.g. previous version of myself)

- For build use a limited build environment containing only those binaries and nothing more.

- Large complex source can still be hard to read, understand, verify => reduce amount of trusted software

- Backdoors in built source code are out of scope of bootstrappable builds

- Is it a software freedom problem? maybe, maybe not

- Long chains of A->B->C may bitrot and break over time, give less trust than A->C ; but we have archives, and containers

- Obsolete hardware needs to be emulated and the emulator becomes part of the binaries we need to trust.

- Have build scripts that are fully specified about versions of compilers, etc to use in a boostrap-chain.

**Note:** Trust is not transitive **(unlike a=b=c meaning a=c)** so if the sister of a friend knows someone who verified this it is not as much trust as **“I verified this”**. Possibly also because trusting someone very much translates to a factor of 0.9x thus for every level of indirection you lose some trust.

**F-Droid:** using Debian binaries as much as possible because they are built from source and thus more trustworthy.

**guix:** build archive with checksums of everything with 218MB bootstrap binaries

**openSUSE:** uses [Ring-0](https://build.opensuse.org/project/show/openSUSE:Factory:Rings:0-Bootstrap)

**Goal:** come up with very small set of auditable binaries+sources

  <https://gitlab.com/janneke/mes> is close

  <https://savannah.nongnu.org/projects/stage0>

**Goal:** need zero trust in the seed set of binaries - cannot be fully reached, but we can get to very small (maybe infinitessimal) values of trust needed.


###### How to distinguish trusted bootstrap binaries from other binaries?

- Tools/compilers that depend on themselves:

- Gradle

- GHC (Haskell)

- Trust

- Maven


###### Identify important next steps:

- Collect list of bootstrappable and non-bootstrappable tools

- Convert notes to proper doc

- Identify high-importance targets to achive bootstrappability

- More to be discussed


###### What documentation is still to be created for developers who are new to reproducible builds?


**Newbie docs**

--------------------------------------

- Entrypoint of <https://r-b.org> good

- Webpage alone is not enough

- Debian wiki is needed

- Found a theoretical explanation

**Missing:** hands-on-guide, good examples

- Example -> `gzip` vs. `gzip -n`

- Reprotest is helpful


**Guide:**

- **1st:** build a binary reproducible

- **2nd:** build the Debian package reproducible

###### Good examples:

- the unreproducible go packages

- the unreproducible hello-world.c

- .py .ruby [...]

- should cover each type of reproducibility and each language

- we need documentation for every language including all specialities
also build systems should be explained e.g. autotools, cmake, [..]


###### what's reproducible?

- append the **"definition of r-b"** with a paragraph "confusions about the term reproducible" and then explain that


###### new document (wanted): "how to contribute"

- wiki should go away? yes!

- only one source of documentation


- link the definition on the r-b.org page

- create a docker container with all tools

- video tutorial how to make a package reproducible? the easy packages
are getting rare, so it's hard to learn. (maybe an ascii video)

###### Day 2

###### Working sessions III


Improving reproducible builds in Java


- Java Bootstrap path --> working for guix


- Bazel has less problems because they always use bazel to build


- Bootstrapping maven and especially gradle is still challenging
bootstrapping maven from older versions of maven, requires a few steps.

- For gradle it's harder because it depends on really recent (nightly) versions of gradle.



**BUT:** Gradle since version 3.0 depends on groovy >= 2.0 which depends on gradle.

- Grovy 2.0 depends on gradle 1.0, which depends on groovy 1.8.4 which has a maven build-system.





- Problem with java projects which have tests which depend on the parent project. --> dependency cycles

-----------


Javadoc --> produces unreproducable output based on filesystem order

- Fix at source when read from filesystem

- There might be a Debian patch: javadoc-sort-enum-and-annotation-types.diff

- Gradle - groovy bootstrap chain:

maven 3->groovy

groovy -> gradle

- 1.8.7 1.2

- 2.0.5 1.12

- 2.3.6 2.3

- 2.4.12 4.3


###### Gradle depends on over 300 previous versions of itself.

- Try to go the if we can compile ourself correctly after skipping trough several steps. Git tags seems to be good indicators.

Bootstrapping: Mapping the problem space

- **Two possibilities:** minimize the binary seed; eliminate the importance of the binary seed (diverse double compilation)

- Usually diverse double compilation is only feasible for C compilers (because other languages and build systems often only have a single implementation)

- Timothy showed his build-dependency graph, an informal generalisation of diverse compilation to projects with more than one bootstrapped dependency. Different/diverse "seed sets with no shared binaries".


- Debian currently doesn't declare an exact set of bootstrap dependencies; f-droid assumes many binaries from Debian; projects should be specific about these assumptions in general. Ricardo showed us the Guix bootstrapping diagram, a formal explicit bootstrapping specification. Seed set includes things like **"mkdir"**, could be made further abstract e.g. pointing to POSIX spec

- **Reducing binaries is a goal in itself:** the number of binaries we need to carry around to get started should be small; it is not necessarily about increasing trust (there are other ways to get there: diverse double compilation, long chains of rebuilding, etc)


- Definition of **"diverse"**, i.e. not coming from the same authors. Golang 1.4 is not "diverse" from golang 1.6, for DDC purposes


- How can we encourage compiler writers to keep around a bootstrappable implementation? there are disincentives for developers: maintaining a bootstrap path is expensive. by setting a good example of a pretty bootstrap we could demonstrate the benefits


- Sharing bootstrap paths, e.g. from a C compiler, lowers the bootstrapping cost across the whole ecosystem, reduces attack surface. harder for compiler writers however, who want to write in their own language.


- One strategy is to find a binary-reduced bootstrap path to a C compiler that can build GCC; any language that can be built with GCC would thus benefit (including Guile, Hugs, etc); another path is to build a C compiler in another language that itself has a short binary-reduced bootstrap path; another path is to revive ancient compilers (but that's hard)


- Brief digression into the fact that GCC does not distribute its own binaries

- Maybe makes it harder for compiler writers to bootstrap themselves

- OTOH, independent distros supply **"independent binaries"**, maybe diverse enough for DDC (unsure if totally solidargument)

- Identify **"checkpoints"** (i.e. verified binaries), possible ways to verify a binary:

- DDC with multiple independent bootstrap compilers

- Human verification that binary matches source code (for small enough codebases)

- Allows us to confidently use the binary to bootstrap future stuff

- Can also be used to verify future checkpoints more directly, using 1 single normal build

- (Assumes all these processes are reproducible)

- Keep a record of which checkpoints generated which other checkpoints


- Rest of the session was about constructing the build-dependency graph between compilers

- Partial dependency graph of a GHC bootstrap path, early boostsrapping information at: <https://elephly.net/posts/2017-01-09-bootstrapping-haskell-part-1.html>

- 8.2.1
- 8.0.1
- 7.8.1
- 7.4.1
- 6.12
- 6.6
- 5.0.4


- One idea to consolidate the approach in the link was proposed, is to use nhc98 to build a 32 version of GHC, then crosscompile GHC to x86_64.


 **Transcription of the poster**


- A node in this graph represents a particular compiler. Edges are **"can build"** relationships.

- Short chains are preferred.

- Checkpoints are binaries with a specific hash---the graph above and including the checkpoint

- could be replaced with that very binary. Ambitious projects may want to increase the number of

- checkpoints that are reached trhough compilation from source.


**Graph:**

- In the middle there is a node gcc-4.7 and annotations **"Diverse double compilation"**;

- Can be built from and can build may other compilers, in particular clang and tinyCC ("25,000 loc").

- From gcc-4.7 there is an edge to ggc-5. From gcc-5 there are many outgoing edges: cpython, ruby

- Interpreter, jikes, hugs, llvm. golang can self-build and also be built from gcc-5.

- 3 nodes are marked in red (indicating **"not cool"**): ocamls requires gcc-5 *and* ocaml,

- GHC requires GHC itself to build, Rust request clang, LLVM, Python interpreter *and* Rust itself.

- For GHC there is incoming edge from hugs, marked with a quesiton mark.

- For tinyCC there is an incombing dotted line chain indicating a possible bootstrap path:

- slow simple lisp -> messcc -> tinnyCC. Another dotted-line bootstrap path drawn is

slow simple lisp -> mes -> guile -> nyac + mescc.]


**This graph may require:**

- **"or"** inbound links (somewhat rare... but desirable! Tends to suggest a good checkpoint)

- **"and"** inbound links (typical: srcs and compiler, etc)

- probably use a different color for textual sources

- **optonal useful node annotaitons:** binary size (smaller tends to suggest a good checkpoint)

- should we highlight loops? (**gain:** probably good checkpoints)

- mabye a giant elipsis for where $language has a whole huge tree (we mostly care about compilers here)


**Best practices and open issues in regards to engaging upstreams**



- follow upstream processes

- difficulty finding .any. place to contribute

- difficulty finding the .right. place

- github, gitlab, sourceforge, devel mailing list, bugtracker cover 90+% of cases

**solution:** ask on IRC or via direct mail on how to contribute

- difficulties in relying on package maintainer to forward etc

- ask distribution maintainer to forward your patch upstream

- patches rejected

- they want to keep their timestamps

- **suggestion:** *"ask why the current status quo exists"*, not just assume they are °wrong°

- discuss how to solve the problem differently in a way the maintainers like

- rejected (or not merged) due to lack of ability to test code paths or regressions.

- add tests.

- find a different reviewer with a saner view of the world.

- try to be friendly and not push too much - might trigger defensive behaviour of maintainers.

- gentle pings

**"what can I do to help you merge this"** in the case of unmerged or untouched patches.

- wait 1 month at least, exponential backoff to not be annoying e.g. wait 1, 2, 4, 8.

- **"I will do it on the weekend"** or **"next month"** - follow up after that.

- keep track of patches to ping - e.g. keep URLs in an etherpad, script to send emails.

- If there is a patch in Debian that is not forwarded to upstream, when forwarding upstream mention that Debian already has that patch and you want it in your project as well to signal that there is more than 1 interested party. for <https://bugs.Debian.org> update forwarded status.

- link back to **Debian/other** distribution's bugreport in upstream one.


**problem:** deprecated branches.

- when patches do not apply to master because it has been rewritten

- try to get an review/approval from upstream - makes it easier to get it merged into distributions

-> adopt in <https://github.com/distropatches/>


**problem:** patch sent during deep freeze, so patch is **ignored/delayed**

**solution:** need to ping at the right time


**idea:** keep and share template-snippets of well formulated commit messages or bug report, include reference to documentation so it can be more verbose and useful to upstreams than when writing from scratch every time.

- e.g. <https://wiki.Debian.org/ReproducibleBuilds/Contribute # How_to_report_bugs>


**problem:** have to sign CLA.

- argue that it is not copyrightable.

- Declare patch to be MIT licensed so it can be integrated anywhere.

- Bots can be very strict, so signing the CLA is often the easiest solution.

-e.g. Qt, google, GNU, facebook, python

- Send bad patch, so maintainer has to rewrite it and it is his copyright.


 **How can policies help the end user to define what they want in terms of reproducibility?**


#### Policies:


* there is no one size fits all policy

* can you verify using a checkbox that the software is the one we want to install?.

* but we want the computer to verify that many people have reproduced the same software.

* how to handle exceptions to the policy?.

* providing these policies to users is a different question than to provide this kind of information to **developers/researchers**.

* after the installation, we should also be able to verify the software we installed on the computer.

* **question:** what if the news arrives via Twitter, should this be part of the policy?.


**Questions:**

- What is the range of reasonable policies?.

- How can we communicate these policies to machine administrators?.

- How can we implement this in the backend.

- What are the downsides of these policies?.


### Example policies


**Example 1:**

**REBUILDERS BUILD INFO FILES**

rebuilder A :pkgX matches digest N.

rebuilder B:pkgX matches digest N.

rebuilder C:pkgX matches digest N.



**MACHINE:**

---------------------------------

policy configured to:

- Fetch build info files from three rebuilders.

- For example Debian, ACLU, CCC, some army :)


Local admin could pick a set of rebuilders and pick build info files from the 3 and check if they match.

If the three build info files don't match we could.

- Not install the package.

- Try to rebuild it ourselves.

This is what we would need to define in the policy.


- How many rebuilders do we want to match (m out of n)?.

- Where does the list of rebuilders come from in first place?.

- Think big, maybe we need 500 rebuilders, not only 10. like universities for example.

    - we could have a rebuilder consensus.

    - it would be harder to attack such a network of rebuilders.

- How is the redistribution gonna work?.

- Backup mechanism for policies.

- There is a time when packages would appear as being unreproducible, for ex. when security updates are published, the rebuild will take time.

- Have an admin specified rebuilder, for example a local rebuilder.

- Have a weighted builders (i trust my friends more than XYZ).

- We want to be able to say that some rebuilders cannot block consensus for us.

- How do we ensure that our failure modes are not failing?.

- What if corroboration fails, is missing, is insufficient?.

    - install anyway

    - don't install

    - local log

    - external log: `report.`

- On a distributed architecture, how and where do we report it?

- Rebuild it ourselves and then? it could match one of the rebuilders, none, the majority, the minority which `.buildinfo` file will we use?

    - what if the OS rebuild does not correspond to the consensus' checksums/buildinfo files?.

- Policy for rebuilds: always rebuild and then check the consensus, or never build because i don't have resources, or build only in specific cases, like if checksums don't match


**Rebuilders:**

- Architectures?

    - for some archs, m out of n will be different.**

- For n out of m:

    - default = "the majority", ex: for 10 known rebuilders the strict majority would be 6. majority of potential rebuilders.

    - time -> "not having rebuilt" does not count towards your majority, unless you have a local on demand rebuilder.**

- We don't challenge the idea that we download the `.buildinfo` files from somewhere.

- For ex, we could be able to specify the download from a local machine, in case of a company.

- Right now, for user policy, the question is not that much where we get the `.buildinfo` files from, but what we do with it.

- Could be a sudo rebuilder daemon which publishes `.buildinfo` files (proxy policy)

- Let's put aside the question where we get the info from right now

- Currently admins have to have /etc/apt/sources.list or a similar file

    - we could have a rebuilders.list.**

- **question:** m out of n → is this per package, per repository, per combination?.

- Policy per repository.

- Rebuilders then have to commit to rebuild the contents of the entire repository.

- Weight.

    - what do to if corroboration is insufficient.

- Log/loglevel.

- What if my rebuild fails.

- Exception handling.

    - default policy

- Maybe we could turn this on with sensible exception handling at least.

    - for example report externally, warn/log.

- Exception handling for packages which are currently known the be unreproducible

    - example GCC.

- Turn it on for packages which are supposed to be reproducible (since n times)

    - have one default policy for Debian/etc repositories, one per PPA.

    - repositories themselves should state what their default policy is.

- **"sensible default"**

- Don't blindly trust changes of this policy / compromise

- Policy shipped in a package

- There should be a list of rebuilders

- But admins should also be able to manually select the rebuilders

    - user specified policy.


- This is still very complicated, we should break it down to 3 options.

- GUI where we could check "Debian as rebuilt by the CCC"


**EASY GUI:**


- Policy Chooser per repository:
- X default (none)
-  o Debian
-  o Debian stricter

**ADVCANCED GUI:**

###### REPOSITORY X

----------------------------------------------------------

**Trusted rebuilders INCLUDED REQUIRED**

- Rebuilder A x
- Rebuilder B
- Rebuilder C x

----------------------------------------------------------

**Number of rebuilders needed for consensus (m out of n):** 2

----------------------------------------------------------

By default weight is binary (0/1), and in advanced mode we could use non-binary weights.

**Consensus fail policy**

###### Log policy

**It seems doable! But what's the cost/benefit ratio of it?**

- User stories.

- "Running Debian as rebuilt by the CCC".

- Snapshot maintenance.

- Rebuild service -> just send a queue to a local or whatever rebuilder

**not as part of the installation process**

###### → Let's extract the smallest useful subset of this in another session!

- Minimum shippable piece

- **outside of policy questions:** how do we ensure we don't add more privacy concerns for users with this.

### Working sessions IV


###### **Mapping out archive formats**

----------------------------------------

    | | | tar | zip | cpio | git | casync | ostree | squashfs | ar (text) | iso |
    |--|--|--|--|--|--|--|--|--|--|--|
    | | has canonical packed form (e.g. no implicit traversal order) | not by default | yes (not sure how stable) | yes | N/A | | | | |
    | | Can be canonicalized (with enough flags) | yes (with arbitrary choices | | | | | | | no | |
    | | seekable | no | yes | | sorta (packs: no, and don't ask) | catar | | | yes | |
    | | sparse files (kernel API is very recent) | yes | | | | long story (will store zeros efficiently and…) | | yes | no | |
    | abilities: | mmap'able | yes, but not useful due to no seek | | | | catar is | | | | |
    | abilities: | unpack related trees can conserve disk space | no | no | | no | hardlink or reflinks | hardlink | | no | |
    | abilities: | pack related tree can dedup | no | no | | yes (it's complicated) | rabin blocking (very good) | file-scale (no chunking) | | | |
    | abilities: | SPECIAL applications | popular for src releases | | | source | | | | | |
    | | dev (maj/min) | yes | | yes | no | yes | | yes | | |
    | | fifo | yes | | | no | yes | | | no | |
    | | sockets | yes | | | no | yes | | | no | |
    | | posix &0111 bits (\|x) | yes | yes | yes | yes | yes | | yes | yes | |
    | | posix &0777 (rwx) | yes | yes | yes | no | yes | | yes | yes | |
    | | mtime (any? nano? 1sec? 2sec?) mtime ZONEs? | 1s (unix) *gz may add another | 2s (timezones) * per file compression may have another | 1s | no | yes | | 1s | 1s | |
    | | xattr | yes | not | no (patches floating) | not | yes | | yes | no | |
    | | arbitrarily long filenames | yes, but three or more encoding variations | | | yes | yes (to linux's max…dissent) | | | no | |
    | metadata: | symlinks | yes | yes (extension) | | yes | yes | | | no | |
    | metadata: | hardlinks | yes (but weird) | | | not | no (maybe someday) | | | no | |
    | metadata: | uid/gid (int) | yes (BOTH‽) | yes (extension) | | yes | yes | | yes | yes | |
    | metadata: | user/group name | yes (BOTH‽) | yes (extension) | | not | yes | | not | not | |
    | metadata: | suid bit | yes | yes (extension) | | not | yes | | | yes | |
    | metadata: | expanded file size | | | | | yes | | | | |

### Building a system image from existing binaries

**Building a system image from existing binaries**

- Binaries = build dependencies, like in static linking.

- Source code = scripts used to create the image, independent of specific

**versions of the external packages that are used.**


###### **Downloading binaries from remote places**

- Bootstrapping processes need a similar thing, download upstream bootstrapping

#### **Binaries**

- Declaring binary dependencies is the main thing, c.f. `.buildinfo` files

- What one does with it during the build is not material, as long as it's reproducible.


**Build environment**

- Distribute description of a VM, e.g. gitian

###### similar concept to `.buildinfo`, which describes build-dependencies

- Doesn't have to be the exact same VM or environment (and shouldn't be) but
similar enough to express the build dependencies, and reproduce the build.

- If it's easier for users to recreate the build-environment -> more
reproducers, better for everyone

- Ideal for each project to have a one-liner shell script to run that outputs

**"is this reproducible"**


**FS images**

- `mk_ext4`, deterministic tool to create a reproducible `ext4` filesystem `mkfs` for BSD should be reproducible

- Might be dependent on ordering of input operations, etc, but still
reproducible if that is reproduced

- Isofs, reproducible upstream

- Squashfs, have patches, but upstream uncooperative

- Libguestfs, run a image in a VM, but not reproducible


#### Setting SOURCE\_DATE\_EPOCH / timestamps

- SOURCE\_DATE\_EPOCH can be set to the latest modtime of all packages

- (i.e. build-dependencies), communicates some info about how recent the

**image is**


#### Cache files / other post-installation products:

- Drop if not necessary

- Fix if necessary to be static

- Generate at boot time, if necessary to be random or system-specific (like UUIDs or RNG seeds)


**Other sources of unreproducibility**

- DNF has dependency resolution depending on configured priority of remote repost => need to store this config with the source code.

- Debootstrap should be more or less reproducible, testing required


**Use hash information in `.buildinfo` to reproduce d-installer output (images)**

###### How to preserve software integrity in different legal contexts?



**Where we're coming from**


- Dkg works for ACLU (but is not a lawyer)

- **concerns:** government forces devs to ship malware, with gag orders (not allowed to talk about it)

- **solution:** make systems where it's impossible for devs to comply (every change has to be visible and accounted for)

- We have at least four legal jurisdictions represented in our small group (US, Brazil, European countries)

- One way to market RB is to mention the mafia, but in some places law enforcement can be perceived as the mafia and can be used instead


#### What can law enforcement force you to do?


- **example:** [Apple vs FBI](https://en.wikipedia.org/wiki/FBI%E2%80%93Apple_encryption_dispute) but doesn't really work because we do not have the source code.

- The same example could apply to the maintainer of tails though (baseball bat kind of threat to flip a bit)

- **another example mentioned;** gag order against [archive.org rescinded](https://archive.org/details/GagOrderRescinded)

- Depending on context we might agree willingly (catching child abducters...)

- Typical gag order does not allow you to talk to your lawyer (probably not true)


**Side question:**

- What is the prior art of gag orders? (eg before computers and Reproducible Builds)

**How can we defend ourselves?**


- Employment (google...)

- 501c foundations for our OSS projects, either directly (NetBSD Foundation) or indirectly (FreeBSD Foundation, SPI for Debian...)

- Foundations like ACLU (1.5M members in the USA)

- Not being the single point of failure

- Having a lawyer, or going to a journalist? (if not fully detained)

- Revoking our own accesses (private keys, destroying second factors...)


###### Dealing with jurisdictions is very difficult, and many of us live in countries with a passport issued in another, making it even more complex.


- Take from the session

- Are Reproduble Builds really a deterrent?

- Can we technically make it difficult or expensive for threats against us thanks to Reproducible Builds?

- Can we ask foundations what would happen if a developer is under (legal) pressure to insert a backdoor, and reaches out to them?

- Can we come up with a guide gathering ways we have to defend ourselves?


**Report**

Very complex topic, which raised more questions than answers - for now at least. We focused on which situations we can individually be pushed to do things detrimental to the integrity of software projects, and ways to defend ourselves. Besides being employed by big companies, foundations may manage biggest projects, but not always. We need to ask them which steps they would and could take for us. With this we could or should come up with a more general guide on how to defend ourselves?

**Marketing:** Why is it valuable to support the reproducible builds work and who is our audience?

- **1st brainstorming session:** what are the reasons why you think marketing is a good idea (or not)? (see first post-it board)


We identified four clusters that marketing relates to: users, developers, management, and the free software community. There is agreement that marketing is important to become visible, thereby moving the burden of discovering RB from the audience to us. It is also important to increase diversity in the RB community.

- **2nd brainstorming session:** who would be the targets for marketing efforts? (see second post-it board)

- **Observation:** there’s a lot of overlap e.g. NPM (the company), NPM (the package manager developers), NPM (developers publishing JavaScript packages via NPM), etc.

- Interestingly, only few votes went to individual users, because their individual power is limited. Targeting organisations might be better, because *they* can reach many more people that are all similar. It makes more sense to target “user groups” (e.g. via Amnesty International, or HPC users) than individual users (through individual user stories).

###### what is the message we have for them?


- **“Compiler builders”** are a target, because compilers are crucial to all software. The message to them is: you don’t want your compilers to produce random results. Appeal to their pride in creating something beautiful and accurate that produces deterministic results.


- **“Software distributing companies”:** reproducible builds generates user trust. Give your users a reason to trust you even more. Also tell them that the compiler builders are helping us to get deterministic results and increase trust; pass that on to your users.


- **“Academics”** includes scientists who want to fully describe their software environment in a reproducible fashion in order to get published (e.g. to comply with journal requirements); it also includes scientists / reviewers who need to reproduce or verify published results, which includes reproducing the software environment.


- **Journals have reproducibility requirements that are sometimes satisfied by shipping a binary blob (e.g. a Docker image). Repro builds is a more principled and thus more scientific approach to satisfying these requirements. Strategy:** publish an academic paper introducing best practices that include a motivation for reproducible builds.


###### People often follow scientists, so publishing something on RB in journals might help motivate compiler builders as well.


**Transcription of posters:**

### Marketing

**Poster 1:** WHY?


- Users:

+ End user needs to bge made aware of the issue

+ I don't want to hide what were doing

+ It feels "very important" yet hard to discover

+ Users seem to be unaware that reproducibility even exits, we should show how we can benefit

+ get more users exited / use our work.

+ The world needs secure software, the world needs to know this

- Users / Developers / Management:

+ Increase diversity use/contributors/areas of usage

+ Take responsibility for how easy it is to find out RB importance

+ It can be very hard to explains the importance of RB

- **Developers:**

+ Sustainability of R-B

    + Get more developers involved

    + Needs more contributor -> progress

+ There is a lot of software with RB problems -- We need to encourage more people to care and help

+ Change developer mindset

+ Improve buy-in from other devs

 **Managemnent:**

+ Get upper management care more about R-B so devs can work on it

+ Encourage funding

+ We need more "management buy-in"

+ We should be able to acquire resources more easily if we are r-b ...: build farm

+ Publicity can provide a "professional" context to motivate projects dedicated to RB (e.g. academic publications)

- Free software community

+ our collaboration is fun & productive, other areas of free software can learn from us

+ RB can strengthen the free software movement / effort


**Poster 2:** WHO?

- Scientists depending on reproducible software environments for reproducible research. (5 votes)

- HPC users e.g., chip-?-manfacturers

- Banks and other businesses that are critical in our society (1 vote)

- Industry (e.g. aeronautics)

- Who (as a user) would greatly benefit from RB?

- Computer sciences / academy people

- Upstream developers, especially if we already have a simple patch.

- Compiler builders (2 votes)

- Gcc developers (1 vote)

- Go developers

- Free software (upstream) devs so them get the relevance for their whole project

- Free software developers (1 vote)

- GNU maintainers

- Npm developers

- Developers who want to be sure to have the exact same build environment across a team

- Free software user (1 vote)

- Security conscious floss users

- User who are enthusiastic about free software, who want to be sure that the sources they have really correspond to their binaries (1 vote)

- Users of medical devices

- Security conscious users who want to avoid running backdoored software

- Political activists

- Funders who support repprobuilds work (1 vote)

- Free Software foundations and companies

- Distributions (both os and source binary software ones) (2 votes)

- Canonical (1 vote)

- RedHat Management (1 vote)

- Microsoft, Oracle, Apple

- Github, Gitlab, ... companies


##### TOP THREE AUDIENCES TO FOCUS ON:


- Compiler builders

- Software distributing companies

- Academics

### Day 3

**Working sessions V**


**Defining terminology:** reproducible, bootstrappable, reliable

##### Pad1

**Directed graph we came up with in dot:**


- digraph concept_relations {

- reproducible -> practical

- reproducible -> tamper_proof

- reproducible -> zero_trust

- bootstrappable -> zero_trust

- bootstrappable -> tamper_proof

- reliable -> practical

- reliable -> tamper_proof

- reliable -> bootstrappable

- reliable -> build_failure_is_tampering

- build_failure_is_tampering -> isolate_external_failures

- practical -> bootstrappable

- practical -> reproducible

- zero_trust -> security

- zero_trust -> scientific_soundness

- zero_trust -> resource_sharing

- zero_trust -> proven_good_result_without_rebuilding

- resource_sharing -> practical

- proven_good_result_without_rebuilding -> practical

}


**We had concepts:**

- **reproducible:** bit by bit identical results.

- **reliable:** build instructions either work or fail consistently

- **booststrappable:** bootstrappable from source, or bootstrappable to identical binaries trough different bootstrap paths.


**We identified goals:**

- Security.

- Zero trust.

- Scientific soundness.

- Practicality.

- Tampering detection.

- Isolation of external failure causes.


#### Pad2

**Reproducible, deterministic:**

- Binary identical outputs

**Replicability:**

- Strict replicability, get the same result even using different methods

- Does this exist in build systems?

**Reliable:**

- The build instructions always work

#### Trust

- **Good:** Not needing to trust, zero trust, trust less

- **Bad:** needing to trust


#### Bootstrappable

- Reduce the set of blindly trusted inputs

**SOURCE\_DATE\_EPOCH specification:** Overview and improvements needed

##### SOURCE\_DATE\_EPOCH
-----------------------------------
- Current spec talks about **"current time of system";**

however generated files that end up in final output

-> clamping: old files stay old, but newer files

get set to source date epoch

#### This is existing practise already, so we should.

##### Update the spec to reflect this.


- Note that this is can also be considered as following from the currect specification; but not everyone agrees,
so clarification might be helpful.

- Discussions on if the following one-sentence mathematical summary is useful as guiding idea

**"The output of the build should look as if the build**

**had happened instantly at SOURCE\_DATE\_EPOCH."**


-> Will use that sentence as motivational summary in the introduction (but not as part of the definition)


- Git not setting the time of checked-out files to that
of the last commit that changed them (**---> clamping**

**is a problem here; forbidding clamping would make**

**this a non-problem**)


- Debian and SuSUE take SOURCE\_DATE\_EPOCH from dates in
Changelogs; Archlinux doesn't have souch a canonical
source.


What they do is take current time, but store the value
in their `.buildinfo` file; so the `.buildinfo` file effectively
becomes part of the source file.

Discussion on whether this seems fine (the spec allows
a `.buildinfo` file to be considered source; but the majority
of this discussion group considers it preferable to take the
time from version control).


- discussions on the overwriting change.

+ **"newer"** value should not be in the future for clamping

to still work


+ the example could be made more clearer


+ bazel drops all timestamps and environment variables to

have better caching. OK? Does the spec have to allow

it? **(Technically, a suprocess does not see a value**

**set to a parent process, nor a newer value).**


+ subprocesses with modified SOURCE\_DATE\_EPOCH not

properly insolated

- Setting SOURCE\_DATE\_EPOCH in the presence of newer dependencies


-> set to the maximum of all dependencies?.

##### Setting up build environments for reproducibility


###### Complex Build Environments


- fdroid is building android apps. requires lots of software to
build. for every different app it needs a different set of sdks. each
app defines it's own build environment requirements. metadata gets out of sync. provides a build server VM that includes most of the
potential versions that each app might require (~30GB
image). loosening strict dependencies might be too much work, and more

- divergent from upstream could lead to specific bugs. app itself may
not specify all necessary build dependencies; fdroid meta-data is
needed to specify this additional information.

- automated integration tests against newer versions compared against
the specific versions.

- fdroid currently uses a single build server VM.

- **goal:** reduce the set of implicit dependencies in the base image. move more into the app-specific metadata. this could reduce the size of the base image, and have more people using it to test builds.


- build a minimal build environment and require more explicit build
dependencies in the fdroid metadata. this allows to detect implicit
dependencies when builds fail.
- explore containers instead of virtual machines.
- some of options such as Debian have a base environment in a chroot,

-which installs build-dependencies at build time(sbuild, schroot,
pbuilder). **guix/nix** have a similar concept by design.


- containers are good for doing the environment setup, and virtual
machines are a possible implementation, but most expensive. the
software provided by the virtual machine may not need to be the same
software used in the build environment.

- issue of isolation for security vs. clean build environment are
separate issues.

- get rid of a single monolithic image.

- containers make it easy to do builds with network isolation.

- definiting a **"seed set"** for the virtual machine by splitting parts of the build environment into different **"packages".**

- fdroid has manifest metadata for packages. can tell gradle what flavor
of app to build, fields tells if there are any pre-built binaries in
the build, some binaries in the source tree may need to be ignored

**(verified built from source elsewhere).**


- focusing on gradle would handle most of the packages in fdroid; it's
easy to extract various metadata using gradle plugins. only a handful
use maven. quite a few use ant.

- need a way to get a list of build-dependencies for an offline
mode. this is difficult for android applications, because the
dependencies are gotten from gradle.

- build environments should be a minimal build environment indepdendent
of the host system. It is recommended to have no network access, in
order to ensure network inputs do not result in irreproducibility.

#### What is needed to run rebuilders?

- What do we need to have/run rebuilders?

- Who does rebuilds already?

------------------------------------------------
- One attendee runs a rebuilder for GUIX (~1k packages).

- One attendee has rebuilt individual packages.

- One attendee has rebuilt individual Debian packages using the
published `buildinfo`.

- Tails developers rebuild Tails ISO images before they are released.


##### Example scenario
-----------------------------------------

- What's the simplest, cheapest and useful rebuilder?


Documentation:
------------------------------

- required hardware resources **(per architecture)**

- constraints on rebuilders (e.g. to protect against malicious code
in the build rules)

- It should be as simple as **(for a Debian rebuilder):**

- `apt install debian-rebuilder`

- **By default:** try to rebuild Debian unstable **(⇒ actionable feedback),**

- Generate & publish `.buildinfo` files.


- We need canonical **("official")** `buildinfo` files published by Debian and we'll use them to rebuild.

- We will likely need to use snapshots.Debian.org to get the desired version of the build-dependencies.

- In the future building stable might be good too but right now it's not useful **(we know it's not reproducible and we can't fix it).**

- What if I have N systems I want to turn into rebuilders? Will they coordinate to share the work or duplicate it?

- Is it OK to broadcast by default the fact you're rebuilding Debian?

**Actually we don't need this:** apart of the signing key and stuff in  the `buildinfo` we don't leak much.


##### What does the concept of rebuilding mean?
-------------------------------------------------

For example, do we try to reproduce a previous build in a build env.
that's as close as possible to the previous one, or do we **"just"**
rebuild and compare the results? Or do we do the latter and then if it
doesn't match, we retry with a build env. closer to the `buildinfo`?


- Pie in the sky option: encode in the source (e.g. `Debian/control`)
the requirements for building reproducibly? E.g. having source package
X declare `X-Repro-Build-Dep-Same: libfoo` specifies that a rebuild of
this package with a different version of `libfoo` than what's in the
`buildinfo` file likely won't be reproducible.


###### How do we rebuild?

-----------------------------------


- Do we want a centralized/generic rebuilding infrastructure?

- Or specific to the project we're rebuilding?


##### How/where do we store results of rebuilds?

-----------------------------

(both matching and non-matching)

**Prior art:**


- [Debian:info](https://buildinfo.Debian.net/) received `buildinfo` files fromsome Debian package developers & automated builders

- Fedora has a system where developers can confirm a package works
**(e.g. on N architectures)**; this is not about build reproducibility
but it is an example of multi-party validation


##### Do we want a shared database of rebuilds? Standardize? Centralize?


- SPOF is a problem. Each rebuilding org could publish their own
`buildinfo`.

- For complex queries like "what package was built by package X"
we need access to all such databases?


##### How do we lookup reports?

--------------------------------


- Lookup by hash? This only tells us that someone reproduced a build,

- but it doesn't tell if someone got a non-matching build.


- Lookup by project namespace + project-specific info,
e.g. distro + (package, arch, version)?


##### Marketing
---------------------------------------

##### How do we convince orgs to run rebuilders?


- Have a few high-profile rebuilders **(e.g. CCC, Wikimedia, ACLU)** who
can each explain their own reasons.

- The argument can be tailored to every potential rebuilder.


##### Bonus features & ideas
----------------------------------------------

- Reuse this for the **"I want to rebuild all packages locally before**
**installing"** policy.

- Reuse this for the **"if rebuilders don't agree, then rebuild**
**locally"** policy.

- Publish the metadata for a partial mirror that only contains
packages I could successfully reproduce. But the actual packages
would not be hosted here, they would be fetched from
regular mirrors.

- Is it OK to rebuild only subset of the packages? In the discussion
about `end-user/sysadmin policy` we simplified and assumed rebuilders
would build all packages. OTOH every rebuilder will start from
having rebuilt 0 packages.

- Build every package once, or potentially more than once (e.g.
building random packages)?

- Allow rebuilding only package uploaded signed by a specified list
of DDs.

- When local build does not match, publish binary artifacts or at
least diffoscope. They could be garbage-collected based on how much
disk space was allocated to the rebuilder by the sysadmin. F-Droid
rebuilder publishes diffoscope output for non-matching builds.

##### Working sessions VI

-------------------------------------------------------

** Mapping out our short- and long-term goals **


**(by decreasing order of priority)**

####### One year

-----------------------------------------------------


- Reproducible hackaton # 2

- Reproducible summit # 4

- ``.buildinfo`` files published by Debian

- tools to compare & aggregate ``.buildinfo`` files

- cross-distro <https://tests.reproducible-builds.org/>
 cross-distro `issues.git`

- The Unreproducible Package™ covers more than 42 issues and 10 languages
 we have a logo, stickers and t-shirts


###### Two years

-----------------

- rebuilder run by recognized organizations

- Debian Policy says **"packages MUST be reproducible"**

- 99% of Debian Buster is reproducible

- We are recognized as a trusted organization by official projects

- OS installation images are reproducible

- Qubes OS is reproducible

- Users can set their r-b policy in a Debian release

- Easy to rebuild packages from Debian stable

- Debian wiki pages are obsolete

- Easy to answer **"where was this binary built"**from, by whom, how?
(source code, build environment)

- change of paradign of the **"free software"** definition → software is
only free if it can be rebuilt reproducibly

- the reproducible builds project is very well-known in the FOSS
community worldwide

- FLROSS ?

- GPL v4 requires reproducible builds


###### Distant goals
-------------------------------------------
- 100% reproducible packages (verifiable)

- proper bootstrapping i.e. guaranteed reproduciblity from scratch
without binary blobs

- a commercial interest in reproduciblity builds (expressed as
requirement for procurements)

- reproduciblity non-free software?

- expand reproduciblity builds to more distros and systems, more
adoption, reproduciblity packages are the default, being
non-reproducible is considered as a bug by a broad community

- secure building networks / decentralized and community building

- No talk with **"reproducible"** in the title at FOSDEM

- Reproducible Debian in space


###### Unknown

- Reproducible Lineage OS

###### How to onboard new contributors



**Related:** <https://pad.riseup.net/p/reproduciblebuildsIII-newcomerdocumentation>

- What are the goals of a newbie?

- What problems do newbies have to get started?

-> problem: spread out resources ML, git, alioth, wiki

- **want:** web-page with **"gzip"** in red and **"gzip -n"** in green


- **want:** find the reproducibility status of packages in other distributions

- is it reproducible, what patches are required?

- Make RB status pages more discoverable

- Needs UI designer to make tiny hidden links more visible

- FAQ how to find information about status of a package in a distribution ; also past rb bugs + patches relating to that package - if possible also tools patches


###### more advertising of toolchain patches


For developers, wanting to get reproducible results from make

###### describe your build environment


**Q:** how to make my software reproducible?

- How to check if my software is reproducible?

- Reprotest, tests.r-b.o, reproducible-opensuse tools, describe manual process

- How to find out why not?

- Look at diffoscope output for relevant strings and use them to locate relevant source: grep -r "Build date: %s"

- Investigate where output files come from and if any of the inputs differ, recursively

- Check for other sources listed in `theunreproduciblepackage`

- How to fix?

- Refer to `README` files in theunreproduciblepackage and other rb docs

**Maybe:** How to make sure that it remains fixed?

- (e.g. re-test every month)

- How to ask for help with the above?

- ML, IRC, useful information to include

- Add call for action

###### Add **"for developers"** / **"how to get involved"** page to r-b.org

- **"Resources"** is wrong for ML **(Community/Communication channels)**

###### People without own software:

What can I do to help?

- work on r-b tools, fix Debian packages and FLOSS upstream projects, work on test infrastructure

- use **"reproducible-check"** on your Debian system


- **Good:** want to discover about the subject with direct links to videos, link to event page


News blog under Debian.org instead of r-b.org, news on r-b.o is not updated, can appear orphaned move ? separate marketing updates from developer information?

- r-b.o/docs are read and somewhat useful, but maybe too theoretical or not well-ordered.
- **Next steps:** add **"get involved"**, **"for developers"**, **"for distributors"** page

- **Tools section:** links to Debian package of reprotest, disorderfs, strip-nondeterminism instead of generic project website

- de-Debianize, have tarballs discoverable #  PyPI is outdated anyway and not as useful


###### Identifying next actionable steps for marketing outreach



- **Overall marketing goal:** Get more people to embrace, support and implement reproducible builds


- **Audiences we had identified in the Marketing I session:** Compiler builders
    - Software distributing companies
    - Academics
    - Developers (added post-session)
    - we expand on the audiences we previously identified:

- Toolchain developers
- Companies that produce and distribute software
- Universities / academics
- Developers in general
- Governments and policy makers
- Powerful users (software consumers)

###### For each audience we want to identify:


* Why reproducible builds are valuable to them, from their perspective
* Example of success stories we want to see happen
* Where to reach them, both online (lists, etc.) and offline (conferences, etc.)
* Next steps and action items


###### Developers in general
-----------------------------
###### Developers:

- those who develop their own software

- those working with other software


###### Values:

- Here is my software, it build reproducibly, and I am proud of it.

- Higher quality, interest of the user and interest of other developers. User pressure is a good makreting value point.

- I am a dev I didn't know how to prove that my work is rb. With reprotest I can achieve that.


###### Action items:

- get documentation to support devs to know how to use reprotest in this regard.

- documentation re sending patches to upstream


###### Toolchain developers


**They have 2 key issues:**

- Toolchain is not reproducible

- It doesn't work deterministically


###### Values:

- Trustworthiness from other developers

- It's easier to debug a toolchain that is well defined

- Reproducibility improves resource sharing (because all resources are equal)

- Benefit to their users


###### Example of success story:

- Continuous integration systems


###### Action items


- Find instances in which something bad happened and could have been prevented. Search for bug reports to find these cases and write a post-mortem of the bug report.

- **GUIX:** direct outreach with upstreams. reach sevral language communities.
- **Conferences:** FOSDEM, also small ones.
    - **Talk:** good for ppl who already know about rb.
    - **Table:** even better espec. for folks who don't know rb yet
- Have a logo and get a banner for booths.


###### Academics

-----------------------------


- We're focussing on scientist, and particularly on disciplines whose
published results rely a lot on software.
- There's an ongoing **"reproducibility crisis"** in science.
- Some leading journals (e.g. Nature) now require software that a paper
relies upon to be FOSS.
- These people already have a concept of **"reproducibility"**, which is
good. Sadly it doesn't match ours. How do we bridge these 2 concepts?

We have some scare stories that prove that non-reproducible software
can lead to non-reproducible papers:


Benchmarks are only reproducible if the benchmarking software can itself be
built reproducibly a version string is not enough to describe what software one
shall use to reproduce results: e.g. two R binaries built from the same source,
but with different versions of build-dependencies, can produce different
results


**ACTION:** write **"The Unreproducible Paper"** (similar to **"the**
**unreproducible package"**) that shows how so-called reproducible
research results can't be actually reproduced if they rely on
non-reproducible software.


- Where to find interested people who can have some leverage: computer
science, ACM, fields that already care a lot about FOSS.
and reproducibility.


###### Companies

------------------------------------------------------------


- We focused on companies that produce and/or distribute software.


###### Value of RBs to them

--------------------

- Save costs and time to remediation for security problems
(interestingly, these arguments work for internal and proprietary
software as well) reduce scope of QA upon incremental changes: why are you testing

What has not changed?

- faster builds and automated tests ⇒ shorter feedback loop for
developers ⇒ more enjoyable and productive workplace
- Increase trust existing & future consumers can put into your

Software i.e. competitive argument vs. other FOSS vendors
(this requires the software to be FOSS in the first place)
E.g. RHEL vs. CentOS: why should I trust the RHEL binaries if
I can't reproduce them?


- Lower the incentive for adversaries to target your build systems
and the people who run them. Incidentally, this allows you to allow
less trusted people (e.g. junior sysadmins) to manage your
build system.


- Companies that produce/distribute software also consume some
 the marketing speech tailored for companies that don't produce software works here too.


###### Success stories

---------------


- We're told that Microsoft has shortened a lot their feedback loop
and time to remediation thanks to RBs.

**ACTION:** quotable reference needed


- Bazel (Google) and the many companies that use it.

- Turn high-profile organizations (NASA, Tesla, Google etc.) into success stories / advocates:

**ACTION:** find out if they use reproducible builds; if yes, why?

We get a success story and probably new selling points; if not, then it's a good case for arguing in favor of RBs.

###### Funding reproducible builds work

**Funding for RB - Mapping Session**


**3 steps:** Mapping the status quo of resources currently flowing into RB; identifying what is working well and where there is room for improvement, finding solutions to the needs that need to be addressed


###### Funding consists of 4 major groups:


- Material and infrastructure (sponsored hardware: servers/cpu, free tools: CI, repositories)


- **money:** one-off funding and sustained funding, travel support for conferences and meetings.


- **Time:** Volunteer work; paid interns through Summer of Code programs, Outreachy etc; convince your boss to let you spend some of your working hours to work on RB; fix a client's/company's problem and get paid for it


- **Community:** Working on documentation, advertising & spreading the word, mindshare; offload work from Debian maintainers to upstream and get them involved in the idea


- Material and infrastructure is working well.

- Money is somewhat erratic, it's not certain how sustained funding will and can be.

- Time is the most scarce resource, and it's closely interconnected to Community, to which there hasn't been a large effort so fart.


###### Solutions:

- Material/infrastructure:


- get the donor to maintain


###### Money:


- form a task group to focus efforts for fundraising > frees up developers' time


- funding might be easier to get for a formal organizational entity/structure like a foundation - lots of work


###### Bounty Hunters


**Time & Community**


###### delegate


- Call for volunteers > explicitly ask for time (vs. implicit in the project)

- Ask employers to donate time explicitly and implicitly (e.g. through making their software reproducible)

- Focus on practical benefits for RB
- Spin software scandals caused by non-RB software practices, make use of public exposure of the topic

- Find a person to coordinate volunteers, build a community (esp. GSoC interns, they need more than being allowed to work to support you afterwards)

- Sell RB to government advisory groups - do the beer drinking hand shaking thing

- Explain RB - don't say what it is technically, but what it wants to achieve and what its impacts will be
- Badges for projects to display their reproducible pride
be present at events, do meetups, to engage a wider audience


###### Working sessions VII



**Enabling cross-distro reproducibility**


###### repro-builds

**DDC:** Diverse Double Compilation

- We have a failing test case for reproducibilly build GCC via DDC on guix

- The ultimate DDC would be being able to do cross distro DDC

- Why do we want to have the same binary for gcc on Debian?


- Golden bootstrap compiler that everyone agrees on. This **"golden bootstrap"** compiler becomes the root of the software compilation DAG.


- Other binaries may be bit identical universaly. For example a bit identical TOR would be lovely. However, gcc is a good start.


**ecomendation:** gcc 4.7 (which doesn't require C++ support to compile)


- For a canonical TOR, you need to agree on library versions.


-------------------------

###### Goal:


- For equal build infos do we get equal binaries? We should have a script for comparing `.buildinfo` files and determining if they are equal.


###### Current state:

- At the moment, `.buildinfo` is not a meaningful cross distro data format.


###### Goal:

- Rather then declaring build-info the defacto shared standard. We should define the semantic space that any given build-info like format needs to store and the create tools for converting between the formats.


######  Current state:

- `.buildinfo` currently specifies some of the data, but not all of the data, required to define a build environment.


###### Current state:

- Things are worse then they seem cross distro. Even if we specify the build environment percisly in terms of which library version was used. We still need to normalize the builds of all build dependencies.


---


###### Current state:


- At some point Suse had a non-polished reproducibly building gcc patch. This patch was not submitted.


----


###### New goal:

- Don't solve the build dependency comparison problem yet, because we don't know how to solve it. Solve the SIMPLIST case. Try to create a golden tinycc.

---------------------------

- How much work can we share in a canonical build process for a bootstrapped binary identical tinycc?

--------------------------------------

- Should we have a shared build system or a shared recipe and multiple build systems?

- This recipe should work with any c **compiler/multiple compiler**s.
- We want to specify only the parts of the recipe which actually effect the output. But not specify the entire **"hash"** of the exact system used to build.


-------------------------------------------------------


This is DDC (Diverse double compilation)


	|-------------| |-------------| |-------------|
	|tinycc source| == |tinycc source| == |tinycc source|
	|-------------| |-------------| |-------------|

	↓ ↓ ↓

	|-------------| |-------------| |-------------|
	|any c compile| != |any c compile| != |any c compile| (any c compiler)
	|-------------| |-------------| |-------------|


	↓ ↓ ↓


	|-------------| |----------------| |----------------|
	|tinycc bin 1 | != |tinycc bin 2 | != |tinycc bin 3 |
	|-------------| |----------------| |----------------|


-------------------------------------------------------


	|-------------| |-------------| |-------------|
	tinycc source| == |tinycc source| == |tinycc source|
	|-------------| |-------------| |-------------|


	↓ ↓ ↓


	|-------------| |-------------| |-------------|
	|tinycc bin 1 | != |tinycc bin 2 | != |tinycc bin 3 |
	|-------------| |-------------| |-------------|


	↓ ↓ ↓


	|-------------| |-------------| |-------------|
	| tinycc bin | == | tinycc bin | == | tinycc bin |
	|-------------| |-------------| |-------------|


---


- We want to create a reproducible build path for tinycc which works on any POSIX environment.


---


- We want to make the paths hyperdiverse. Basically fuzz testing on this process.


---


- Try on many computers even running the same system.




----


**End goal:** Create a common bootstrap method and start comparing hashes.

- Create a bootstrap@home project where anyone with some spare CPU cycles can run the script and report back the hash they got.

###### Exploring reproducibility for Mac and Windows

**Cross-building reproducibly**


###### For Windows


- For Windows, it is possible to use the mingw-w64 toolchain. There are packages in Debian (and more distributions), but it is quite old and therefore more recommended to build it from source (from the Git repository).


- **possible action item:** update the Debian package


- This toolchain is still actively maintained, and notably used to build Firefox for Windows. It is possible to build against the official MSVC run-time from Microsoft, which can be freely downloaded from the Windows website.


###### Instructions can be found at:

<https://git-rw.torproject.org:builders/tor-browser-build.git>

(there is a `README` file)


- There is a configuration file for each component, written in YAML. A tool called "rbm" parses the YAML and takes the steps required to build (and is already capable to create containers).


- (I can picture some sort of integration with Salt to auto-create build VMs)


- This toolchain can apparently also be built through pkgsrc (the NetBSD packages) on a number of different platforms (cross/mingw).


###### For Mac OS X and iOS


- Apple doesn't seem to care about Reproducible Software. They use their own toolchains internally, which they do not distribute.


###### However, it is possible to:

* cross-compile for Mac OS X with clang;

* use Xcode to build reproducibly for iOS (except when signing)


In the same repository as above, there are also instructions for cross-building for Mac OS X. It downloads and leverages the official SDK for Mac OS X.


It is technically possible to run Mac OS X in a VM, although it is apparently illegal. The Mac OS X installer can be leveraged to generate bootable removable media to install it. VirtualBox supports it explicitly: there is a host profile for Mac OS X on Intel 64-bits.


###### A container technology is also available for Mac OS X.


**General notes**


- The path to the toolchain used can end up in the final binaries (eg GCC).


- Reproducibility can be useful for performance, eg if people can more easily share binaries because they know they are generated identical (caching). The

- real-world use-case brought up involves computer clusters shared among many users.

######  What does code-signing means in terms of reproducibility?

###### **code signing**
--------------------------------------------

- General area of this session: source code
signing, e.g., signing tar balls, git
commits, etc.


- Summary of ideas that came up; no definite conclusions of the session unfortunately.


- **Goal:** know that this code comes from upstream
(i.e., I have the same code as upstream)

- Besides upstream there are also the steps
by packaging; also an upstream has more than
one developer.
- F-droid is building from git commits, so commit/tag signing does a good job there
- reproducible builds is about getting things
in the open (backdoors now have to be backdoors
in source), so provinence could be a next steps.
- Packages can ship upstream tarballs and upstream
signatures; should that be part of the `.buildinfo`
file?
    - Useful for a rebuilders if they detect malicious
things in the code

- Management of key? (I.e., what do all the signatures
buy me if I don't know how are those persons?)
    - At least maintainers etc can show where they got
the code from Using it in the update process? (I.e., only automatic
updates for upstream signing releases?).

- Useful for sharing the load of maintenance (e.g.
maintainer hand-over explaining in a formalized way
what the upstream signatures are supposed to look
like)


- Trust chain from upstream to the binary on my machine
- Reproducible builds bridges the gap between the binary
and the source package
- Code signing can bridge the gap from upstream to the
source package


- Cross distro comparison? "Is the upstream source of
XYZ version ABC the same as that in all other distros"
 only trust keys that have been around some time (new
keys a cheap, so people can always restart a new identity
under a new key)


- Non-distributable binary blobs make distribution upstream
signatures useles.


- Upstream tarball rerolls... **sigh**
(should be a hit on upstream reputation!)
(Maybe an argument to distribute signatures in source
packages).
- Whole different project: chains of signatures (i.e.,
releases signatures should also sign the signature
of the previous release) `.buildinfo` are already necessary for forensics; so
why not add the remaining things used for forensics
(singatures allowing to get source code provinence)
Optional field in `.buildinfo` files for the
content of an upstream signature?


###### Prioritizing the minimum viable set of tools needed for end users


- User-provided list of reproducers (represeted by URL, name, signing key)

- A reproducer provides signed statements for each package they have built reproducibly

- APT queries each reproducer with these bits: origin, name, architecture, version (this is unique across all versions of Debian)

- Lookup by hash is problematic because we cannot distinguish between **"failure to reproduce"**, **"FTBFS"**, and **"not tried/built yet"**

- Reproducers return either a signed statement of **"not tried/built yet"** or a signed hash of the output (e.g. their `.buildinfo` file)


###### Even nicer:

- Upload the `.buildinfo` file, because it contains origin, name, architecture, version, and hash; this avoids the problem of looking up by hash alone. Downside: more bandwidth used.


###### OPEN QUESTIONS:

- Can we mirror the signed `.buildinfo` files to avoid centralising this?

- What happens if the reproducibility status changes over time?

- Can we (eventually) avoid these rebuilder servers by looking up `.buildinfo` files on `buildinfo.debian.net` that are signed by entities the user trusts?


###### ACTION ITEMS:

- Mock up a simple web server that always returns the hash + reproducibility status; this requires either read-access to the binaries or access to a database with records of binaries + hashes (e.g. the Debian archive) do this on localhost with access to the local deb cache (obviously on localhost that's going to be an exact match, each time)

- Set up a second web server that returns a random hash once in a while

- Write an apt-hook that contacts the simple services and verifies their responses unless the package is in the blacklist.

- Design the API the web server ought to implement and through which the client communicates with the service.

- Do this over TLS so that installation details are not leaked to the limited number of reproducers.


- For proper testing we really should have an actual rebuilder, but until then we can download the `.buildinfo` files from coccia.Debian.org (FTP master mirror) and serve them when queried by hash (or `.buildinfo`).



###### Transcription of poster notes


**day 3 PM**


###### User Policy/Implementation


(@left top)

- N = 3 trusted rebuilders

- K = 2x signed `.buildinfo`


(@middle) (@right top)

[Signed `.buildinfo`s](coccia.Debian.org) (ftp master mirror)

 [buildinfo.Debian.net](buildinfo.Debian.net)

* signed statement: (?)

* **reproduced by:** 6

* **dissent by:** 2

* not found/not built yet 2


###### (@left corner)

buildinfo query

--------------------------------------


* by hash - only finds _agreements_, not dissent

* by domain-specific unique ID:

- Debian: $pkg, $vers, $arch

* by buildingo! (contains the above)




###### (@right corner) (@also right corner)

----------------------------------------
- Debian main Rebuilders
- Archive/mirror * ccc
- Deb -------------> * k of n agree on hash? <--- * nsa
- (n = fixed number) * aclu
    * all must agree?
    * signed `.buildinfo`

###### Discussing current status and potential improvements in regards to `.buildinfo` files for RPM and iso


- Fedora has multiple `.buildinfo` files which can be fetched by a webservice

- openSUSE build system has a file with list of installed packages and their version. **"buildenv"**

- `.buildinfo` files are to new, so RPM build utilities doesn't create it.

- There is an upstream of RPM, but every distribution applies additional patches.

- RPM should create `.buildinfo`.


- There is a starting point at <https://github.com/woju/RPMbuildinfo> as shell script which produce similar files than Debian.

- Debian `.buildinfo` can be found at <https://manpages.Debian.org/unstable/dpkg-dev/deb-buildinfo.5.en.html>


**Task:** find someone who do RPM development or someone from redhat, Fedora, opensuse

**Task:** show RPM `.buildinfo`.Add checksums (sha256) of the inputs into the `.buildinfo` files.

- We discussed about where to put `.buildinfo` file. We suggest to have a separate file, but it could be controversial for the RPM project.


###### iso

**The iso contains of:**

**"Classic"** Build Environment

- Packages which are part of the installer (bootloader, installer binary, dependencies of the installer)

- Packages which are on the disk as part of the Repository, which the installer will use to install.
