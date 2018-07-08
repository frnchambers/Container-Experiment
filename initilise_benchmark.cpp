#include <benchmark/benchmark.h>

#include "Containers.hpp"
#include "Populate_fn.hpp"


template <typename init_t>
static void BM_arr_idx (benchmark::State& state) {
  init_t init;
  const int64_t N = state.range(0);
  for (auto _ : state) {
  double * vec = new double [N];
    for (std::size_t j = 0; j < N; ++j) {
      vec[j] = init();
    }
  delete[] vec;
  }
}

template <typename init_t>
void BM_vec_idx_a (benchmark::State& state) {
  init_t init;
  const int64_t N = state.range(0);
  for (auto _ : state) {
  std_vec vec(N);
    for (std::size_t i=0; i<N; ++i) {
      vec[i] = init();
    }
  }
}

template <typename init_t>
void BM_vec_idx_b (benchmark::State& state) {
  init_t init;
  const int64_t N = state.range(0);
  for (auto _ : state) {
  std_vec vec(N);
    for (std::size_t i=0; i<vec.size(); ++i) {
      vec[i] = init();
    }
  }
}

template <typename init_t>
void BM_vec_itt (benchmark::State& state) {
  init_t init;
  const int64_t N = state.range(0);
  for (auto _ : state) {
  std_vec vec(N);
    for (auto & vi : vec) {
      vi = init();
    }
  }
}


BENCHMARK_TEMPLATE(BM_arr_idx,   static_init)->Range(8, 2048);
BENCHMARK_TEMPLATE(BM_vec_idx_a, static_init)->Range(8, 2048);
BENCHMARK_TEMPLATE(BM_vec_idx_b, static_init)->Range(8, 2048);
BENCHMARK_TEMPLATE(BM_vec_itt,   static_init)->Range(8, 2048);

// BENCHMARK_TEMPLATE(BM_arr_idx,   rand_init)->Range(8, 2048);
// BENCHMARK_TEMPLATE(BM_vec_idx_a, rand_init)->Range(8, 2048);
// BENCHMARK_TEMPLATE(BM_vec_idx_b, rand_init)->Range(8, 2048);
// BENCHMARK_TEMPLATE(BM_vec_itt,   rand_init)->Range(8, 2048);

BENCHMARK_MAIN();



