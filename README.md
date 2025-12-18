# Cyber-Dojo-Securing-Administering-the-Startup-Server

## 📋 Project Overview

This final project simulates a real-world scenario where you, as a Junior System Administrator, must secure and administer a poorly configured Linux server for a fast-growing tech startup "InnovateCo". The project consists of 10 critical milestones covering essential sysadmin and cybersecurity skills.

## 🎯 Learning Objectives

1. Perform comprehensive system security audits: Identify vulnerabilities and misconfigurations in a production environment

2. Master Linux process management and troubleshooting: Control, monitor, and optimize system processes

3. Implement Role-Based Access Control (RBAC): Manage users, groups, and permissions effectively

4. Configure network services and printing systems: Set up and secure essential enterprise services

5. Apply security policies and resource limits: Enforce system hardening and prevent resource exhaustion

6. Create system documentation and backups: Implement professional documentation and recovery procedures

## 🛠️ Prerequisites

1. Basic Linux command line knowledge: Familiarity with common commands, navigation, and file operations
2. SSH access to a Linux environment: Ubuntu/Debian-based system (container, VM, or physical server)
3. Root/sudo privileges: Administrative access to install packages and modify system configurations

## 📁 Complete Project Structure
``` bash
cyber-dojo-project/

├── Documentation/

    └── Audit/
        ├── System_Inventory.log          # Milestone 2: System inventory
        └── Configuration/                # Configuration documentation
        
├── Server_Errors.txt                     # Milestone 2: Filtered error logs

├── report_draft.txt                      # Milestone 7: Security report

├── config_backup_full.tar.gz             # Milestone 8: System backup

├── setup_scenario.sh                     # Initial environment setup

├── check_progress.sh                     # Milestone verification tool

├── bad_calc.sh                           # Milestone 3: Runaway process

├── README.md                             # This documentation

├── create_project.sh                     # One-click setup script

├── verify_structure.sh                   # Structure validation

└── init_project.sh                       # Quick initialization
```

## 🚀 Quick Start Guide

## Phase 1: Environment Setup (5 minutes)

### 1. Clone/Download the Project Structure
```bash
# Navigate to your workspace
cd ~

# Create project directory
mkdir cyber-dojo-project
cd cyber-dojo-project
```
### 2. Create Essential Files
```bash 
# Create directory structure
mkdir -p Documentation/Audit/Configuration

# Create placeholder files
touch Documentation/Audit/System_Inventory.log
touch Server_Errors.txt
touch report_draft.txt
```
### 3. Generate Setup Scripts

## Phase 2: Complete All 10 Milestones

### 📊 Milestone 1: Initial Reconnaissance

#### Objective: Assess the current system state and environment.
```bash
# Task A: System Identity
cat /etc/*release              # Determine distribution and version
uname -r                       # Check kernel version

# Task B: Environment Check
pwd                            # Display current working directory
echo $PATH                     # Show executable search path

# Task C: Filesystem Mapping
cd /                           # Change to root directory
ls -l                          # List all contents with details
```
#### Key Concept: Understanding the Filesystem Hierarchy Standard (FHS) - /etc for configs, /var for logs, /bin for binaries.

### 📝 Milestone 2: Building Documentation Base

#### Objective: Create systematic documentation and error tracking.
```bash
# Task A: Structure Creation
mkdir -p Documentation/Audit/Configuration

# Task B: Data Capture
ls -R / > Documentation/Audit/System_Inventory.log

# Task C: Log Filtering
grep -i "error" /var/log/dmesg >> Server_Errors.txt
```
#### Key Concept: Redirection (>) overwrites files, while append (>>) adds content. Essential for logging.

### ⚙️ Milestone 3: Process & Resource Triage

#### Objective: Identify and manage resource-intensive processes.
check bad_calc.sh file

#### Key Concept: SIGTERM (15) allows cleanup; SIGKILL (9) is immediate. Always try SIGTERM first.

### 🔐 Milestone 4: Implementing RBAC

#### Objective: Establish secure access controls and permissions.
```bash
# Task A: New Group & User
groupadd developers
useradd -m -g developers dev_a

# Task B: Secure Project Directory
mkdir /opt/dev_project
chown dev_a:developers /opt/dev_project

# Task C: Set Permissions
chmod 750 /opt/dev_project     # Owner: rwx, Group: r-x, Others: ---
```

#### Key Concept: Octal permissions (7=rwx, 5=r-x, 0=---). Principle of Least Privilege restricts access to essentials.

### 📈 Milestone 5: Advanced Process Isolation

#### Objective: Master process control and priority management.
```bash
# Task A: Launch in Background
sleep 600 &                    # Start long-running process
jobs                           # List background jobs

# Task B: Detach for Reliability
kill %1                        # Terminate first background job
nohup sleep 600 &              # Start process immune to terminal hangups

# Task C: Priority Adjustment
renice +10 [PID]               # Increase niceness (lower priority)
```
#### Key Concept: nohup prevents SIGHUP on logout. Niceness (-20 to +19) controls CPU priority.

### 📦 Milestone 6: Software Supply Chain Audit

#### Objective: Manage software packages and ensure system integrity.
```bash
# Task A: Update Sources
sudo apt update                # Refresh package lists

# Task B: Install Tools
sudo apt install net-tools cups -y

# Task C: Audit Installation
apt search telnet              # Search for packages
apt show telnet                # Display package details
```
#### Key Concept: apt update fetches lists; apt install installs packages. Foundation for secure patching.

### 🔍 Milestone 7: Log File Forensics and Reporting

#### Objective: Analyze logs and automate text processing.




