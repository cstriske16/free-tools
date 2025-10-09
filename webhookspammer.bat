@echo off
title Webhook Spammer - Batch
color 0A

set /p webhook_url=Enter Webhook URL: 
set /p message=Enter Message: 
set /p count=Enter Number of Messages: 
set /p delay=Enter Delay in seconds: 

echo Starting webhook spammer...
echo Webhook: %webhook_url%
echo Message: %message%
echo Count: %count%
echo Delay: %delay%s
echo.
echo Press Ctrl+c to stop
echo.

setlocal enabledelayedexpansion

for /l %%i in (1,1,%count%) do (
    echo Sending message %%i of %count%
    
    curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"%message%\"}" %webhook_url% >nul 2>&1
    
    if !errorlevel! equ 0 (
        echo [SUCCESS] Message %%i sent
    ) else (
        echo [FAILED] Message %%i failed to send
    )
    
    if not "%delay%"=="0" (
        timeout /t %delay% /nobreak >nul
    )
)

echo.
echo Completed sending %count% messages!
pause
