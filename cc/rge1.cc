#include <iostream>
#include <random>

int main() {
  std::mt19937_64 rng(std::random_device{}());
  std::uniform_real_distribution<> dist(0.0, 1.0);
  float x = 0;
  for (auto i = 0; i < 1e6; i++) {
    for (float t = 0; t < 1; x++, t += dist(rng)) {}
  }
  x /= 1e6;
  std::cout << x << std::endl;
}
