@echo off
setlocal enabledelayedexpansion
title RDP Connection Manager
color 0a
mode con: cols=60 lines=25

:MAIN_MENU
cls
echo.
echo   [ RDP CONNECTION MANAGER ]
echo   =========================
echo.
echo   1. Connect to remote PC
echo   2. Help / Instructions
echo   3. Settings
echo   4. Exit
echo.
set /p "choice=Select [1-4]: "

if "!choice!"=="1" goto CONNECT
if "!choice!"=="2" goto HELP
if "!choice!"=="3" goto SETTINGS
if "!choice!"=="4" exit /b
goto MAIN_MENU

:CONNECT
cls
echo.
echo   [ CONNECT TO REMOTE PC ]
echo   =======================
call :GET_HOST
call :GET_USER
call :GET_PASS

echo.
echo Storing credentials...
cmdkey /generic:TERMSRV/!host! /user:!user! /pass:!pass! >nul
if !errorlevel! neq 0 (
    echo.
    echo ERROR: Failed to store credentials
    timeout /t 3 >nul
    goto CONNECT
)

echo Launching Remote Desktop...
start "" /wait mstsc /v:!host! /f

echo.
echo Cleaning credentials...
cmdkey /delete:TERMSRV/!host! >nul
if !errorlevel! equ 0 (
    echo Credentials cleared
) else (
    echo WARNING: Failed to delete credentials
)

echo.
echo Connection closed
timeout /t 3 >nul
goto MAIN_MENU

:GET_HOST
set /p "host=Remote PC IP/hostname: "
if "!host!"=="" (
    echo ERROR: Host cannot be empty
    goto GET_HOST
)
exit /b

:GET_USER
set /p "user=Username (remote PC): "
if "!user!"=="" (
    echo ERROR: Username cannot be empty
    goto GET_USER
)
exit /b

:GET_PASS
set /p "pass=Password: "
if "!pass!"=="" (
    echo ERROR: Password cannot be empty
    goto GET_PASS
)
exit /b

:HELP
cls
echo.
echo   [ HELP AND INSTRUCTIONS ]
echo   ========================
echo.
echo   HOW TO FIND HOSTNAME:
echo   ---------------------
echo   1. On remote PC, press Win+R
echo   2. Type 'cmd' and hit Enter
echo   3. Type: hostname
echo.
echo   USERNAME FORMAT:
echo   ----------------
echo   - Local account: Just username
echo   - Domain account: DOMAIN\username
echo   - Email account: user@domain.com
echo.
echo   PASSWORD NOTES:
echo   ---------------
echo   - Input is visible (batch limitation)
echo   - Credentials are deleted after session
echo.
echo   TROUBLESHOOTING:
echo   ----------------
echo   - Can't connect to same PC you're using
echo   - Verify Remote Desktop is enabled
echo   - Check network connectivity
echo.
pause >nul
goto MAIN_MENU

:SETTINGS
cls
echo.
echo   [ SETTINGS ]
echo   ===========
echo.
echo   1. Toggle fullscreen mode
echo   2. Clear saved settings
echo   3. Back to main menu
echo.
set /p "setting=Select [1-3]: "

if "!setting!"=="1" (
    if "!fullscreen!"=="1" (
        set fullscreen=0
        echo Fullscreen DISABLED
    ) else (
        set fullscreen=1
        echo Fullscreen ENABLED
    )
    timeout /t 2 >nul
    goto SETTINGS
)

if "!setting!"=="2" (
    set host=
    set user=
    set pass=
    echo All settings cleared
    timeout /t 2 >nul
    goto SETTINGS
)

goto MAIN_MENU