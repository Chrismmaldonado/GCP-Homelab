#!/bin/bash
# Define variables
BACKUP_DIR="$HOME/backups"
STACK_DIR="$HOME/wireguard-stack"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="vault_backup_$TIMESTAMP.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

echo "--- Starting Backup ---"

# Pause Vaultwarden to prevent database corruption during copy
cd $STACK_DIR
sudo docker compose pause vaultwarden

# Create the compressed backup
sudo tar -czf $BACKUP_DIR/$BACKUP_NAME -C $HOME wireguard-stack

# Resume Vaultwarden
sudo docker compose unpause vaultwarden

echo "--- Backup Complete: $BACKUP_DIR/$BACKUP_NAME ---"

# Optional: Delete backups older than 30 days to save space
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +30 -delete
