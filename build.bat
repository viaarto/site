@echo off
setlocal enabledelayedexpansion
echo ==================================
echo Starting Hugo build process...
echo ==================================
hugo build --cleanDestinationDir --forceSyncStatic --gc
if %errorlevel% neq 0 (
    echo ERROR: Hugo build failed!
    pause
    exit /b %errorlevel%
)
echo.
echo Hugo build completed successfully.
echo ==================================
echo Adding files to Git staging area...
echo ==================================
git add .
echo.
echo Files added to staging.
echo ==================================
echo Creating Git commit...
echo ==================================
REM Get current date and time using %DATE% and %TIME%
REM Assumes date format like DD/MM/YYYY or MM/DD/YYYY - adjust substrings if needed
set cur_date=%DATE%
set cur_time=%TIME%
echo Debug: Raw DATE is !cur_date!
echo Debug: Raw TIME is !cur_time!

REM Extract date parts (adjust indices based on your system's format)
REM Example for DD/MM/YYYY:
REM set day=!cur_date:~0,2!
REM set month=!cur_date:~3,2!
REM set year=!cur_date:~6,4!
REM Example for MM/DD/YYYY:
REM set month=!cur_date:~0,2!
REM set day=!cur_date:~3,2!
REM set year=!cur_date:~6,4!
REM Example for YYYY-MM-DD (less common for %DATE%):
REM set year=!cur_date:~0,4!
REM set month=!cur_date:~5,2!
REM set day=!cur_date:~8,2!

REM --- Using a common format assumption (like pt-BR: DD/MM/YYYY) ---
set day=!cur_date:~0,2!
set month=!cur_date:~3,2!
set year=!cur_date:~6,4!

REM Extract time parts (HH:MM) - handles potential leading space for single-digit hours
set hour=!cur_time:~0,2!
if "!hour:~0,1!"==" " set hour=0!hour:~1,1!
set minute=!cur_time:~3,2!

set datetime_str=!year!-!month!-!day!-!hour!-!minute!
echo Debug: Formatted datetime_str is !datetime_str!

git commit -m "Auto update: !datetime_str!"
if %errorlevel% neq 0 (
    echo WARNING: Git commit failed. Maybe no changes to commit?
) else (
    echo Commit created with message: "Auto update: !datetime_str!"
)
echo.
echo ==================================
echo Pushing changes to remote repository...
echo ==================================
git push
if %errorlevel% neq 0 (
    echo ERROR: Git push failed!
    pause
    exit /b %errorlevel%
)
echo.
echo Changes pushed successfully.
echo ==================================
echo Build and deployment finished.
echo ==================================
pause
