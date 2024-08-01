@echo off
setlocal enabledelayedexpansion

set "sites=..\apache\sites-enabled"
set "hosts=C:\Windows\System32\drivers\etc\hosts"
set "spacing=      "

call :update_hosts

endlocal
goto :eof

:update_hosts
set "tempfile=%TEMP%\hosts_temp.txt"

:: Cria uma cópia temporária do arquivo hosts
copy "%hosts%" "%tempfile%" >nul

:: Adiciona entradas ao arquivo hosts
for %%f in (%sites%\*.conf) do (
    set "filename=%%~nf"
    call :add_to_hosts !filename!
)

:: Remove entradas do arquivo hosts que não possuem .conf correspondentes
for /f "tokens=1,2 delims= " %%a in ('findstr /r "^127.0.0.1 " "%tempfile%"') do (
    set "ip=%%a"
    set "hostname=%%b"
    
    if not exist "%sites%\!hostname!.conf" (
        findstr /c:"!ip! !spacing! !hostname! #docker" "%tempfile%" >nul
        if not errorlevel 1 (
            echo Deleted: !ip! !spacing! !hostname!
            findstr /v /c:"!ip! !spacing! !hostname! #docker" "%tempfile%" > "%hosts%"
        )
    )
)

del "%tempfile%"

goto :eof

:add_to_hosts
setlocal
set "hostname=%1"
set "entry=127.0.0.1 %spacing% %hostname% #docker!"

:: Verifica se a entrada já existe
findstr /c:"127.0.0.1 %spacing% %hostname%" "%hosts%" >nul
if errorlevel 1 (
    echo %entry% >> "%hosts%"
    echo Created: 127.0.0.1 %spacing% %hostname%
) else (
    echo Present: 127.0.0.1 %spacing% %hostname%
)

endlocal
goto :eof
