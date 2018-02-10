call :ProcessRename
goto :eof

:ProcessRename
for %%f in (*text-to-replace*) do call :ProcessFile %%f
for /D %%d in (*) do (
    cd %%d
    call :ProcessRename
    cd ..
)
goto :finished
:ProcessFile
set str=%1
rename %1 %str:text-to-replace=replacement-text%

:finished
echo ----
dir /b