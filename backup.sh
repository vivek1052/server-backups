#!/bin/sh

echo -e "==========================================================================================="

echo "Starting backup at $(date)"

echo "Initializing borg repository"
borg init --encryption=none /repository

echo "Running any Pre Commands"
set -x
sh -c "$PRE_COMMANDS"
set +x

echo "Starting borg backup"
borg create --stats /repository::{now} /source $BORG_OPTIONS

echo "Pruning old backups"
borg prune $BORG_PRUNE_OPTIONS /repository

echo "Compacting backup"
borg compact /repository

echo "Running any Post Commands"
set -x
sh -c "$POST_COMMANDS"
set +x

echo -e "Backup Complete \n\n"

echo -e "==========================================================================================="
