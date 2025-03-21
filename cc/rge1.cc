#include <iostream>
#include <numeric>
#include <ranges>
#include "pcg_variants.h"

int main() {
  pcg32_srandom(42u, 54u);
  auto i = std::views::iota(0, 1'000'000);
  std::cout << std::transform_reduce(
      std::begin(i), std::end(i), 0.0, std::plus{},
      []([[maybe_unused]] auto _) {
        auto x = 0.0;
        for (auto t = 0.0; t < 1.0; x++, t += ldexp(pcg32_random(), -32)) {}
        return x;
        }) / 1e6
    << std::endl;
}
