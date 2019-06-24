---
layout: new/event_detail
title: RPM II
event: berlin2016
order: 100
permalink: /events/berlin2016/RPMII/
---

Plan:

 * create a tool to generate buildinfo files similar to Debian's
 * later create or extend a tool to use buildinfo to create a similar environment to rebuild a package later

Next steps:

 * put the pieces together
 * test it
 * add it to a git repo


- buildinfo spec (Debian): 
  * [https://wiki.debian.org/ReproducibleBuilds/BuildinfoFiles](https://wiki.debian.org/ReproducibleBuilds/BuildinfoFiles)
  * [https://manpages.debian.org/cgi-bin/man.cgi?query=deb-buildinfo&apropos=0&sektion=0&manpath=Debian+unstable+sid&format=html&locale=en](https://manpages.debian.org/cgi-bin/man.cgi?query=deb-buildinfo&apropos=0&sektion=0&manpath=Debian+unstable+sid&format=html&locale=en)
- RPM file format (draft?): [http://rpm.org/devel_doc/file_format.html](http://rpm.org/devel_doc/file_format.html)

example buildinfo files at [https://buildinfo.debian.net/](https://buildinfo.debian.net/)

to be run at the end of rpmbuild or after it, run by the tool calling rpmbuild or both (second one appending extra information)

### buildinfo generator code snippet:
<pre>
echo Installed-Build-Depends:
# might need to run outside the build chroot, because it might have an incompatible rpm version that cannot read the DB created by a newer rpm
rpm -qa | sed -e 's/-\([^-]*-[^-]*\)\.\([^.]*\)$/:\2 (= \1)/; s/^/ /'
#                      ver   rel        arch
echo Environment:
for var in LANG LC_ALL SOURCE_DATE_EPOCH ; do
  eval value=\$$var
  [ -n "$value" ] && echo " $var=\"$value\""
done
# whitelist in dpkg: [https://anonscm.debian.org/git/dpkg/dpkg.git/tree/scripts/Dpkg/Build/Info.pm#n50](https://anonscm.debian.org/git/dpkg/dpkg.git/tree/scripts/Dpkg/Build/Info.pm#n50)

function getos
{
  test -r /etc/os-release && . /etc/os-release
  if [ -z "$ID" ] ; then
    ID=$(cat /etc/system-release)
  fi
  echo "$ID"
}
echo "Build-Origin: $(getos)"
echo "Build-Date: `date -R`" # - not from rpm because that will be $SOURCE_DATE_EPOCH



libc6:i386 (= 2.24)
libgcc:x86_64 (= 4.4.7-17.el6)

printf 'Format: 1.0\n'
printf 'Build-Architecture: %s\n' "$(uname -m)"

Source: $(rpmspec -q --queryformat '%{name}' "$specfile")
Binary: $(find $(rpm --eval %{_rpmdir}) -name *rpm|xargs rpm -qp --qf "%{name} ") # /usr/src/packages/RPMS/*/*.rpm or equivalent
Version: $(rpmspec -q --queryformat '%{version}-%{release}' "$specfile")

Architecture: $(rpm -q --queryformat '%{arch}' -p "$srcrpm")
</pre>

### other:
[https://anonscm.debian.org/git/dpkg/dpkg.git/tree/scripts/Dpkg/Checksums.pm](https://anonscm.debian.org/git/dpkg/dpkg.git/tree/scripts/Dpkg/Checksums.pm)

<pre>
Checksum-*: ... sha256sum $rpm $specfile $srcrpm # and rpm size # omit MD5+SHA1 because nobody should use that anymore
size=$(stat -c '%s' $rpm)

Build-Path: $(rpm --eval '%{_builddir}')
</pre>

### Examples

 * [https://buildinfo.debian.net/44a20123ce26786d43af72a14aa684dade5ee927/gnome-clocks_3.22.1-1_i386.buildinfo](https://buildinfo.debian.net/44a20123ce26786d43af72a14aa684dade5ee927/gnome-clocks_3.22.1-1_i386.buildinfo)
 * [https://koji.fedoraproject.org/koji/buildinfo?buildID=823737](https://koji.fedoraproject.org/koji/buildinfo?buildID=823737)


