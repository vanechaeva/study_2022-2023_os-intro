#!/bin/bash
if [ -z "$1" ]
  then
    echo "Не указана директория"
    exit 1
fi

find "$1" -type f -mtime -7  | xargs tar -czvf archive.tar.gz "$1"/*
