cat > setup_scenario.sh << 'EOF'
#!/bin/bash

# ==========================================
# CYBER-DOJO: SCENARIO SETUP SCRIPT
# ==========================================
# This script initializes the "InnovateCo" server environment.
# It creates dummy logs, files, and runaway processes.

echo "[*] Initializing InnovateCo Server Environment..."

# 1. Setup Environment Variables & Directories
mkdir -p /root/Documentation/Audit
mkdir -p /var/log

# 2. Simulate Log Files (Milestone 2 & 7)
echo "[*] Generating system logs..."
# Create a fake dmesg file with errors
cat <<EOF > /var/log/dmesg
[    0.000000] Linux version 5.10.0-8-amd64 (debian-kernel@lists.debian.org)
[    0.213321] ACPI: Core revision 20200528
[    1.423112] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    2.100000] ERROR: mce: [Hardware Error]: CPU 0: Machine Check: 0 Bank 5
[    2.200000] systemd[1]: Failed to start Application.
[    3.552122] piix4_smbus 0000:00:01.3: SMBus Host Controller not enabled!
[    4.112233] ERROR: wifi_adapter: initialization failed
EOF

# Create a fake auth.log for forensics
cat <<EOF > /var/log/auth.log
Oct 10 12:00:01 server sshd[123]: Accepted password for root from 192.168.1.5 port 22
Oct 10 12:05:22 server sshd[125]: FAILED password for user admin from 10.0.0.55 port 222
Oct 10 12:05:24 server sshd[125]: FAILED password for user admin from 10.0.0.55 port 222
Oct 10 12:05:26 server sshd[125]: FAILED password for user admin from 10.0.0.55 port 222
Oct 10 12:10:01 server sudo: root : TTY=pts/0 ; PWD=/root ; USER=root ; COMMAND=/bin/bash
EOF

# 3. Create the "Runaway Process" (Milestone 3)
echo "[*] Launching runaway processes..."
cat <<EOF > /root/bad_calc.sh
#!/bin/bash
while true; do
    # Simulate CPU work without freezing container
    sleep 1
done
EOF
chmod +x /root/bad_calc.sh
# Run in background and disown so it looks like a daemon
nohup /root/bad_calc.sh >/dev/null 2>&1 &

# 4. Create Draft Report (Milestone 7)
echo "[*] Creating draft documents..."
echo "Confidential Report for InnovateCo." > /root/report_draft.txt
echo "The infrastructure at innovateco.com is currently under review." >> /root/report_draft.txt
echo "Contact support@innovateco.com for more details." >> /root/report_draft.txt

# 5. Base Tool Check
# We ensure nano/vi exists, but leave net-tools/cups for the student to install
if ! command -v vi &> /dev/null; then
    echo "[!] 'vi' not found. Installing basic editors (this may take a moment)..."
    apt-get update -qq && apt-get install -y vim -qq
fi

# 6. Sudoers Prep (Milestone 10)
# Ensure sudo is installed so they can check /etc/sudoers
if ! command -v sudo &> /dev/null; then
    apt-get update -qq && apt-get install -y sudo -qq
fi

echo "=========================================="
echo " SYSTEM READY. WELCOME, ADMINISTRATOR."
echo "=========================================="
echo "Your mission starts now. Run the milestones sequentially."
echo "Run 'bash check_progress.sh' to verify your work."
EOF

# Make it executable
chmod +x setup_scenario.sh
