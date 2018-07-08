#!/bin/bash
file=$1
g++ $file -std=c++14 -lbenchmark -lpthread -O2 -o benchmark.out
