# hed

__hed__ (от __h__igher __ed__ucation) — это набор средств для LaTeX,
содержащий классы документов, пакеты и преамбулы, упрощающий вёрстку
конспектов лекций, семестровых и лабораторных работ. Того, что ассоциируется со
словосочетанием "высшее образование".

## Установка
### Linux

    git clone git://github.com/hed-project/hed-latex
    cd hed-latex
    make

Пакет по умолчанию устанавливается в каталог `~/.texlive/texmf-var/tex`.
Путь для установки можно найти в выводе команды

    kpsewhich -var-value="TEXINPUTS"

Для установки в другой каталог

    make DEST="/path/to/directory"

### Windows
TODO

## Использование

    \documentclass{hedsemwork}
    \usepackage[utf8]{inputenc}
    \usepackage[russian]{babel}
    \begin{document}
        …
    \end{document}

### Классы документов

* hedsemwork — семестровые работы

### Пакеты
### Преамбулы

## Текущее состояние (v 0.1.9)

|           требуется сделать к v 0.2.0          |  статус  |
|:-----------------------------------------------|:--------:|
| разобраться в коде extarticle                  |     →    |
| extarticle → hedsemwork                        |     →    |
| hedlabwork                                     |     ·    |
| hedlectures                                    |     ·    |
| hedreport                                      |     ·    |
| убрать hedrussian                              |     ·    |
| комментарии во всех файлах стилей              |     ·    |
| описать все использованные приёмы в wiki       |     ·    |
| определиться c преамбулами                     |     ·    |
| 0.2 → master                                   |     ·    |
| citrux/preambles → hed-project/hed-latex       |     ·    |
