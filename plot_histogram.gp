#/usr/bin/gnuplot-5


#set term qt size 600,450 enhanced persist
set term svg size 600,450 enhanced
set output 'write-random.svg'



set auto x
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set xtics format ''


set grid ytics
set log y
set yrange[1.0e-7:1.0e-4]

#set multiplot layout 2,2 rowsfirst title 'Assignment function: v_i = (c*=1.5)'
set multiplot layout 2,2 rowsfirst title 'Assignment function: uniform random number'



#"Comparison of write speed to std::vector or std::array in c++, std::vector's size is specifed at either runtime or compile time. \nSmall mean 50 elements, large mean 1000 elements and optimised means compiled using -O3 flag"


unset key


set ylabel 'Duration (secs)'
set format y '10^{%L}'
datafile="data/small_unopt.dat"
set title "Small, Unoptimised"
plot datafile using 2:xtic(1) title "vector - run time", \
     '' using 3 title "vector - compile time", \
     '' using 4 title "array"


set ylabel ''
set format ''
datafile="data/small_opt.dat"
set title "Small, Optimised"
plot datafile using 2:xtic(1) title "vector - run time", \
     '' using 3 title "vector - compile time", \
     '' using 4 title "array"



set ylabel 'Duration (secs)'
set format y '10^{%L}'
set yrange[1.0e-6:1.0e-3]

datafile="data/large_unopt.dat"
set title "Large, Unoptimised"
plot datafile using 2:xtic(1) title "vector - run time", \
     '' using 3 title "vector - compile time", \
     '' using 4 title "array"

set key top right

set ylabel ''
set format ''
datafile="data/large_opt.dat"
set title "Large, Optimised"
plot datafile using 2:xtic(1) title "vector - run time", \
     '' using 3 title "vector - compile time", \
     '' using 4 title "array"





# set xlabel ''
# set xrange[-1:5]
# set xtic ( "vector-index" 1, "vector-iterator" 2, "array-index" 3, "array-iterator" 4) rotate by -45 scale 0



# set format "%.2te%+03T"
# set ylabel 'Duration'



# plot 'small_size/unop.dat'
