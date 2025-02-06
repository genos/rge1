#include <stdio.h>
#include <stdlib.h>

int main() {
  float x = 0;
  for (int i = 0; i < 1e6; i++) {
    for (float t = 0; t < 1; x++, t += (float)rand() / (float)RAND_MAX) {
    }
  }
  x /= 1e6;
  printf("%f\n", x);
}
