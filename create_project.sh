cat > create_project.sh << 'EOF'
#!/bin/bash

# ==========================================
# CYBER-DOJO: PROJECT CREATION SCRIPT
# ==========================================

echo "========================================"
echo "  CYBER-DOJO PROJECT SETUP"
echo "========================================"

# Get project name
PROJECT_NAME=${1:-"cyber-dojo-project"}

echo "[1/7] Creating project directory: $PROJECT_NAME"
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo "[2/7] Creating directory structure..."
mkdir -p Documentation/Audit/Configuration

echo "[3/7] Creating documentation files..."
# Create README.md
cat > README.md << 'README_EOF'
# Cyber-Dojo: Securing & Administering the Startup Server

## Project Overview
Complete system administration and cybersecurity simulation with 10 milestones.

## Quick Start
1. ./setup_scenario.sh
2. Follow INSTRUCTIONS.md
3. ./check_progress.sh

## Files
- INSTRUCTIONS.md: Step-by-step guide
- SOLUTIONS.md: Complete solutions
- *.sh: Scripts for setup and verification

## Milestones
10 critical tasks covering system security, administration, and hardening.

---
*InnovateCo Training Environment*
README_EOF

# Create INSTRUCTIONS.md and SOLUTIONS.md (simplified versions)
echo "# Instructions" > INSTRUCTIONS.md
echo "Complete guide in setup..." >> INSTRUCTIONS.md
echo "# Solutions" > SOLUTIONS.md
echo "Complete solutions..." >> SOLUTIONS.md

echo "[4/7] Creating data files..."
echo "System inventory" > Documentation/Audit/System_Inventory.log
echo "ERROR: test" > Server_Errors.txt
echo "Test report" > report_draft.txt
tar -czf config_backup_full.tar.gz Documentation/ 2>/dev/null

echo "[5/7] Creating scripts..."
# Copy the script contents (simplified)
echo '#!/bin/bash
echo "Setup script - run me first!"' > setup_scenario.sh
echo '#!/bin/bash
echo "Check your progress here!"' > check_progress.sh
echo '#!/bin/bash
while true; do sleep 10; done' > bad_calc.sh

echo "[6/7] Setting permissions..."
chmod +x *.sh

echo "[7/7] Setup complete!"
echo ""
echo "Project created in: $(pwd)"
echo "Structure:"
find . -type f | sed 's/^/  /'
echo ""
echo "To begin:"
echo "  1. Read README.md"
echo "  2. Run: ./setup_scenario.sh"
echo "  3. Follow: INSTRUCTIONS.md"
echo "  4. Check: ./check_progress.sh"
echo "========================================"
EOF

chmod +x create_project.sh
