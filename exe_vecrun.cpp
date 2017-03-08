#include <iostream>
#include <chrono>
#include <vector>
#include <array>

#include "Populate_fn.hpp"

int main ( int argc, char * argv [] ) {
  std::cout << std::scientific;

  const size_t
    N_elem=static_cast<double>(atof(argv[1])),
    N_tests=TESTS;
  
  double N = static_cast<double>(N_tests);

  auto start_time = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> dur;

  double mean_time = 0;

  for ( size_t n=0; n<N_tests; ++n ) {
    start_time = std::chrono::high_resolution_clock::now();


#if defined VECTOR
    std::vector<double> vec(N_elem);


#elif defined CARR
    double * vec = new double [N_elem];
#else
#error Container definition required!
#endif


#if defined ITERATOR
    for ( double &vi : vec )
      vi = f();
#elif defined INDEX
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
