---
title: Value initialization
layout: docs
permalink: /docs/value-initialization/
---

In languages which don't initialize values, this needs to be explicitly
done in order to avoid capturing what random bytes are in memory when
run.

An
[example](https://review.coreboot.org/gitweb?p=coreboot.git;a=commitdiff;h=2d119a3f01eee6c4e86248b17b4c9ce14ab77836)
taken from coreboot:

![diffoscope output of the two different builds of the same coreboot image]({{ "/images/docs/uninitialized_memory.png" | prepend: site.basurl }})

The code used to write a data structure directly without initializing
all its fields. The fix was pretty simple once identified:

{% highlight diff %}
--- a/util/bimgtool/bimgtool.c
+++ b/util/bimgtool/bimgtool.c
@@ -160,7 +160,7 @@ static const struct crc_t crc_type = {
 static int write_binary(FILE *out, FILE *in, struct bimg_header *hdr)
 {
        static uint8_t file_buf[MAX_RECORD_BYTES];
-       struct bimg_data_header data_hdr;
+       struct bimg_data_header data_hdr = { 0 };
        size_t n_written;
 
        data_hdr.dest_addr = hdr->entry_addr;
{% endhighlight %}

Usage of instrumentation tools able to detect such cases like
[Valgrind](http://www.valgrind.org/) should help identifying such
problems.
