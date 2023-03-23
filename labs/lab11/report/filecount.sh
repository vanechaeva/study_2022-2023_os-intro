#!/bin/bash
directory="."
if [[ "$1" != .* && -d "$1" ]]; then
 directory="$1"
 shift
fi

if [ "$1" = "" ]; then
 echo "Пожалуйста, введите аргумент с расширением."
 exit
fi

extension="$1"

count=$(find "$directory" -type f -name "*$extension"  | wc -l)

echo "Количесто файлов расширения $extension в указанном каталоге: $count"
