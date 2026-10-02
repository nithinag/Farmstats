# FARMSTATS Backup & Restore Guide

## Overview

FARMSTATS stores all farm data locally on your device using SQLite. The Backup & Restore system allows you to create complete snapshots of your database and restore them at any time.

## Creating a Backup

1. Open **Settings** from the bottom navigation bar.
2. Tap **Backup & Restore**.
3. Tap **Create Backup**.
4. Wait for the backup to complete. You will see a success message with the backup file name.

### What Gets Backed Up

- All batches, expenses, income records
- Inventory items and transactions
- Labour records, attendance, and wages
- Feeding logs and health observations
- Harvest records and cocoon grades
- Notification history

### What Does NOT Get Backed Up

- App preferences (theme, units) — these are stored separately in SharedPreferences
- Farm Profile settings — also stored in SharedPreferences

## Restoring a Backup

1. Go to **Settings → Backup & Restore**.
2. Tap **Restore from Backup**.
3. Select the backup file you want to restore.
4. Confirm the restore action.

> **CAUTION**: Restoring a backup will **permanently replace** all current data in the app. This action cannot be undone. Create a fresh backup before restoring if you want to preserve current data.

## Backup Verification

Each backup file includes a checksum. When restoring, FARMSTATS verifies the checksum to ensure the backup file has not been corrupted or tampered with. If verification fails, the restore is blocked.

## Best Practices

- Create backups regularly, especially before and after harvest seasons.
- Keep at least two backup copies at different times.
- Transfer backup files to a computer or cloud storage for additional safety.
