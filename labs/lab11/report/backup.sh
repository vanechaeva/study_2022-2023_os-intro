#!/bin/bash

backup_directory="backup"

filename=$(basename "$0")

backup_filename="${filename}_$(date +"%Y-%m-%d_%H-%M-%S").sh"

cp "$0" "${backup_directory}/${backup_filename}"

zip "${backup_directory}/${backup_filename}.zip" "${backup_directory}/${backup_filename}"

rm "${backup_directory}/${backup_filename}"

echo "Backup создан в ${backup_directory}/${backup_filename}"

