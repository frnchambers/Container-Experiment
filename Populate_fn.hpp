#ifndef __POPULATE_FN_HPP__
#define __POPULATE_FN_HPP__

#include <random>

struct rand_init {
  std::default_random_engine eng;
  std::uniform_real_distribution<double> dist;
  rand_init () : dist (0.0, 10.0) {}
  double operator() () {
    return dist(eng);
  }
};

struct static_init {
  double c=1.0;
  double operator() () {
    return (c*=1.5);
  }
};

#endif
