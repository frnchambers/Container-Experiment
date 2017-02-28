#/bin/bash

# options:
#   vector/array          - side by side
#   index/iterator        - same graph axis
#   optimised/unoptimised - seperate plot x axis
#   large/small           - seperate plot y axis


small_elem=50
large_elem=1000
n_tests=10000



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
                FLAGS=$flags SIZE=$size OPT=$opt CONT=$cont IT=$it make exe_template.out
                
            done
        done
    done
done



# exe () {
#     echo "./bin/$1_$2_$3_$4.out"
# }

for size in small large; do
    for opt in opt unopt; do

        datafile="data/"$size"_"$opt".dat"
        echo $datafile
        echo -e "#\t\tvector\t\tarray" > $datafile

        exe1="./bin/"$size"_"$opt"_VECTOR_INDEX.out"
        exe2="./bin/"$size"_"$opt"_ARRAY_INDEX.out"
        exe3="./bin/"$size"_"$opt"_VECTOR_ITERATOR.out"
        exe4="./bin/"$size"_"$opt"_ARRAY_ITERATOR.out"

        echo -e "index \t\t`$exe1`\t`$exe2`" >> $datafile
        echo -e "iterator \t`$exe3`\t`$exe4`" >> $datafile

    done
done


gnuplot plot_histogram.gp
