```bash
cat > INSTRUCTIONS.md << 'EOF'
```
# Cyber-Dojo: Complete Lab Instructions

## 📋 Before You Begin

1. Ensure you have root access: `sudo su` or login as root
2. Create project directory: `mkdir cyber-dojo && cd cyber-dojo`
3. Run the setup: `./setup_scenario.sh`
4. Keep this guide open in a separate window

## 🎯 Milestone 1: Initial Reconnaissance

### **Task A: System Identity**
```bash
# Determine Linux distribution and version
cat /etc/*release

# Check kernel version
uname -r
```
### **Task B: Environment Check**
```bash
# Show current directory
pwd

# Display executable search path
echo $PATH
```
### **Task C: Filesystem Mapping**
```bash
# Go to root directory
cd /

# List all contents with details
ls -l
```
Concept: Learn the Filesystem Hierarchy Standard (FHS)

## 🎯 Milestone 2: Building Documentation Base

### **Task A: Structure Creation**
```bash
# Create nested documentation directories
mkdir -p Documentation/Audit/Configuration
```
### **Task B: Data Capture**
```bash
# Generate complete system inventory
ls -R / > Documentation/Audit/System_Inventory.log
```
### **Task C: Log Filtering**
```bash
# Extract errors from system logs
grep -i "error" /var/log/dmesg >> Server_Errors.txt
```
Concept: Master redirection (> and >>) for logging

## 🎯 Milestone 3: Process & Resource Triage

### **Task A: Find the Culprit**
```bash
# Locate the runaway process
ps aux | grep bad_calc.sh
# Note the PID from output (e.g., 1234)
```
### **Task B: Gentle Termination**
```bash
# Send termination signal (replace 1234 with actual PID)
kill 1234
```
### **Task C: Hard Termination**
```bash
# Force kill if still running
kill -9 1234

# Verify termination
ps aux | grep bad_calc.sh
```
Concept: SIGTERM (15) vs SIGKILL (9) signals

## 🎯 Milestone 4: Implementing RBAC

### **Task A: New Group & User**
```bash
# Create developers group
groupadd developers

# Create user with primary group
useradd -m -g developers dev_a
```
### **Task B: Secure Project Directory**
```bash
# Create project directory
mkdir /opt/dev_project

# Set ownership
chown dev_a:developers /opt/dev_project
```

### **Task C: Set Permissions**
```bash
# Apply secure permissions (rwxr-x---)
chmod 750 /opt/dev_project
```
Concept: Octal permissions and Least Privilege principle

## 🎯 Milestone 5: Advanced Process Isolation

### **Task A: Launch in Background**
```bash
# Start long process in background
sleep 600 &

# List background jobs
jobs
```

### **Task B: Detach for Reliability**
```bash
# Kill the background job
kill %1

# Start detached process
nohup sleep 600 &
```
### **Task C: Priority Adjustment**
```bash
# Find a process to adjust (use any PID from ps aux)
renice +10 [PID]
```
Concept: Background jobs, nohup, and process niceness

## 🎯 Milestone 6: Software Supply Chain Audit

### **Task A: Update Sources**
```bash
# Refresh package lists
sudo apt update
```

### **Task B: Install Tools**
```bash
# Install required packages
sudo apt install net-tools cups -y
```

Task C: Audit Installation
```bash
# Search for packages
apt search telnet

# Show package details
apt show telnet
```
Concept: Package management and security updates

## 🎯 Milestone 7: Log File Forensics and Reporting

### **Task A: Initial Log View**
```bash
# Open passwd file in vi
vi /etc/passwd

# Exit without saving: Press ESC, then type :q!
```

### **Task B: Structured Search (AWK)**
```bash
# Extract failed login attempts
awk '/FAILED/ {print $1, $4}' /var/log/auth.log
```
### **Task C: Text Substitution (SED)**
```bash
# Update domain in report
sed 's/innovateco.com/secureco.io/g' report_draft.txt
```
Concept: Stream editors (sed) and pattern scanning (awk)

## 🎯 Milestone 8: Backup and Filesystem Health Check

### **Task A: Capacity Check**
```bash
# Check directory size
du -h Documentation

# Check disk usage
df -h
```
### **Task B: Creating the Archive**
```bash
# Create compressed backup
tar -czvf config_backup_full.tar.gz Documentation/
```

### **Task C: Verification**
```bash
# Create test directory
mkdir /tmp/restore_test

# Extract and verify backup
tar -xzvf config_backup_full.tar.gz -C /tmp/restore_test
```
Concept: Archiving with tar and compression with gzip

## 🎯 Milestone 9: Configuring Secure Print & Network Service

### **Task A: Network Audit**
```bash
# List listening ports
ss -tuln
```

### **Task B: Start CUPS Service**
```bash
# Start printing service
service cups start
```
### **Task C: Simulate CUPS Config**
```bash
# Edit configuration
vi /etc/cups/cupsd.conf
# Add line: Allow 192.168.1.0/24
# Save with :wq
```

### **Task D: Queue Management**
```bash
# Create printer queue
lpadmin -p office_laser -E -v socket://10.0.0.5

# Verify queue
lpstat -p
```
Concept: Network services and port management

## 🎯 Milestone 10: Applying Final Security Policy

### **Task A: Inspect SUDO**
```bash
# View sudo configuration
cat /etc/sudoers
```

### **Task B: Restrict Resources**
```bash
# Edit limits configuration
vi /etc/security/limits.conf
# Add line: dev_a hard nproc 20
# Save with :wq
```

Task C: Firewall Policy (Conceptual)
```bash
# DO NOT RUN - Conceptual only
# iptables -P INPUT DROP
```

Concept: Resource limits and security hardening






















































