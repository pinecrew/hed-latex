#!/bin/bash

## preparation
base_dir="$(pwd -P)/../"
[ -d $base_dir/tmp ] && rm -r $base_dir/tmp
mkdir -p $base_dir/{tmp,build}
cp  -r $base_dir/tests/* $base_dir/tmp
tests=$(ls ../tests/)
i=1
for t in $tests; do
    echo "$i) $t"
    let i=$i+1
done
echo "Выберите, какие тесты проводить:"
read selected
cd ../tmp
i=1
for t in $tests; do
    for j in $selected; do
        if [[ i -eq j ]]; then
            cd $t &&\
            cp ../../source/* .
            latexmk -pdf "test.tex" &&\
            mv test.pdf ../../build/$t.pdf &&\
            cd ..
        fi
    done
    let i=$i+1
done

