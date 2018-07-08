#include <benchmark/benchmark.h>

#include "Containers.hpp"
#include "Populate_fn.hpp"


static void BM_arr_idx (benchmark::State& state) {
  static_init init;
  const int64_t N = state.range(0);
  double * vec = new double [N];
  for (std::size_t j = 0; j < N; ++j) vec[j] = init();

  for (auto _ : state) {
    int s=0;
    for (std::size_t i=0; i<N; ++i) {
      s += vec[i];
    }
  }
  
  delete[] vec;
}

void BM_vec_idx (benchmark::State& state) {
  static_init init;
  const int64_t N = state.range(0);
  std_vec vec(N);
  for (auto & vi : vec) vi = init();

  for (auto _ : state) {
    int s=0;
    for (std::size_t i=0; i<vec.size(); ++i) {
      s += vec[i];
    }
  }

}


void BM_vec_itt (benchmark::State& state) {
  static_init init;
  const int64_t N = state.range(0);
  std_vec vec(N);
  for (auto & vi : vec) vi = init();

  int s;
  for (auto _ : state) {
    s=0;
    for (auto & vi : vec) {
      s += vi;
    }
  }

}


BENCHMARK(BM_arr_idx)->Range(8, 2048);
BENCHMARK(BM_vec_idx)->Range(8, 2048);
BENCHMARK(BM_vec_itt)->Range(8, 2048);

BENCHMARK_MAIN();
