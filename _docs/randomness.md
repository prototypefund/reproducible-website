---
title: Randomness
layout: docs
permalink: /docs/randomness/
---

Random data will make builds unreproducible and must be avoided.

If random-like input is required, the solution is to use a predetermined value
to seed a [pseudo-random number
generator](https://en.wikipedia.org/wiki/Pseudorandom_number_generator). This
value can be read from some file, a changelog or the version control system.

When Link-Time Optimizations are turned on, GCC users will write random
identifiers to binary objects it creates. Using `-frandom-seed` can be used for
this particular case. As it will hash arbitrary data, passing the file name
should work in most cases.

Some compilation tools will write intermediate temporary files. This might lead
to reproducibility issues if paths get embedded in the final output. There's no
general solutions for such cases, better fix the code directly. One way is to
use the `.file` assembler directive [like it has been done in
O'Caml](https://sources.debian.net/src/ocaml/4.02.3-5/debian/patches/0010-Add-a-.file-directive-to-generated-.s-files.patch/).
