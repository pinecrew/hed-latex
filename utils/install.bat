@echo off
cd %programfiles%

<nul set /p str="Searching for MikTeX directory...    "
if exist Miktex* (
    goto search
) else (
    echo [FAIL]
    echo Exiting...
    goto exit
)

:search
for /f "delims=" %%i in ('dir /ad /b ^^ findstr /r "MikTeX*"') do set mp=%programfiles%\%%i
set hedd=%mp%\tex\latex\hed
echo [DONE]

if exist "%hedd%" (
    echo HEd folder exists...
    goto copy
) else (
    <nul set /p str="Creating HEd directory...            "
    md "%hedd%" > nul
    if exist "%hedd%" (
        echo [DONE]
        goto copy
    ) else (
        echo [FAIL]
        echo Can't create folder! Exiting...
        goto exit
    )
)

:copy
<nul set /p str="Copying files to the directory...    "
cd %~dp0
copy /Y hed* "%hedd%" > nul
if %ERRORLEVEL% == 0 (
    echo [DONE]
    echo.
    echo Go to the MikTeX Settings and push the "Update Formats" and "Refresh FNDB" buttons
) else (
    echo [FAIL]
    echo Can't copy files into the directory! Exiting...
)

:exit
pause