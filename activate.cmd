@echo off
REM activate_venv.cmd — activate venv named "activate"
REM Usage: call activate_venv.cmd  (must be called, not executed in new shell)

:: check common locations
if exist "activate\Scripts\activate.bat" (
  call "activate\Scripts\activate.bat"
  echo Activated virtualenv: activate\Scripts\activate.bat
  goto :eof
)

if exist ".venv\Scripts\activate.bat" (
  call ".venv\Scripts\activate.bat"
  echo Activated virtualenv: .venv\Scripts\activate.bat
  goto :eof
)

echo No virtualenv 'activate' found in common locations.
set /p ans=Create a new venv named 'activate' here now? [Y/n] 
if "%ans%"=="" set ans=Y
if /I "%ans%"=="Y" goto create
echo Aborted.
goto :eof

:create
where python >nul 2>&1
if errorlevel 1 (
  echo Python not found. Install Python first.
  goto :eof
)
python -m venv activate
if exist "activate\Scripts\activate.bat" (
  call "activate\Scripts\activate.bat"
  echo Created and activated './activate'
) else (
  echo Created venv but activate script not found.
)
goto :eof
