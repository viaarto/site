@echo off
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
REM Get current date and time in yyyy-mm-dd-hh-mm format
for /f "tokens=1 delims=." %%a in ('wmic os get LocalDateTime /value') do set dt=%%a
set datetime_str=%dt:~0,4%-%dt:~4,2%-%dt:~6,2%-%dt:~8,2%-%dt:~10,2%

git commit -m "Auto update: %datetime_str%"
if %errorlevel% neq 0 (
    echo WARNING: Git commit failed. Maybe no changes to commit?
) else (
    echo Commit created with message: "Auto update: %datetime_str%"
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
