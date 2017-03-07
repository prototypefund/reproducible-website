---
layout: event_detail
title: RPM
event: berlin2016
order: 80
permalink: /events/berlin2016/RPM/
---

brainstorming notes:
    
Open build service ( http://openbuildservice.org/ ) that runs various configuration for RPM. Vary environment / ... easy.
Build service sign the binaries that get published to the mirror infrastructure
~
Discussion point: signatures, you can copy signatures to on the newly built package to obtain the same package.
~
OpenSUSE might still have MD5 in some places, Fedora has switched to SHA-256.
~
for fedora "Mock" creates the environment and chroot, install build dependencies and build. So build is failing when missing depenency.
(END)
Needs to set SOURCE_DATE_EPOCH? Timestamp will be different, but timestamp is in the spec file? A end-user might want to download a source package from anywhere.

Problems in RPM?
  - What is the base level of info to have a reproducible build? Is RPM sufficient?

* srpm does not specify the actual dependencies that will be used to build (gcc x.y.z). Maybe need a build-info file.
* not custom field in rpm metadata? No, cannot add arbitrary build metadata to RPM
  Can the metadata extended? Potentially
* Needs a metadata of the RPM not in the RPM.
    RPM = cpio archive, want bit-by-bit reproducible ideally
* Issues
    order within the archive needs to be deterministic
    timestamp
* Identifies the problem for reproduicibility in changing RPM
    potential push back on removing the build time from the header
    host name might be an issue too.
* List of criteria -> see debian and reproducible-build.org
  then set-up test suite to assert reproducibility

* Need to record stuff?
  - cpu_type?
  - version of mock used?
  - how much of the extra stuff we need to record?
      -> You can record more than you need, it is ok to have different build info files.
* Interesting: compare build in openSUSE and Fedora (different build system), do we get the same output?
  Just run and use diffoscope to compare the output.

* 1 or 2 small goals for the RPM
  - Getting to know what need to change in RPM build to attain
  - Document level of reproducibility with a standard test suite (where vary time then env then path then X...)

(disgression on debian not normalizing the environment) -- 15' left

* tool to reproduce the environment (build input, etc...)
  would take build info and set-up the build environment
* tool to generate build-info from RPM file
  would be of use for Qubes OS
  Idea for a hackathon tomorrow?
  Could be part of the RPM tool itself or other place.
  Capture uname is easy but capturing mock or similar fake environment builder.
  take idea from the debian build infos files.

Report:
  What info on build info file to be reproducible and what kind of tool to make it easy.

-
