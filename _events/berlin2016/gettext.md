---
layout: event_detail
title: Gettext
event: berlin2016
order: 150
permalink: /events/berlin2016/Gettext/
---

The problem is that timestamps end up in binaries because of [Gettext bug 49654](http://savannah.gnu.org/bugs/?49654).  The timestamps originate with `xgettext`, which writes them into the header of `.pot` (the template for translations, extracted from source code strings).  `msgmerge` preserves these timestamps when merging actual translations (`.po` files) with translation templates (`.pot` file).  `msgfmt` preserves timestamps when it builds a binary `.mo` file from a `.po` file.  The `.mo` file ends up being a part of the build artifacts.

If `.pot` files were generated and included by upstream developers there would be no problem, but that’s not always the case.  Some argue that `.pot` files should not be part of the source tree, because they are generated artifacts.  This means that they might be generated at build time, introducing build time timestamps.

The POT creation date is useful for translators because it tells them whether the entire file needs to be reviewed (relative to the `.po` file).  Hence, it is debatable whether it should be avoided to introduce it in the first place (by patching `xgettext`), or if it should just be excluded from the generated `.mo` files.  Having the date in the binary `.mo` files is useful for recovering `.po` files from an `.mo` using `msgunfmt`, so removing it completely from `.mo` files may not be desirable (although this is the approach preferred by the former gettext maintainer).

Debian implemented a patch to make xgettext respect `SOURCE_DATE_EPOCH`, but it was rejected by the former maintainer.  We came up with an alternative approach: instead of using `SOURCE_DATE_EPOCH` for translation templates (which may be inaccurate) compute the latest modification time for all source files and use /that/ in the timestamp (instead of the current time).  A patch has been prepared already.

In addition, we are preparing patches for other approaches such as omitting the timestamp header from the `.mo` files.  Upstream can then pick from one of the possible solutions.

----

Post event email update (12/16/2016):
    
The maintainers of gettext have applied the patches we sent to remove timestamps from the
output of gettext generated `.mo` files.

See [commit d13f165b83701dffc14f7151419e0c00c00c0d1b](http://git.savannah.gnu.org/cgit/gettext.git/commit/?id=d13f165b83701dffc14f7151419e0c00c00c0d1b).
-
