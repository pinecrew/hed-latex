#!/bin/bash

## preparation
[ -d ../tmp ] && rm -r ../tmp
mkdir -p ../{tmp,build}
cp ../source/* ../tmp
cp  -r ../tests/* ../tmp
tests=$(ls ../tests/*.tex)

cd ../tmp
for test in $tests; do
    pdffile=$(echo $test | sed -e "s/tests/tmp/;s/\.tex/.pdf/")
    latexmk -pdf $test && mv $pdffile ../build
done

