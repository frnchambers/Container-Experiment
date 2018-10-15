Comparison of using `std::vector` and `std::array` in C++
------

The project I'm about to start will require using one of these containers to store a numerical grid for PDE solving. I wanted to have a *reason* to use either, so did a simple numerical experiment to get a **zeroth order answer**. The test has only been performed on the GNU g++5.2.1 compiler on a laptop which runs an Intel Core i5-4258U CPU @ 2.40GHz. The experiment tests only serial, not parallel code.

I'm using google-benchmark for tests - results will be written up when I have a bit more time.
