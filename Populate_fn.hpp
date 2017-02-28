#ifndef __POPULATE_FN_HPP__
#define __POPULATE_FN_HPP__

#include <random>

double f () {
  static std::default_random_engine eng;
  static std::uniform_real_distribution<double> dist(-10,10);
  return dist(eng);

  // static double c=1.0;
  // return (c*=1.5);
}

#endif
