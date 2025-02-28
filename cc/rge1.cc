#include <iostream>
#include <random>
#include <ranges>

int main() {
  std::mt19937_64 r(std::random_device{}());
  std::uniform_real_distribution d(0.0, 1.0);
  auto i = std::views::iota(0, 1'000'000);
  std::cout << std::transform_reduce(
      std::begin(i), std::end(i), 0.0, std::plus{},
      [&d, &r]([[maybe_unused]] auto _) {
        auto x = 0.0;
        for (auto t = 0.0; t < 1.0; x++, t += d(r)) {}
        return x;
        }) / 1e6
    << std::endl;
}
