@echo off
cd %programfiles%
set /a ex=0

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
    set /a ex=1
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
    if %ex%==0 (
       echo Go to the MikTeX Settings and push the "Refresh FNDB" button
    ) else (
       echo Go back to work!
    )
) else (
    echo [FAIL]
    echo Can't copy files into the directory! Exiting...
)

:exit
pause
