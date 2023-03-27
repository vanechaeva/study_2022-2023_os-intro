#!/bin/bash
if [ -z "$1" ]; then
    echo "Введите: man <команда>"
    exit 1
fi
filename="/usr/share/man/man1/${1}.1.gz"
if [ ! -f "$filename" ]; then
    echo "Справки по данной команде нет"
    exit 1
fi
less "$filename"
