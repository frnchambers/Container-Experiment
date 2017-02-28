#/bin/bash

# options:
#   vector/array          - side by side
#   index/iterator        - same graph axis
#   optimised/unoptimised - seperate plot x axis
#   large/small           - seperate plot y axis


small_elem=50
large_elem=1000
n_tests=100000



## make the binaries
make clean

for elem in $small_elem $large_elem; do
    size=""
    if [ $elem == 50 ]; then
        size="small"
    else
        size="large"
    fi
    for opt in opt unopt; do
        O3flag=""
        if [ $opt == "opt" ]; then
            O3flag="-O3"
        fi
        for cont in VECTOR ARRAY; do
            for it in INDEX ITERATOR; do

                flags="-D ELEMENTS=$elem -D TESTS=$n_tests $O3flag -D $cont -D $it"
                #echo $flags
                FLAGS=$flags SIZE=$size OPT=$opt CONT=$cont IT=$it make exe_compiletime.out
                
            done
        done
    done
done


cont="VECRUN"
for elem in $small_elem $large_elem; do
    size=""
    if [ $elem == 50 ]; then
        size="small"
    else
        size="large"
    fi
    for opt in opt unopt; do
        O3flag=""
        if [ $opt == "opt" ]; then
            O3flag="-O3"
        fi
            for it in INDEX ITERATOR; do

                flags="-D TESTS=$n_tests $O3flag -D $it"
                #echo $flags
                FLAGS=$flags SIZE=$size OPT=$opt CONT=$cont IT=$it make exe_vecrun.out
                
            done
    done
done




for elem in $small_elem $large_elem; do
    size=""
    if [ $elem == 50 ]; then
        size="small"
    else
        size="large"
    fi

    for opt in opt unopt; do

        datafile="data/"$size"_"$opt".dat"
        echo $datafile
        echo -e "#\t\tvec_run\t\tvector\t\tarray" > $datafile

        vridx=`"./bin/"$size"_"$opt"_VECRUN_INDEX.out" $elem`
        vritt=`"./bin/"$size"_"$opt"_VECRUN_ITERATOR.out" $elem`

        vidx=`"./bin/"$size"_"$opt"_VECTOR_INDEX.out"`
        aidx=`"./bin/"$size"_"$opt"_ARRAY_INDEX.out"`
        vitt=`"./bin/"$size"_"$opt"_VECTOR_ITERATOR.out"`
        aitt=`"./bin/"$size"_"$opt"_ARRAY_ITERATOR.out"`

        echo -e "index    \t$vridx\t$vidx\t$aidx" >> $datafile
        echo -e "iterator \t$vritt\t$vitt\t$aitt" >> $datafile

    done
done


gnuplot plot_histogram.gp
