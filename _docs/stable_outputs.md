---
title: Stable order for outputs
layout: docs
permalink: /docs/stable-outputs/
---

Data structures such as [Perl
hashes](http://perldoc.perl.org/functions/keys.html), [Python
dictionaries](https://docs.python.org/2/library/stdtypes.html#mapping-types-dict),
or [Ruby Hash objects](https://ruby-doc.org/core/Hash.html) will list their keys
in a different order on every run to limit [algorithmic complexity
attacks](http://perldoc.perl.org/perlsec.html#Algorithmic-Complexity-Attacks).

The following Perl code will output the list in a different order on every run:

<div class="wrong">
{% highlight perl %}
foreach my $package (keys %deps) {
    print MANIFEST, "$package: $deps[$packages]";
}
{% endhighlight %}
</div>

To get a deterministic output, the easiest way is to explicitly sort the keys:

<div class="correct">
{% highlight perl %}
foreach my $package (sort keys %deps) {
    print MANIFEST, "$package: $deps[$packages]";
}
{% endhighlight %}
</div>

For Perl, it is possible to set `PERL_HASH_SEED=0` in the environment. This
will result in hash keys always being in the same order. See
[perlrun(1)](http://perldoc.perl.org/perlrun.html) for more information.

Python users can similarly set the environment variable
[PYTHONHASHSEED](https://docs.python.org/2/using/cmdline.html#envvar-PYTHONHASHSEED).
When set to a given integer value, orders in dictionaries will be the same on
every run.

Beware that the [locale settings]({{ "/docs/locales/ | prepend: site.baseurl }})
might affect the output of some sorting functions or the `sort` command.
