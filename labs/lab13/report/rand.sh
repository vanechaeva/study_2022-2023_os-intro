#!/bin/bash
function random_letter() {
 rand=$((RANDOM%26))
 letter=$(echo {a..z} | cut -d ' ' -f $((rand+1)))
 echo $letter
}
count=$((RANDOM%30))
for (( i=1;i<=count;i++ )); 
 do
  echo -n $(random_letter)
 done
echo ""
