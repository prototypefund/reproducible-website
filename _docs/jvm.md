---
title: JVM
layout: docs
permalink: /docs/jvm/
---

The JVM ecosystem provides many languages and build tools.
Since the JVM is not reproducible-friendly from the beginning
-- jar/zip files, with files order and timestamp, are a first natural source of variation --,
each build tool requires some work to provide Reproducible Builds.

Buildinfo File
--------------

Whatever the build tool is, binary JVM artifacts are generally published in artifact repositories
like [Maven Central](https://search.maven.org/) or [Google's Android Repository](https://dl.google.com/dl/android/maven2/index.html).

Being able to rebuild artifacts published in these repositories will require some information: where to get the source tarball from,
which environment to setup to rebuild the artifacts.

This is the puropse of JVM Buildinfo files that are expected to be published alongside artifacts
as `${artifactId}-${version}.buildinfo`, in Java properties format:


```
#### Work In Progress ####
name=<name as in pom.xml>
groupId=<groupId as in pom.xml>
artifactId=<artifactId as in pom.xml>
version=<version as in pom.xml>

# source information, as source tarball in repository and/or scm coordinates
source=<groupId>:<artifactId>
source.extension=<extension, usually zip>
source.classifier=<classifier, usually source-release or src>
scm=<source control management url as in pom.xml>
scm.tag=<source control management tag as in pom.xml>

# build environment information
java.version=<full Java version>
build-tool=<mvn|sbt|...>
# sbt-specific information
sbt.version=1.2.3
scala.version=2.12.6

# output
output.1.filename=<file name>
output.1.length=<file size>
output.1.sha512=<sha512>
```

Notice that `${artifactId}-${version}-sources.jar` files published in Maven repositories are not buildable sources, but [sources for IDEs](https://central.sonatype.org/pages/requirements.html#supply-javadoc-and-sources).
Source tarballs, intended for building, are not always published in repositories but only sometimes, with 2 classical naming conventions:
- `${artifactId}-${version}-source-release.zip` (see [artifacts in Central providing such source tarballs](https://search.maven.org/search?q=l:source-release))
- `${artifactId}-${version}-src.zip` (see [artifacts in Central providing such source tarballs](https://search.maven.org/search?q=l:src))

Reproducible Builds for Maven
-----------------------------

See [https://reproducible-maven-builds.github.io/](https://reproducible-maven-builds.github.io/).

Reproducible Builds for Scala SBT
---------------------------------
