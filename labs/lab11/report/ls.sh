#!/bin/bash
echo "В текущем каталоге:"
for file in *
do
 if  [ -d "$file" ]; then
  echo "dir: $file"
 else
  echo "file: $file"
 fi

 if  [ -r "$file" ]; then
  echo "readabale"
 fi

 if [ -w "$file" ]; then
  echo "writable"
 fi
 
 if [ -x "$file" ]; then
  echo "executable"
 fi
printf "\n"
done
