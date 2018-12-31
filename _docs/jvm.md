---
title: JVM
layout: docs
permalink: /docs/jvm/
---

The conventions for the JVM ecosystem are under active development.
Join the discussion on the
[mailinglist]({{ "/docs/contribute/" | prepend: site.baseurl }}).

The JVM ecosystem provides many languages and build tools.
Since the JVM is not reproducible-friendly from the beginning
-- jar/zip files, with files order and timestamp, are a first natural source of variation --,
each build tool requires some work to provide Reproducible Builds.

Buildinfo File
--------------

Whatever the build tool is, binary JVM artifacts are generally published in artifact repositories
like [Maven Central](https://search.maven.org/) or [Google's Android Repository](https://dl.google.com/dl/android/maven2/index.html).

Being able to rebuild artifacts published in these repositories will require some information: where to get the sources from,
which environment to setup to rebuild the artifacts.

This is the puropse of JVM Buildinfo files that are expected to be published alongside artifacts
as `${artifactId}-${version}.buildinfo`, in
[Java properties format](https://en.wikipedia.org/wiki/.properties).
For multi-module builds, each produced artifact will have its
own buildinfo file:


```
#### Work In Progress ####
name=<name as in pom.xml>
group-id=<groupId as in pom.xml>
artifact-id=<artifactId as in pom.xml>
version=<version as in pom.xml>

# source information, as source tarball in repository and/or scm coordinates
source=<groupId>:<artifactId>:<version>:<classifier>:<extension>
scm=<source control management url as in pom.xml>
scm.tag=<source control management tag as in pom.xml>

# build environment information
java.version=<full Java version>
build-tool=<mvn|sbt|...>

# Each build tool or plugin is free to add additional entries to the buildinfo.
# For example, the sbt plugin may add the following for Scala:
sbt.version=1.2.3
scala.version=2.12.6

# A buildinfo file can contain checksums for multiple files, for example for
# the main jar and the accompanying pom.xml:
files.0.filename=<file name>
files.0.length=<file size>
files.0.checksums.sha512=<sha512>
files.1.filename=<file name>
files.1.length=<file size>
files.1.checksums.sha512=<sha512>
...
```

Notice that `${artifactId}-${version}-sources.jar` files published in Maven repositories are not buildable sources, but [sources for IDEs](https://central.sonatype.org/pages/requirements.html#supply-javadoc-and-sources).
Source tarballs, intended for building, are not always published in repositories but only sometimes, with 2 classical naming conventions:
- `${artifactId}-${version}-source-release.zip` (see [artifacts in Central providing such source tarballs](https://search.maven.org/search?q=l:source-release))
- `${artifactId}-${version}-src.zip` (see [artifacts in Central providing such source tarballs](https://search.maven.org/search?q=l:src))

Reproducible Builds for Maven
-----------------------------

See [https://reproducible-maven-builds.github.io/](https://reproducible-maven-builds.github.io/).

Reproducible Builds for sbt
---------------------------

When using [sbt](https://www.scala-sbt.org/), a build tool popular with Scala
projects, you can use the
[sbt-reproducible-builds](https://github.com/raboof/sbt-reproducible-builds)
plugin to strip your artifacts and share buildinfo information.
