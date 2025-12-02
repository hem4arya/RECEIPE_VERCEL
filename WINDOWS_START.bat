@echo off
setlocal
title Recipe Finder - Smart Launcher

:: -----------------------------------------------------------------------------
:: ASCII ART BANNER
:: -----------------------------------------------------------------------------
cls
echo.
echo  ==========================================================================
echo   R E C I P E   F I N D E R   -   S M A R T   L A U N C H E R
echo  ==========================================================================
echo.

:: -----------------------------------------------------------------------------
:: STEP 1: SYSTEM SCAN (Node.js Check)
:: -----------------------------------------------------------------------------
echo  [1/4] Scanning System...
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo  CRITICAL ERROR: Node.js is NOT installed.
    echo  Please install Node.js from: https://nodejs.org/
    echo.
    pause
    exit /b
)
echo     Node.js found.

:: -----------------------------------------------------------------------------
:: STEP 2: AUTO-REPAIR (Dependencies)
:: -----------------------------------------------------------------------------
echo.
echo  [2/4] Checking Dependencies...
if exist "node_modules" goto :skip_install

echo     node_modules missing. Auto-repairing...
echo     Installing dependencies (this may take a moment)...
call npm install
if %errorlevel% neq 0 (
    echo     Failed to install dependencies.
    pause
    exit /b
)
echo     Dependencies installed.
goto :check_config

:skip_install
echo     Dependencies ready.

:: -----------------------------------------------------------------------------
:: STEP 3: CONFIGURATION (Setup Wizard)
:: -----------------------------------------------------------------------------
:check_config
echo.
echo  [3/4] Checking Configuration...
if exist ".env" goto :skip_config

echo     .env missing. Launching Setup Wizard...
call node _setup/setup.js
goto :launch

:skip_config
echo     Configuration ready.

:: -----------------------------------------------------------------------------
:: STEP 4: LAUNCH SEQUENCE
:: -----------------------------------------------------------------------------
:launch
echo.
echo  [4/4] Launching Application...
echo.
echo  ==========================================================================
echo   Server is starting...
echo   The browser should open automatically.
echo   Press Ctrl+C to stop the server.
echo  ==========================================================================
echo.

:: Run the dev script from package.json
call npm run dev

:: -----------------------------------------------------------------------------
:: POST-EXIT
:: -----------------------------------------------------------------------------
echo.
echo  ==========================================================================
echo   Server stopped.
echo   To restart, run this script again.
echo  ==========================================================================
pause
