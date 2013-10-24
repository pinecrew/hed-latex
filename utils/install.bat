@echo off
cd %programfiles%
set /a ex=0

<nul set /p str="Поиск директории MikTeX...               "
if exist Miktex* (
    goto search
) else (
    echo [ПРОВАЛ]
    echo Директория не найдена. Выход...
    goto exit
)

:search
for /f "delims=" %%i in ('dir /ad /b ^^ findstr /r "MikTeX*"') do set mp=%programfiles%\%%i
set hedd=%mp%\tex\latex\hed
echo [ГОТОВО]

if exist "%hedd%" (
    echo Директория HEd существует
    set /a ex=1
    goto copy
) else (
    <nul set /p str="Создание директории для HEd...           "
    md "%hedd%" > nul
    if exist "%hedd%" (
        echo [ГОТОВО]
        goto copy
    ) else (
        echo [ПРОВАЛ]
        echo Невозможно создание новой папки! Выход...
        goto exit
    )
)        

:copy
<nul set /p str="Копирование файлов...                    "
cd %~dp0
cd ..\source
copy /Y hed* "%hedd%" > nul
if %ERRORLEVEL% == 0 (
    echo [ГОТОВО]
    echo.
    if %ex%==0 (
       echo Теперь нажмите "Refresh FNDB" в MikTeX Settings
       timeout /t 5 /nobreak > nul
    ) else (
       echo Обновление успешно установлено
    )
) else (
    echo [ПРОВАЛ]
    echo Невозможно скопировать файлы! Выход...
)

:exit
timeout /t 3 /nobreak > nul
