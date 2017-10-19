@echo off 
setlocal
cd /d %~dp0 

REM Delete existing log files
set file=%USERNAME%_Network_Info.txt
if exist %file% del %file%

REM Put date and time of run at the top of the log file
echo %USERNAME% Network Info >>%file% 
date /T >>%file%
echo. >>%file%
echo Getting IP information
ipconfig/all>>%file%

echo. >>%file%

echo Running netstat
netstat -a >>%file%

echo Running tracert 4.2.2.1
tracert -h 10 4.2.2.1>>%file%

echo Running tracert 155.16.119.20
tracert -h 10 155.16.119.20>>%file%

echo Running tracert 165.136.224.94
tracert -h 10 165.136.224.94>>%file%

echo Finished!
pause
