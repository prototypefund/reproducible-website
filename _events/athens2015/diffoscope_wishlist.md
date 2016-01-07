---
layout: event_detail
title: diffoscope wishlist
event: athens2015
order: 80
permalink: /events/athens2015/diffoscope-wishlist/
---

*50-minute + 10-minute session on day 2*

After reviewing what diffoscope is already able to do, here are some more ideas of what it could do:

 - Write a wrapper around `diff` that strips out large identical chunks and only feeds in smaller chunks so that diffing can work on huge files. `diff` currently does not care about not supporting e.g. a million line long files because if your source code file is that large: you’re doing it wrong so diffoscope can have problems with huge diffs.
 - Multithreaded/parallel processing.
 - Better/smarter ELF diffing. Crazy idea, amongst others: use DWARF symbols to display the lines of code responsible for a given difference.
 - Add a command line flag for “ignore profiles” removing differences that are not relevant or paths that can be ignored.
 - Replace Open Build Service’s [pkg-diff.sh](https://github.com/openSUSE/build-compare) tool with diffoscope to allow better understanding of package differences.
 - Sandboxed environment to secure diffoscope on untrusted input.
 - Internal anchor links in the HTML report to be able to jump around. Typically from a file in a file list to its differences.
 - Image comparisons ([GitHub does them right](https://github.com/blog/817-behold-image-view-modes))
 - Hint system that provides suggestions on how to fix a problem.
 - Have a hosted web service for doing the diffing (will require a sandbox).
 - Start an embedded HTML server so that you can view diffing results coming in as soon as they are computed.
