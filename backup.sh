#!/bin/sh

echo -e "################################################################################################### \n\n"

echo "Starting backup at $(date)"

echo "Initializing borg repository"
borg init --encryption=none /repository

echo "Running any Pre Commands"
sh -c "$PRE_COMMANDS"

echo "Starting borg backup"
borg create --stats /repository::{now} /source $BORG_OPTIONS

echo "Pruning old backups"
borg prune $BORG_PRUNE_OPTIONS /repository

echo "Compacting backup"
borg compact /repository

echo "Running any Post Commands"
sh -c "$POST_COMMANDS"

echo -e "Backup Complete \n\n"

echo -e "################################################################################################### \n\n"
