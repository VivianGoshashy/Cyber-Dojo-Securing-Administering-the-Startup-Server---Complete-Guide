cat > verify_all.sh << 'EOF'
#!/bin/bash

echo "=== CYBER-DOJO PROJECT VERIFICATION ==="
echo ""

echo "1. Checking file structure..."
FILES=("README.md" "INSTRUCTIONS.md" "SOLUTIONS.md" 
       "setup_scenario.sh" "check_progress.sh" 
       "create_project.sh" "bad_calc.sh"
       "Documentation/Audit/System_Inventory.log"
       "Server_Errors.txt" "report_draft.txt"
       "config_backup_full.tar.gz")

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $file"
    else
        echo "  ✗ MISSING: $file"
    fi
done

echo ""
echo "2. Checking executable permissions..."
EXECUTABLES=("setup_scenario.sh" "check_progress.sh" "create_project.sh" "bad_calc.sh")
for exe in "${EXECUTABLES[@]}"; do
    if [ -x "$exe" ]; then
        echo "  ✓ $exe (executable)"
    else
        echo "  ✗ $exe (not executable - run: chmod +x $exe)"
    fi
done

echo ""
echo "3. Project structure:"
find . -type f | sort | sed 's/^/  /'

echo ""
echo "=== VERIFICATION COMPLETE ==="
echo ""
echo "To start the project:"
echo "  1. Read the documentation: cat README.md"
echo "  2. Initialize environment: ./setup_scenario.sh"
echo "  3. Follow instructions: less INSTRUCTIONS.md"
echo "  4. Check progress: ./check_progress.sh"
EOF

chmod +x verify_all.sh
