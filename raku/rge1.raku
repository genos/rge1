#!/usr/bin/env raku
sub single(--> Num) {
  loop (my $i = 0e0, my $t = 0e0; $t < 1e0; $i++, $t += 1e0.rand) {}
  $i
}

sub MAIN(Int :$n = 1_000_000) { say sum((single for ^$n)) / $n.Num }
