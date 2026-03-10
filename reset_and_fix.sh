#!/bin/bash
# Configuration
STACK_DIR="$HOME/wireguard-stack"
BACKUP_DIR="$HOME/backups"

# Find the latest backup file
LATEST_BACKUP=$(ls -t $BACKUP_DIR/vault_backup_*.tar.gz 2>/dev/null | head -1)

echo "--- STARTING DISASTER RECOVERY ---"

if [ -z "$LATEST_BACKUP" ]; then
    echo "ERROR: No backup found in $BACKUP_DIR. I can't reset without a backup!"
    exit 1
fi

echo "Found latest backup: $LATEST_BACKUP"
read -p "This will wipe current configs and restore from this backup. Proceed? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# Step 1: Kill everything
echo "Stopping all containers..."
cd $STACK_DIR
sudo docker compose down --remove-orphans

# Step 2: Clear broken folders
echo "Cleaning up current configuration..."
sudo rm -rf $STACK_DIR/vw-data $STACK_DIR/config $STACK_DIR/my-files $STACK_DIR/filestash-data

# Step 3: Restore from backup
echo "Restoring files from backup..."
sudo tar -xzf "$LATEST_BACKUP" -C $HOME/

# Step 4: Fix permissions
echo "Ensuring permissions are correct..."
sudo chown -R 1000:1000 $STACK_DIR

# Step 5: Restart the stack
echo "Bringing the stack back online..."
sudo docker compose up -d

echo "--- RECOVERY COMPLETE: Everything should be back to normal! ---"
