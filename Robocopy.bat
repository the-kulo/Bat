@echo off
setlocal

set "source_path=D:\test\source"
set "destination_path=D:\test\destination"
set "log_file=D:\test\destination\log.txt"

for %%f in (%source_path%\*) do (
    echo Copying file %%~nf... >> %log_file%
    robocopy "%source_path%" "%destination_path%" "%%~nxf" /R:3 /W:120 /MT:16 /z /LOG+:%log_file% /NP /NFL /NDL
    
    if !errorlevel! LSS 8 (
        echo Successfully copied %%~nf at %date% %time% >> %log_file%
    ) else (
        echo Failed to copy %%~nf at %date% %time% >> %log_file%
    )
)

echo. >> %log_file%
echo All files have been copied at %date% %time% >> %log_file%

endlocal