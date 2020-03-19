@echo off
echo.
echo [info] start clean...
echo.

%~d0
cd %~dp0

cd ..
call mvn clean

pause
