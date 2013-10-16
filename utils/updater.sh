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

update_version_info_in ()
{
    ext=$(echo $1 | sed 's/.*\.//')
    if [[ $ext == "cls" ]]; then
        sign="ProvidesClass"
    elif [[ $ext == "sty" ]]; then
        sign="ProvidesPackage"
    else
        # невозможная ни в каком другом месте строка, не попадающая под шаблон
        sign="182f893f1518ca161126bd42f8a051e4"
    fi
    [ $VERBOSE ] && echo "Обновление информации о версии в $1…"
    sed -i "/$sign/ s:\[[0-9/ A-Za-z.]\+\]:\[$day v$version\]:" $1
}

remove_trailing_spaces_from ()
{
    [ $VERBOSE ] && echo "Удаление ненужных пробелов и табуляций в $1…"
    sed -i "s:[ \t]\+\$::g" $1
}

for file in $added $modified; do
    update_version_info_in $file
    remove_trailing_spaces_from $file
done

