@echo off

set PYTHON=C:\Users\Administrator\AppData\Local\Programs\Python\Python310\python.exe
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=--autolaunch

rem Fix for setuptools compatibility
echo Checking environment compatibility...
"%PYTHON%" -m pip install "setuptools==69.5.1" 2>nul

@REM Uncomment following code to reference an existing A1111 checkout.
@REM set A1111_HOME=Your A1111 checkout dir
@REM
@REM set VENV_DIR=%A1111_HOME%/venv
@REM set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% ^
@REM  --ckpt-dir %A1111_HOME%/models/Stable-diffusion ^
@REM  --hypernetwork-dir %A1111_HOME%/models/hypernetworks ^
@REM  --embeddings-dir %A1111_HOME%/embeddings ^
@REM  --lora-dir %A1111_HOME%/models/Lora

call webui.bat
