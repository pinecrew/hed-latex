#!/bin/bash

## preparation
base_dir="$(pwd -P)/../"
[ -d $base_dir/tmp ] && rm -r $base_dir/tmp
mkdir -p $base_dir/{tmp,build}
cp  -r $base_dir/tests/* $base_dir/tmp

tests=$(ls ../tests/)

i=0
for t in $tests; do
    tests_array[$i]=$t
    let i=$i+1
done

i=0
while [ $i -lt ${#tests_array[@]} ]; do
    echo "$(( $i + 1 ))) ${tests_array[$i]}"
    let i=$i+1
done
echo "Выберите, какие тесты проводить:"
read selected
cd ../tmp
for j in $selected; do
    let j=$j-1
    cd ${tests_array[j]} &&\
    cp ../../source/* .
    latexmk -pdf "test.tex" &&\
    mv test.pdf ../../build/${tests_array[j]}.pdf &&\
    cd ..
done

