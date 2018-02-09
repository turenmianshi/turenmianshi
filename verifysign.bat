@echo off
set logfile=%~dp0sha256.txt
set signfile=%~dp0sign.dat
set publickey=%~dp0pub.pem
openssl dgst -verify %publickey% -sha256 -signature %signfile% %logfile%
pause