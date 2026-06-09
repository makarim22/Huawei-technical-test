#!/bin/bash

# Folder target pembersihan
TARGET_DIR="/home/cron"

# Mencari dan menghapus file berformat 'cron_*.csv' yang usianya lebih dari 30 hari
find "$TARGET_DIR" -type f -name "cron_*.csv" -mtime +30 -delete

# Catatan Log Pembersihan (Opsional)
echo "Pembersihan otomatis selesai pada $(date)" >> "${TARGET_DIR}/clean_log.txt"
