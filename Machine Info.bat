@echo off 
setlocal
cd /d %~dp0 

:: Set file Variable
set file=Machine_Info.csv

:: Print Serial Number, Computer Name, Date, Domain, Username
for /F "skip=2 tokens=2 delims=," %%A in ('wmic systemenclosure get serialnumber /FORMAT:csv') do (set "serial=%%A")
echo %serial%,%computername%,%date%,%userdomain%,%username%>>%file%

:: Updated 10/18/2017