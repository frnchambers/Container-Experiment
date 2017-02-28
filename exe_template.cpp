#include <iostream>
#include <random>
#include <chrono>

#include <vector>
#include <array>


double f () {
  // static std::default_random_engine eng;
  // static std::uniform_real_distribution<double> dist(-10,10);
  // return dist(eng);

  static double c=1.0;
  return (c+=1.5);
}


int main () {
  std::cout << std::scientific;

  // std::default_random_engine eng;
  // std::uniform_real_distribution<double> dist(-10,10);

  const size_t
    N_elem=ELEMENTS,
    N_tests=TESTS;
  
  double N = static_cast<double>(N_tests);

  auto start_time = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> dur;

  double mean_time = 0;

  for ( size_t n=0; n<N_tests; ++n ) {
    start_time = std::chrono::high_resolution_clock::now();

#if defined VECTOR
    std::vector<double> vec(N_elem);
#elif defined ARRAY
    std::array<double, N_elem> vec;
#else
#error Container definition required!
#endif

#if defined INDEX
    for ( double &vi : vec )
      vi = f();
#elif defined ITERATOR
    for ( size_t i=0; i<vec.size(); ++i )
      vec[i] = f();
#else
#error Iteration method required!
#endif

    dur = std::chrono::high_resolution_clock::now() - start_time;
    mean_time += dur.count() / N;
  }

  std::cout << mean_time;



}
