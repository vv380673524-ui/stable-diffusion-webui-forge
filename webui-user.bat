@echo off

set PYTHON=C:\Users\Administrator\AppData\Local\Programs\Python\Python310\python.exe
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=--autolaunch

echo ================================================================
echo [MANUS FIX] Starting environment compatibility check...
echo ================================================================

rem 1. Fix base Python environment
echo [1/3] Fixing base Python setuptools...
"%PYTHON%" -m pip install "setuptools==69.5.1" "pip<24.1" --force-reinstall 2>nul

rem 2. Fix virtual environment if it exists
if exist venv\Scripts\python.exe (
    echo [2/3] Fixing virtual environment setuptools...
    venv\Scripts\python.exe -m pip install "setuptools==69.5.1" "pip<24.1" --force-reinstall
)

rem 3. Pre-install CLIP to avoid build isolation issues
if exist venv\Scripts\python.exe (
    echo [3/3] Pre-installing CLIP into venv...
    venv\Scripts\python.exe -m pip install https://github.com/openai/CLIP/archive/d50d76daa670286dd6cacf3bcd80b5e4823fc8e1.zip --prefer-binary
)

echo ================================================================
echo [MANUS FIX] Environment check complete. Launching WebUI...
echo ================================================================

call webui.bat
