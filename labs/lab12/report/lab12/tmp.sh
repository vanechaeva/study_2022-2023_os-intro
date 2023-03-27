#!/bin/bash
for (( i=1;i<=$1;i++ ))
do
 touch "$i.tmp"
done

echo "Создано $1 файлов"

read -p "Хотите ли вы удалить созданные файлы? (y/n): " answer
if [ "$answer" == "y" ]
 then
  for (( i=1;i<=$1;i++ ))
  do
   rm "$i.tmp"
  done
  echo "Удалено $1 файлов"
else
 echo "Файлы не удалены"
fi
