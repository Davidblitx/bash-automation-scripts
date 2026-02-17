# Bash Automation Suite

Production-ready Bash scripts for DevOps automation.

## Scripts

### 1. system-backup.sh
Automated backup with retention management.

**Features:**
- Timestamped archives (.tar.gz)
- Configurable retention (default: 30 days)
- Automatic cleanup of old backups
- Full operation logging

**Usage:**
```bash
./system-backup.sh
```

---

### 2. deployment-check.sh
Pre-deployment validation script.

**Checks:**
- Required services are running
- Disk space within threshold
- Network connectivity to critical hosts

**Usage:**
```bash
./deployment-check.sh
```

**Exit codes:**
- `0` = All checks passed (safe to deploy)
- `1` = One or more checks failed (deployment blocked)

---

### 3. user-provision.sh
Automated user onboarding.

**Features:**
- Creates user with home directory
- Adds to docker group automatically
- Audit logging to /var/log/user-provision.log
- Validates user doesn't already exist

**Usage:**
```bash
sudo ./user-provision.sh <username>
```

---

## What I Learned

Writing these scripts taught me:
- Error handling with exit codes
- Logging patterns for production scripts
- How to test both success and failure scenarios
- Why deployment automation prevents human error

## Part of My DevOps Journey

Foundation phase:
- ✅ Linux fundamentals
- ✅ Git workflow
- ✅ Networking concepts
- ✅ Docker containerization
- ✅ Bash automation
- ⏳ Python for automation
- ⏳ AWS cloud infrastructure