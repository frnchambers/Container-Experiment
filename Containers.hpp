#ifndef __CONTAINERS_HPP__
#define __CONTAINERS_HPP__

#include <vector>
#include <array>

using std_vec = std::vector<double>;

template <int64_t N>
using std_arr = std::array<double, N>;

struct c_arr {
  double * vec;
  c_arr (const std::size_t N) {
    vec = new double [N];
  }
  ~c_arr () {
    delete[] vec;
  }
};


#endif
