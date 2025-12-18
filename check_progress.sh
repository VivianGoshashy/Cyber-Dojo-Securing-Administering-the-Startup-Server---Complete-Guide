cat > check_progress.sh << 'EOF'
#!/bin/bash

# ==========================================
# CYBER-DOJO: MISSION STATUS CHECKER
# ==========================================

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

pass() { echo -e "${GREEN}[PASS]${NC} $1"; }
fail() { echo -e "${RED}[FAIL]${NC} $1"; }

echo "Checking System State..."
echo "------------------------"

# Milestone 2 Check
if [ -f "Documentation/Audit/System_Inventory.log" ]; then
    pass "Milestone 2: Inventory Log found."
else
    fail "Milestone 2: 'Documentation/Audit/System_Inventory.log' missing."
fi

if [ -f "Server_Errors.txt" ] && grep -q "ERROR" "Server_Errors.txt"; then
    pass "Milestone 2: Server_Errors.txt created and contains errors."
else
    fail "Milestone 2: 'Server_Errors.txt' missing or empty."
fi

# Milestone 3 Check
if pgrep -f "bad_calc.sh" > /dev/null; then
    fail "Milestone 3: The runaway process 'bad_calc.sh' is STILL RUNNING!"
else
    pass "Milestone 3: Runaway process terminated."
fi

# Milestone 4 Check
if getent group developers > /dev/null; then
    pass "Milestone 4: Group 'developers' exists."
else
    fail "Milestone 4: Group 'developers' not found."
fi

if id "dev_a" &>/dev/null; then
    pass "Milestone 4: User 'dev_a' exists."
else
    fail "Milestone 4: User 'dev_a' not found."
fi

if [ -d "/opt/dev_project" ]; then
    # Check permissions (750)
    PERM=$(stat -c "%a" /opt/dev_project)
    if [ "$PERM" -eq 750 ]; then
        pass "Milestone 4: Project directory permissions are correct (750)."
    else
        fail "Milestone 4: Project directory permissions are $PERM (Expected 750)."
    fi
else
    fail "Milestone 4: Directory '/opt/dev_project' not found."
fi

# Milestone 6 Check
if dpkg -s cups &> /dev/null && dpkg -s net-tools &> /dev/null; then
    pass "Milestone 6: Required packages (cups, net-tools) installed."
else
    fail "Milestone 6: Packages 'cups' and/or 'net-tools' are missing."
fi

# Milestone 7 Check
if [ -f "report_draft.txt" ]; then
    if grep -q "secureco.io" report_draft.txt; then
         pass "Milestone 7: Domain name updated in 'report_draft.txt' (Bonus)."
    else
         echo -e "${RED}[WARN]${NC} Milestone 7: 'report_draft.txt' still contains old domain. Did you save the sed output?"
    fi
else
    fail "Milestone 7: Report file missing."
fi

# Milestone 8 Check
if [ -f "config_backup_full.tar.gz" ]; then
    pass "Milestone 8: Backup archive found."
else
    fail "Milestone 8: 'config_backup_full.tar.gz' missing."
fi

# Milestone 9 Check
if [ -f "/etc/cups/cupsd.conf" ]; then
    if grep -q "Allow" /etc/cups/cupsd.conf; then
         pass "Milestone 9: CUPS configuration modified."
    else
         fail "Milestone 9: No 'Allow' rule found in cupsd.conf."
    fi
else
    fail "Milestone 9: cupsd.conf not found (Did you install CUPS?)."
fi

if lpstat -p office_laser &> /dev/null; then
    pass "Milestone 9: Print queue 'office_laser' exists."
else
    fail "Milestone 9: Print queue 'office_laser' not detected (Is cupsd running?)."
fi

# Milestone 10 Check
if grep -q "dev_a hard nproc 20" /etc/security/limits.conf; then
    pass "Milestone 10: Resource limits set for 'dev_a'."
else
    fail "Milestone 10: 'dev_a' limits not found in /etc/security/limits.conf."
fi

echo "------------------------"
echo "Check complete."
EOF

# Make it executable
chmod +x check_progress.sh
