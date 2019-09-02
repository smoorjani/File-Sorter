@echo off

set "src=C:\Users\smoor\Documents\batch"

dir /a:d /b > list.txt
for /F "tokens=1,2,3" %%i in (list.txt) do call :process %%i

:process
set "search=%1"
ECHO %search%
dir /b /a-d > files.txt
for /F "tokens=*" %%A in (files.txt) do (
    set str=%%A
    Echo.!str! | findstr /C:"!search!">nul
    if !errorlevel!==0 set move=!str!
)
pause
)
