#/usr/bin/gnuplot


set term qt size 1000,800 enhanced persist

set auto x

#set style data histogram
# set style histogram cluster gap 1
# set style fill solid border -1
# set boxwidth 0.9


set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set xtics format ''


set grid ytics
set log y
set yrange[1.0e-9:1.0e-3]

set multiplot layout 2,2 rowsfirst title ''



set ylabel 'Duration'
set format y '10^{%L}'
datafile="data/small_unopt.dat"
set title "Small Unoptimised"
plot datafile using 2:xtic(1) title "vector", \
            '' using 3 title "array"

set ylabel ''
set format ''
datafile="data/small_opt.dat"
set title "Small Optimised"
plot datafile using 2:xtic(1) title "vector", \
            '' using 3 title "array"





set ylabel 'Duration'
set format y '10^{%L}'
datafile="data/large_unopt.dat"
set title "Large Unoptimised"
plot datafile using 2:xtic(1) title "vector", \
            '' using 3 title "array"

set ylabel ''
set format ''
datafile="data/large_opt.dat"
set title "Large Optimised"
plot datafile using 2:xtic(1) title "vector", \
            '' using 3 title "array"





# set xlabel ''
# set xrange[-1:5]
# set xtic ( "vector-index" 1, "vector-iterator" 2, "array-index" 3, "array-iterator" 4) rotate by -45 scale 0



# set format "%.2te%+03T"
# set ylabel 'Duration'



# plot 'small_size/unop.dat'
