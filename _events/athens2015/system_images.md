---
layout: new/event_detail
title: Making system images reproducible
event: athens2015
order: 60
permalink: /events/athens2015/system-images/
---

*45-minute session on day 1*

Two problem areas:

 - Building installation media reproducibly (e.g. iso9660, squashfs, ubifs, ...).
 - Building base images reproducibly (e.g. EC2 AMIs).

Images are built in two ways:

 - Using a filesystem builder tool such as `genisoimage` or `mksquashfs`. It's not clear if these are entirely deterministic today, but if not, it's probably easy to make them deterministic.
 - Mounting a filesystem (either a *loopback* image, or inside a VM) and then running the installer (e.g. `nixos-install`). This is likely hard to make deterministic, since e.g. we really can't control the order in which the kernel allocates blocks. But we could unpack the image generated in this way and then use the first method to generate a deterministic image.

Other problem: filesystems like *ext4* contain various timestamps like the last mount time. *ext4* apparently also has a random seed value used for directory entry hashing. These need to be set to a fixed value.

Conclusions:

 - We need to check/ensure that command line tools for image generation (like `mksquashfs`) are deterministic.
 - diff support for filesystem images would be nice. Maybe add to diffoscope?
