@echo off
SET THEFILE=d:\latiha~1\menupi~1\menupi~1.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  D:\LATIHA~1\MENUPI~1\rsrc.o -s   -b base.$$$ -o d:\latiha~1\menupi~1\menupi~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
