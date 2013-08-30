#!/bin/bash
VERBOSE=1
added=$(git status -s | grep "A " | tr -d "A ")
modified=$(git status -s | grep "M " | tr -d "M ")
day=$(date +%Y/%m/%d)
version="0.1.9"

if [[ $VERBOSE ]]; then
    echo "Новые файлы:"
    echo $added | tr " " "\n"
    echo
    echo "Обновлённые файлы:"
    echo $modified | tr " " "\n"
    echo
fi

for i in $added $modified; do
    name=$(echo $i | cut -d . -f 1)
    ext=$(echo $i | cut -d . -f 2)
    if [[ $ext == "cls" ]]; then 
        echo "Обновление даты в $i"
        sed -i "/ProvidesClass/ s:\[[0-9/ A-Za-z.]\+\]:\[$day v$version\]:" $i
    elif [[ $ext == "sty" ]]; then
        echo "Обновление даты в $i"
        sed -i "/ProvidesPackage/ s:\[[0-9/ A-Za-z.]\+\]:\[$day v$version\]:" $i
    fi
done
