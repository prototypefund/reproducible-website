---
layout: new/event_detail
title: What is the ecosystem around rpm?
event: berlin2017
order: 50
permalink: /events/berlin2017/ecosystemrpm/
---

two types of rpm: source and binary

src.rpm: tarball, build instruction, etc

rpm packages are signed; one can take signature from one rpm to another, as long as other part is the same

also, for comparing one can strip signature

package itself is reproducible already, patches already included upstream:
- %_hostname macro
- $SOURCE_DATE_EPOCH as build date
- use topmost changelog entry as $SOURCE_DATE_EPOCH (%source_date_epoch_from_changelog macro)
- clamp file timestamps to $SOURCE_DATE_EPOCH (%source_date_epoch_from_changelog macro)
- size of directories included in cpio inside of rpm -> zero
- ghost files (files owned by package, but not included in actual archive),

rpm include hash of such file (from build environment) -> fixed; file size is still included (it is a feature)

rpm include compiled python files, which contains timestamp of source files;

clamping mtime (of source files) may in some cases break this - if mtime does

not match here, python recompile the file each run

PEP 552 - use source hash instead of mtime

openSUSE: open build service, produce "buildenv file", including hashes of build inputs

osc - client tool to build package locally; this tool is also packaged for Debian

build path doesn't matter, it is constant (chroot env)

interesting topic: use reprotest for rpm packages

reproducibility testing in openSUSE: not automatically, but there are manual results

further tasks:
- document current status, environment

