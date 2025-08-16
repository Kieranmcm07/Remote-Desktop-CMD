@echo off
setlocal enabledelayedexpansion

:: =====================================
:: RDP Connection Manager
:: =====================================
:: Created by Kieranmcm07
:: Version 2.1 - Stable Release

:: Initialize default settings
set default_color=0a
set current_color=!default_color!
set color_name=Green
set host=
set user=
set pass=
set rdp_fullscreen=1
set rdp_width=1024
set rdp_height=768

:: Apply settings and prepare UI
title RDP Connection Manager
color !current_color!
mode con: cols=62 lines=28

:: Main program loop
:MAIN_MENU
cls
echo.
echo   [ RDP CONNECTION MANAGER ]
echo   =========================
echo   Created by Kieranmcm07
echo.
echo   1. Connect to remote PC
echo   2. Help / Instructions
echo   3. Settings
echo   4. Exit
echo.
echo This tool allows you to connect to remote PCs using RDP. Pleaes use it responsibly.
echo.
set /p "choice=Select [1-4]: "

:: Process user selection
if "!choice!"=="1" goto CONNECT
if "!choice!"=="2" goto HELP
if "!choice!"=="3" goto SETTINGS
if "!choice!"=="4" exit /b
goto MAIN_MENU


:CONNECT
cls
echo.
echo   [ CONNECT TO REMOTE PC ]
echo   ========================
echo.
set /p "host=Enter the IP or hostname: "
set /p "user=Enter the username: "
set /p "pass=Enter the password (leave blank to prompt): "

:: Generate a temporary .rdp file with the selected settings
set rdp_file=%TEMP%\custom_connection.rdp
echo full address:s:!host! > "!rdp_file!"
echo username:s:!user! >> "!rdp_file!"
if "!rdp_fullscreen!"=="1" (
    echo screen mode id:i:2 >> "!rdp_file!"
) else (
    echo screen mode id:i:1 >> "!rdp_file!"
    echo desktopwidth:i:!rdp_width! >> "!rdp_file!"
    echo desktopheight:i:!rdp_height! >> "!rdp_file!"
)

echo.
echo Connecting to !host!...
timeout /t 1 >nul
mstsc "!rdp_file!"
goto MAIN_MENU

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
echo   [ SETTINGS CUSTOMIZATION ]
echo   =========================
echo.
echo   1. Change text color
echo   2. Configure RDP display
echo   3. Clear saved credentials
echo   4. Back to main menu
echo.
set /p "setting=Select [1-4]: "

if "!setting!"=="1" goto COLOR_MENU
if "!setting!"=="2" goto RDP_SETTINGS
if "!setting!"=="3" goto CLEAR_CREDS
goto MAIN_MENU

:COLOR_MENU
cls
echo.
echo   [ TEXT COLOR OPTIONS ]
echo   =====================
echo.
echo   Current color: !color_name!
echo.
echo   1. Green (Default)
echo   2. Blue
echo   3. Cyan
echo   4. Yellow
echo   5. Magenta
echo   6. Light Red
echo   7. Light Purple
echo   8. Bright White
echo   9. Back to settings
echo.
set /p "color_choice=Select color [1-9]: "

if "!color_choice!"=="1" set current_color=0a & set color_name=Green
if "!color_choice!"=="2" set current_color=01 & set color_name=Blue
if "!color_choice!"=="3" set current_color=03 & set color_name=Cyan
if "!color_choice!"=="4" set current_color=06 & set color_name=Yellow
if "!color_choice!"=="5" set current_color=05 & set color_name=Magenta
if "!color_choice!"=="6" set current_color=0c & set color_name=Light Red
if "!color_choice!"=="7" set current_color=0d & set color_name=Light Purple
if "!color_choice!"=="8" set current_color=0f & set color_name=Bright White
if "!color_choice!"=="9" goto SETTINGS

color !current_color!
echo.
echo Color changed to !color_name!
timeout /t 2 >nul
goto COLOR_MENU

:RDP_SETTINGS
:REDISPLAY_RDP_SETTINGS
cls
echo.
echo   [ RDP DISPLAY SETTINGS ]
echo   =======================
echo.
echo   1. Fullscreen mode: !rdp_fullscreen! [1=Yes, 0=No]
echo   2. Resolution: !rdp_width!x!rdp_height!
echo   3. Back to settings
echo.
set /p "rdp_choice=Select option [1-3]: "

if "!rdp_choice!"=="1" goto TOGGLE_FULLSCREEN
if "!rdp_choice!"=="2" goto SET_RESOLUTION
if "!rdp_choice!"=="3" goto SETTINGS
goto REDISPLAY_RDP_SETTINGS

:TOGGLE_FULLSCREEN
if "!rdp_fullscreen!"=="1" (
    set rdp_fullscreen=0
    echo Fullscreen DISABLED
) else (
    set rdp_fullscreen=1
    echo Fullscreen ENABLED
)
timeout /t 2 >nul
goto REDISPLAY_RDP_SETTINGS

:SET_RESOLUTION
echo.
set /p "rdp_width=Enter width (800-3840): "
set /p "rdp_height=Enter height (600-2160): "

:: Basic validation
if !rdp_width! lss 800 set rdp_width=800
if !rdp_width! gtr 3840 set rdp_width=3840
if !rdp_height! lss 600 set rdp_height=600
if !rdp_height! gtr 2160 set rdp_height=2160

echo Resolution set to !rdp_width!x!rdp_height!
timeout /t 2 >nul
goto REDISPLAY_RDP_SETTINGS

:CLEAR_CREDS
set host=
set user=
set pass=
echo.
echo All saved credentials cleared
timeout /t 2 >nul
goto SETTINGS