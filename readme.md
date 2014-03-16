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

Установка для __MikTeX 2.9__:

1. Клонируем репозиторий:

        git clone git://github.com/hed-project/hed-latex

2. Заходим в папку _utils_, запускаем _install.bat_ (либо вручную копируем файлы из директории _source_ в директорию _%programfiles%\MikTeX 2.9\tex\latex\hed_)

3. После чего в настройках MikTeX нажимаем кнопку *Refresh FNDB*

## Использование

    \documentclass{hedwork}
    \usepackage[utf8]{inputenc}
    \usepackage[russian]{babel}
    \begin{document}
        …
    \end{document}

### Классы документов

* hedwork — семестровые и реферативные работы
* hedlab — лабораторные работы
* hedlectures — лекции
* hedexams — экзаменационные вопросы

### Пакеты

* hedmath — математика
* hedphysics — физика
* hedfeatures — когда хочется чего-то странного

## Текущее состояние (v 0.1.9)

|           требуется сделать к v 0.2.0          |  статус  |
|:-----------------------------------------------|:--------:|
| разобраться в коде extarticle                  |  готово  |
| extarticle → hedsemwork                        |  готово¹ |
| hedlab                                         |  готово¹ |
| hedlectures                                    |  начато  |
| hedwork                                        |  готово¹ |
| убрать hedrussian                              |  готово  |
| комментарии во всех файлах стилей              |     ·    |
| описать все использованные приёмы в wiki       |     ·    |
| определиться c преамбулами                     |     ·    |
| 0.2 → master                                   |  готово  |
| citrux/preambles → hed-project/hed-latex       |  готово  |

¹ готово к тестированию
