---
title: JVM
layout: docs
permalink: /docs/jvm/
---

The conventions for the JVM ecosystem are under active development, 
see how-to [contribute]({{ "/contribute/" | prepend: site.baseurl }}).

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
[Java properties format](https://en.wikipedia.org/wiki/.properties):


```
#### Work In Progress ####
buildinfo.version=1.0-SNAPSHOT

name=<name as in pom.xml>
group-id=<groupId as in pom.xml>
artifact-id=<artifactId as in pom.xml>
version=<version as in pom.xml>

# source information, as source tarball artifact in repository and/or url and/or scm coordinates
source.artifact=<groupId>:<artifactId>:<version>:<classifier>:<extension>
source.url=<url where to download official source tarball>
source.scm.uri=<source control management url as in pom.xml>
source.scm.tag=<source control management tag as in pom.xml>

# build instructions
build-tool=<mvn|sbt|...>
build.setup=<optional url of documentation explaining specific additional setup when necessary: will be enhanced in a future buildinfo format version>

# effective build environment information
java.version=<full Java version>
os.name=<Operating system name>
source.used=<artifact|url|scm, depending on which has been used for the build>

# Each build tool or plugin is free to add additional entries to the buildinfo,
# both for build instructions and effective build environment.
# For example, the sbt plugin may add the following for Scala:
sbt.version=1.2.3
scala.version=2.12.6

# and Maven could add data on rebuild instructions and effective environment:
mvn.rebuild-args=-Dmaven.test.skip package
mvn.build-root=<groupId>:<artifactId>:<version>
mvn.version=3.5.4

# A buildinfo file can contain checksums for multiple output files, for
# example for the main jar and the accompanying pom.xml (when generated):
outputs.0.filename=<file name>
outputs.0.length=<file size>
outputs.0.checksums.sha512=<sha512>
outputs.1.filename=<file name>
outputs.1.length=<file size>
outputs.1.checksums.sha512=<sha512>
...
```

Notice that `${artifactId}-${version}-sources.jar` files published in Maven repositories are not buildable sources, but [sources for IDEs](https://central.sonatype.org/pages/requirements.html#supply-javadoc-and-sources).
Source tarballs, intended for building, are not always published in repositories but only sometimes, with 2 classical naming conventions:
- `${artifactId}-${version}-source-release.zip` (see [artifacts in Central providing such source tarballs](https://search.maven.org/search?q=l:source-release))
- `${artifactId}-${version}-src.zip` (see [artifacts in Central providing such source tarballs](https://search.maven.org/search?q=l:src))

Auditing a Build
----------------

As explained on top of this page, by default, jars  found in public repositories probably won't be reproducible. But you can try to rebuild them and
measure how much they are not reproducible:

1. download the jar from a public repository,
2. determine which major version of JDK was used to produce it: usually, the full Java version is found in `META-INF/MANIFEST.MF` by running `unzip -p xxx.jar META-INF/MANIFEST.MF`
3. find sources and build instruction on originating project site
4. rebuild with a JDK of the same major version than the version found on step 2
4. examine the differences using [diffoscope](https://diffoscope.org/)

Usually, you'll find a few files that are different, in addition to zip content timestamp and order.
Notice that if you didn't use the same JDK major version, you'll see many differences in .class files.

Improving the build to get reproducible build will then be specific with each build tool.
You may discuss issues and fixes on [Reproducible Builds mailinglist]({{ "/docs/contribute/" | prepend: site.baseurl }}).

Reproducible Builds for Maven
-----------------------------

Getting reproducible builds with Maven requires configuration: see [https://reproducible-maven-builds.github.io/](https://reproducible-maven-builds.github.io/)
for more details.

### source release archive
To create a source release archive, see [Apache Source Release Assembly Descriptor](https://maven.apache.org/apache-resource-bundles/#Source_Release_Assembly_Descriptor)
that is commonly used. Nothing prevents you to create your own assembly descriptor or even use another plugin: don't hesitate to share recipes.

### rebuild arguments
A rebuilder does not need to execute integration tests or even unit tests, may even skip compiling unit tests.
Classical arguments contain following patterns:
- `package` phase: no need to `deploy` or even `install`
- `-Dmaven.test.skip`: avoid running tests and even compiling tests
- `-DskipTests`: avoid running tests, but still builds (necessary for some projects)
- `-Dgpg.skip`: avoid pgp signing
- `-Papache-release` or any release profile: activate release-specific tasks used by `maven-release-plugin`
- `-Dline.separator=$'\r\n'`: define Windows line endings from an Unix environmenent

### multi-module build
For multi-module builds, each produced artifact will have its
own buildinfo file with `mvn.build-root` property defined, to know the root from which the
rebuild must happen.

Reproducible Builds for sbt
---------------------------

When using [sbt](https://www.scala-sbt.org/), a build tool popular with Scala
projects, you can use the
[sbt-reproducible-builds](https://github.com/raboof/sbt-reproducible-builds)
plugin to strip your artifacts and share buildinfo information.
