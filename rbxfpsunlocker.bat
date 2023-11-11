@echo off

setlocal enabledelayedexpansion
set "targetDirectory=%LocalAppData%\Roblox\Versions"

for /d %%A in ("%targetDirectory%\version-*") do (
    set "clientSettingsDirectory=%%A\ClientSettings"
    if exist "!clientSettingsDirectory!" (
        rmdir /s /q "!clientSettingsDirectory!"
    )
    mkdir "!clientSettingsDirectory!"
    set "jsonFilePath=!clientSettingsDirectory!\ClientAppSettings.json"
    (
        echo {
        echo    "DFIntTaskSchedulerTargetFps": 300
        echo }
    ) > "!jsonFilePath!"
)

exit