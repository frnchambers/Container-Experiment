#FLAGS = -D ELEMENTS=500
#SIZE = small

CXX = g++
CXXFLAGS = -Wall -Werror -std=c++14 $(FLAGS)
LDFLAGS = 

%.out: %.cpp
	$(CXX) $(CXXFLAGS) -o ./bin/$(SIZE)_$(OPT)_$(CONT)_$(IT).out $< $(LDFLAGS)

.PHONEY: clean
clean:
	rm -rf bin/*.out
	rm -rf data/*.dat
