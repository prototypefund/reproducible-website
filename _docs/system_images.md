---
title: System images
layout: docs
permalink: /docs/system-images/
---

This documentation's intent is to share what we currently know about making
system images build reproducibly: for example, VM and cloud images, live systems,
OS installer ISO images.

General problems of reproducible system images
==============================================

Usually the problems are:

* Filesystem needs to be created *at once*
* Filesystems have creation and/or modification timestamps
* Filesystems containing UUID or a label which are not set explicit
* Included files have timestamps
* Included files may be generated or updated at build time in a non-reproducible manner
* The bootloader which is integrated might have timestamps
* The integrated initramfs images may be built non-reproducibly while building the system image
* Timestamps which don't depend on `SOURCE_DATE_EPOCH` are not reproducible.

E.g. if the filesystem has been created by `mkfs.ext4`, mounted, modified and saved as an image, it would not be reproducible:
the allocation of the inodes is undefined.

Thankfully there are known solutions to most of these problems, read on.

ext2, ext3, ext4
================

Instead of using `mkfs.ext`, `make_ext4fs` can be used.
`make_ext4fs` is creating the whole filesystem at once. `make_ext4fs -T <unix_timestamp>` allows to set the mtime
to `$SOURCE_DATE_EPOCH`.

`make_ext4fs` should include the following commit:

* https://git.lede-project.org/?p=project/make_ext4fs.git;a=commit;h=bd53eaafbc2a89a57b8adda38f53098a431fa8f4

ISO filesystem
==============

When building ISO filesystems with `xorriso`:

 - use a recent versions of xorriso which honors [`$SOURCE_DATE_EPOCH`](https://reproducible-builds.org/specs/source-date-epoch/) for
   various ISO image metadata
 - pass `$SOURCE_DATE_EPOCH` to xorriso's `--modification-date` to
   clamp all mtimes.

It might also be necessary to:

* pass a fixed value to `isohybrid --id`
* ensure initrd images are built reproducibly (<https://bugs.debian.org/845034>)

SquashFS metadata & compression
===============================

When compressing SquashFS images, metadata and compression can make the output unreproducible.

Using a version of `mksquashfs` that contains the following patches has been sufficient
to make some system images reproducible:

 - honoring `$SOURCE_DATE_EPOCH` for various timestamps:
   <https://github.com/squashfskit/squashfskit/commit/0ab12a8585373be2de5129e14d979c62e7a90d82>
 - clamping content timestamps to `$SOURCE_DATE_EPOCH`:
   <https://github.com/squashfskit/squashfskit/commit/32a07d4156a281084c90a4b78affc8b0b32a26fc>
 - remove `frag_deflator_thread`:
   <https://github.com/squashfskit/squashfskit/commit/afc0c76a170bd17cbd29bbec6ae6d2227e398570>

Root filesystem content
=======================

A system image often contains a root filesystem, generated during the build,
and packed in some format such as SquashFS.

Exclude unneeded files
----------------------

A number of files can simply be emptied or excluded when creating the
root filesystem image (some to optimize size, some because they are not needed).

E.g. Tails does this:

 - <https://git-tails.immerda.ch/tails/tree/config/chroot_local-includes/usr/share/amnesia/build/mksquashfs-excludes>
 - <https://git-tails.immerda.ch/tails/tree/config/chroot_local-hooks/99-zzzzzz_reproducible-builds-post-processing>

Beware: this can have hard to predict consequences. For example,
Tails considered dropping even more stuff - such as the fontconfig cache -,
but they've seen weird results and performance issues when doing so
and finally discarded this idea.

Files metadata
--------------

The build process for a system image often creates or updates files,
which generates file metadata that depends on when the build is performed.

One approach that's been used successfully to fix this problem is to
clamp mtimes of files in the root filesystem to `$SOURCE_DATE_EPOCH`
before generating the system image.

Files generated or updated at build time
----------------------------------------

Package managers such as **dpkg** or **RPM** support `postinst` scripts
and triggers that are run on the target system after unpacking a package,
e.g. to generate or update caches and indices… potentially in
a non-deterministic manner.

In order to counter this, one possible approach is to replace these scripts and do the same work
later (e.g. at first boot).

Another approach is to ensure these scripts generate/update files
in a reproducible manner. This approach has the advantage to fix the problem
at the cause for every project that uses these programs.
For example such problems were fixed in:

 - `/etc/kernel/postinst.d/apt-auto-removal`:
   <https://anonscm.debian.org/cgit/apt/apt.git/commit/?id=a9b56a0>
 - `/etc/shadow`: <https://github.com/shadow-maint/shadow/pull/71>
 - fontconfig cache: <https://bugs.debian.org/864082>,
   <https://bugs.debian.org/863427>
 - gdk-pixbuf's `loaders.cache`:
   <https://bugzilla.gnome.org/show_bug.cgi?id=783592>,
   <https://bugs.debian.org/875704>
 - `giomodule.cache`: <https://bugzilla.gnome.org/show_bug.cgi?id=786983>
 - GTK+ `immodules.cache`:
   <https://bugzilla.gnome.org/show_bug.cgi?id=786528>
 - `/usr/share/applications/mimeinfo.cache`:
   <https://bugs.freedesktop.org/show_bug.cgi?id=102320>
 - `/var/cache/cracklib/src-dicts`: <https://bugs.debian.org/865623>
 - `/var/lib/gconf/defaults/%gconf-tree-*.xml`:
   <https://bugzilla.gnome.org/show_bug.cgi?id=784738>,
   <https://bugs.debian.org/867848>.

Finally, occasionally one may want to use `strip-nondeterminism`
to normalize the content of such files.

gettext
-------

GNU gettext's POT, PO and MO files were an interesting challenge.
One way to approach this problem is to:

* only update POT files when it is really needed, i.e. if the only change
  after refreshing them is in the POT-Creation-Date field;
* avoid updating PO — and thus MO — files when only comments (e.g.
  line numbers) have changed.
  <https://git-tails.immerda.ch/tails/tree/config/chroot_local-includes/usr/local/lib/tails-shell-library/po.sh>
