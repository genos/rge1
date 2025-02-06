#include <iostream>
#include <random>

int main() {
  std::mt19937_64 rng(std::random_device{}());
  std::uniform_real_distribution<> dist(0.0, 1.0);
  float x = 0;
  for (auto i = 0; i < 1e6; i++) {
    float total = 0;
    while (total < 1) {
      x++;
      total += dist(rng);
    }
  }
  x /= 1e6;
  std::cout << x << std::endl;
}
