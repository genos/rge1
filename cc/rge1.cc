#include <algorithm>
#include <iostream>
#include <random>
#include <ranges>

#define N 1000000

int main() {
  std::mt19937_64 r(std::random_device{}());
  std::uniform_real_distribution<> d(0.0, 1.0);
  auto i = std::ranges::iota_view{0, N};
  auto x = std::transform_reduce(
               std::begin(i), std::end(i), 0.0, std::plus{},
               [&d, &r](auto _) {
                 float x = 0;
                 for (float t = 0; t < 1; x++, t += d(r)) {
                 }
                 return x;
               }) /
           N;
  std::cout << x << std::endl;
}
