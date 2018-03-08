@echo off
set logtemp=%~dp0tempsha256.txt
set logfile=%~dp0sha256.txt
set logpath=%~dp0
set signfile=%~dp0sign.dat
del /F /Q %signfile% 2>nul
del /F /Q %logfile% 2>nul
del /F /Q %logtemp% 2>nul
echo %date% %time% >%logfile%
for /R . %%i in (*) do openssl dgst -sha256 %%i >> %logtemp%
@echo off & setlocal enabledelayedexpansion
for /f "tokens=*" %%i in (%logtemp%) do (
    if "%%i"=="" (echo.) else (set "line=%%i" & call :chg)
)>>%logfile%

del %logtemp%
pause
exit
 
:chg
rem 这个是保留空行
rem set "line=!line:1=a!"
rem 第一个替换。。。路径变成.\
set "line=!line:%logpath%=.\!"
echo !line!
goto :eof
pause