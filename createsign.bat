@echo off
set logfile=%~dp0sha256.txt
set signfile=%~dp0sign.dat
set privatekey=%1
openssl dgst -sign %privatekey% -sha256 -out %signfile% %logfile%
openssl dgst -prverify %privatekey% -signature %signfile% %logfile%
pause