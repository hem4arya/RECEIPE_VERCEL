#!/bin/bash

# -----------------------------------------------------------------------------
# 🎨 ASCII ART BANNER
# -----------------------------------------------------------------------------
clear
echo ""
echo " =========================================================================="
echo "  R E C I P E   F I N D E R   -   S M A R T   L A U N C H E R"
echo " =========================================================================="
echo ""

# -----------------------------------------------------------------------------
# 🔍 STEP 1: SYSTEM SCAN (Node.js Check)
# -----------------------------------------------------------------------------
echo " [1/4] 🔍 Scanning System..."
if ! command -v node &> /dev/null; then
    echo ""
    echo " ❌ CRITICAL ERROR: Node.js is NOT installed."
    echo " 👉 Please install Node.js from: https://nodejs.org/"
    echo ""
    exit 1
fi
echo "    ✅ Node.js found."

# -----------------------------------------------------------------------------
# 🛠️ STEP 2: AUTO-REPAIR (Dependencies)
# -----------------------------------------------------------------------------
echo ""
echo " [2/4] 🛠️  Checking Dependencies..."
if [ ! -d "node_modules" ]; then
    echo "    ⚠️  node_modules missing. Auto-repairing..."
    echo "    📦 Installing dependencies (this may take a moment)..."
    npm install
    if [ $? -ne 0 ]; then
        echo "    ❌ Failed to install dependencies."
        exit 1
    fi
    echo "    ✅ Dependencies installed."
else
    echo "    ✅ Dependencies ready."
fi

# -----------------------------------------------------------------------------
# ⚙️ STEP 3: CONFIGURATION (Setup Wizard)
# -----------------------------------------------------------------------------
echo ""
echo " [3/4] ⚙️  Checking Configuration..."
if [ ! -f ".env" ]; then
    echo "    ⚠️  .env missing. Launching Setup Wizard..."
    node _setup/setup.js
else
    echo "    ✅ Configuration ready."
fi

# -----------------------------------------------------------------------------
# 🚀 STEP 4: LAUNCH SEQUENCE
# -----------------------------------------------------------------------------
echo ""
echo " [4/4] 🚀 Launching Application..."
echo ""
echo " =========================================================================="
echo "  📢  Server is starting..."
echo "  👉  The browser should open automatically."
echo "  👉  Press Ctrl+C to stop the server."
echo " =========================================================================="
echo ""

# Run the dev script
npm run dev

# -----------------------------------------------------------------------------
# 🏁 POST-EXIT
# -----------------------------------------------------------------------------
echo ""
echo " =========================================================================="
echo "  🛑 Server stopped."
echo "  👉 To restart, run this script again."
echo " =========================================================================="
