---
layout: new/event_detail
title: diffoscope
event: berlin2016
order: 30
permalink: /events/berlin2016/diffoscope/
---

### diffoscope plans for the meeting
- Reviewing these Post-Its:

### Improve Platform Support
- Portability to different platforms should improve. Some tools or used abstractions (like /dev/fd) might not be available.
- Support for distro-specific or uncommon file formats can be improved.
- The testsuite does not work everywhere (e.g. newer versions of software can break things, currently happens for Pascal). It should be more reliable.

### Integrate debdiff & diffoscope
- Should we implement a flag in debdiff to call diffoscope?
- Should we replace debdiff with diffoscope completely? What features of debdiff would diffoscope still need?
- It's not really clear what the post-it author wants.

### Parallel diffoscope ([#842837](https://bugs.debian.org/842837))
- Execution time is a serious issue, diffoscope should get faster.
- It is not clear how well parallel Python is going to work for diffoscope due to the global interpreter lock.
- Prior work by nomeata might exist somewhere.
- We should have a hack session on parallel diffoscope.

### Marketing/Docs/Undebianization
- [https://try.diffoscope.org](https://try.diffoscope.org) should be more well-known; it helpfully has a number of optional stuff for uncommon formats installed already.
- Get the word out for non-reproducibility use cases like comparing across versions for updates or due diligence before deployment.
- The bug tracking happens at the Debian bugtracker. That should be more visible. The website should have a "how to report bugs" section for people not familiar with the Debian bug tracker.

### diffoscope Plugins
- Should diffoscope have a plugin mechanism to support other file formats that authors may not want to upstream?

### Output Format
- Should diffoscope output markdown?
- The output should be more accessible, e.g., for screen readers. Possibly to be implemented as a new output format.

### What are Usability Issues with diffoscope?
- Output limits could lead to spending a lot of processing time and then still not getting usable output. Should all arbitrary limits be removed?
- Short command line options
- Write documentation on how to implement support for a file format
- Should diffoscope support excluding specific paths in archives to cut down runtime and ignore parts that are already known to differ?
- Should diffoscope support disabling support for specific file formats?

### Automatic Classification of Reproducibility Issues in diffoscope
- Is this in scope for diffoscope? Should this be in a separate tool?
- This would require knowledge of the format and lead to much more complex file format support.
- This could be helpful in outputs, e.g. if an offset changes in an ELF binary you'd get lots of related changes that could otherwise be ignored

## Action Items
- lamby to open a bug for the output format accessibility
- Bapt to submit his FreeBSD patches upstream
- everyone to file tickets about portability problems

## Session Proposals
- Hacking parallel diffoscope
- Porting diffoscope
- diffoscope usability
- Documenting, marketing and undebianizing diffoscope

-
