@echo off
title Android Debloater - Customized Version
color 0A

:: Initialize log file
set logFile=debloater_log.txt
echo Debloater Log - %date% %time% > %logFile%

:: Check if ADB is installed
echo Checking ADB installation...
where adb >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ADB is not installed or not in the PATH. Please install it first.
    echo [ERROR] ADB not found. Please install ADB. >> %logFile%
    pause
    exit /b
)

:: Ensure USB Debugging is enabled
echo Ensure that USB Debugging is enabled on your Android device and connected via USB.
pause

:: Get Device Info
echo.
echo ================================================
echo Detecting connected device...
echo ================================================
adb devices
for /f "tokens=1,2*" %%a in ('adb devices') do (
    if "%%b"=="device" (
        set deviceID=%%a
    )
)

:: If no device found, exit
if not defined deviceID (
    echo [ERROR] No device found. Ensure your device is connected and USB debugging is enabled. >> %logFile%
    echo No device found.
    pause
    exit /b
)

:: Get device details
echo Retrieving device details...
adb -s %deviceID% shell getprop ro.product.model
adb -s %deviceID% shell getprop ro.product.brand
adb -s %deviceID% shell getprop ro.build.version.release

echo.
echo Device Details:
echo -------------------
echo Model: %deviceID%
adb -s %deviceID% shell getprop ro.product.model
echo Brand: %deviceID%
adb -s %deviceID% shell getprop ro.product.brand
echo OS Version: %deviceID%
adb -s %deviceID% shell getprop ro.build.version.release

:: Log device details
echo [INFO] Device Model: %deviceID% >> %logFile%
adb -s %deviceID% shell getprop ro.product.model >> %logFile%
echo [INFO] Device Brand: %deviceID% >> %logFile%
adb -s %deviceID% shell getprop ro.product.brand >> %logFile%
echo [INFO] OS Version: %deviceID% >> %logFile%
adb -s %deviceID% shell getprop ro.build.version.release >> %logFile%

:: Ask user if ready to proceed
echo.
set /p proceed=Are you ready to uninstall apps listed in debloat.txt? (y/n): 
if /i "%proceed%" NEQ "y" (
    echo [INFO] User chose not to proceed with uninstallation. >> %logFile%
    echo Exiting script.
    pause
    exit /b
)

:: Check if debloat.txt exists
if not exist debloat.txt (
    echo [ERROR] debloat.txt not found. Ensure debloat.txt exists in the same folder as this script. >> %logFile%
    echo debloat.txt not found. Please create the file and list the apps to debloat.
    pause
    exit /b
)

:: Start uninstalling apps from debloat.txt
echo.
echo ================================================
echo Starting uninstallation process...
echo ================================================
for /f "delims=" %%a in (debloat.txt) do (
    echo Uninstalling %%a...
    adb shell pm uninstall --user 0 %%a
    if %ERRORLEVEL% == 0 (
        echo [INFO] Successfully uninstalled %%a >> %logFile%
        echo Successfully uninstalled: %%a
    ) else (
        echo [ERROR] Failed to uninstall %%a >> %logFile%
        echo Failed to uninstall: %%a
    )
)

:: Final confirmation to exit
echo.
echo Uninstallation process complete.
echo Press Enter to exit...
pause >nul
exit
