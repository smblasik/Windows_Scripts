@echo off 
setlocal
cd /d %~dp0

echo Getting Info...
REM Delete existing log files
set file=%USERNAME%_Info.html
if exist file del file

REM Put date and time of run at the top of the log file
echo ^<html^> >%file%
echo ^<H3^>Date and Time Run^</H3^> >>%file% 
date /T >>%file%
echo ^</html^> >>%file%
echo. >>%file%

REM The following log to the .html file for viewing in a browser
wmic /APPEND:%file% bios get serialnumber /format:htable >NUL
wmic /APPEND:%file% computersystem get Name, domain, Manufacturer, Model, NumberofProcessors, PrimaryOwnerName,Username, totalphysicalmemory /format:htable >NUL
wmic /APPEND:%file% product get Description, Version, Vendor, InstallDate, InstallLocation /format:htable >NUL
cls

echo To Start Backup
pause
cls
echo Copying Data...
REM Copy User Data
robocopy "C:\Users\%USERNAME%" %USERNAME% /mir /xa:sh /r:0 /w:0 /np /log+:%USERNAME%_BackUp_Log.txt
echo.
echo Process complete.
echo.
pause