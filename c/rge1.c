#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "pcg_variants.h"

int main() {
  pcg32_srandom(42u, 54u);
  float x = 0;
  for (int i = 0; i < 1e6; i++) {
    for (float t = 0; t < 1; x++, t += ldexp(pcg32_random(), -32)) {
    }
  }
  x /= 1e6;
  printf("%f\n", x);
}
