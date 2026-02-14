# Bash Automation Suite

A collection of production-ready Bash scripts designed to automate common System Administration and DevOps tasks.

## Scripts Included

### 1. System Backup (`system-backup.sh`)
- **Purpose**: Creates compressed `.tar.gz` backups of a source directory with unique timestamps.
- **Features**: Includes directory verification to prevent errors if the source is missing.

### 2. Deployment Health Check (`deployment-check.sh`)
- **Purpose**: Monitors service availability by checking HTTP status codes.
- **Features**: Logs all attempts (Success/Failure) with timestamps to `deployment.log` for audit trails.

### 3. User Provisioning (`user-provision.sh`)
- **Purpose**: Automates the creation of new Linux users with home directories.
- **Features**: Enforces root/sudo privileges and checks for existing users before execution to ensure idempotency.

---

