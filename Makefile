#FLAGS = -D ELEMENTS=500
#SIZE = small

CXX = g++
CXXFLAGS = -Wall -Werror -lbenchmark -lpthread -O2 -std=c++14 
LDFLAGS = 

%.out: %.cpp
	$(CXX) $(CXXFLAGS) -o $%.out $< 

#$(CXX) $(CXXFLAGS) -o ./bin/$(SIZE)_$(OPT)_$(CONT)_$(IT).out $< $(LDFLAGS)

.PHONEY: clean
clean:
	rm -rf bin/*.out

