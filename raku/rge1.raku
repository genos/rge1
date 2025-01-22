#!/usr/bin/env raku
sub single-run {
  loop (my $i = 0e1, my $t = 0e1; $t < 1; $i++, $t += 1.rand) {}
  $i
}

sub n-runs-avg(Num $n, Int $b, Int $d --> Num) {
  sum((single-run for (^$n).race(:batch($b), :degree($d)))) / $n
}

sub MAIN(
  Num :$n = 1e6,  #= Number of runs to perform
  Int :$b = 4096, #= batches in parallel
  Int :$d = 16,   #= Degree of parallelism
) { say n-runs-avg($n, $b, $d) }
