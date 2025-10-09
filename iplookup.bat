@echo off
title IP Lookup Tool
color 0A

echo IP Lookup Tool
echo.
set /p ip="Enter IP address: "

if "%ip%"=="" (
    echo Looking up your own IP...
    curl -s http://ipapi.co/json/ > ip_data.json
) else (
    echo Looking up IP: %ip%
    curl -s http://ipapi.co/%ip%/json/ > ip_data.json
)

echo.
echo ========================
echo IP LOOKUP RESULTS
echo ========================
echo.

for /f "tokens=1,2 delims=:" %%a in ('type ip_data.json ^| findstr /i "ip city region country_name org"') do (
    set "key=%%a"
    set "value=%%b"
    set "key=!key:"=!"
    set "value=!value:"=!"
    set "value=!value:,=!"
    
    if "!key!"=="ip" echo IP Address: !value!
    if "!key!"=="city" echo City: !value!
    if "!key!"=="region" echo Region: !value!
    if "!key!"=="country_name" echo Country: !value!
    if "!key!"=="org" echo ISP: !value!
)

del ip_data.json >nul 2>&1
echo.
pause
