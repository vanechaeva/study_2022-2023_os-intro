#!/bin/bash
while getopts ":i:o:p:Cn" opt; do
  case ${opt} in
     i ) inputfile=$OPTARG;;
     o ) outputfile=$OPTARG;;
     p ) pattern=$OPTARG;;
     C ) uppercase=1;;
     n ) number=1;;
     \? ) echo "Неверный параметр: -$OPTARG" 1>&2
            exit 1;;
     : ) echo "Параметру -$OPTARG необходим аргумент" 1>&2
            exit 1;;
  esac
done

if [ -n "$inputfile" ]; then
    if [ -n "$uppercase" ]; then
	if [ -n "$number" ]; then
	    grep -n "$pattern" "$inputfile"
	else
	    grep "$pattern" "$inputfile"
	fi
    else
	if [ -n "$number" ]; then
	    grep -ni "$pattern" "$inputfile"
	else
	    grep -i "$pattern" "$inputfile"
	fi
    fi
fi

if [ -n "$outputfile" ]; then
    if [ -n "$uppercase" ]; then
        if [ -n "$number" ]; then
            grep -n "$pattern" "$inputfile" > "$outputfile"
        else
            grep "$pattern" "$inputfile" > "$outputfile"
        fi
    else
        if [ -n "$number" ]; then
            grep -ni "$pattern" "$inputfile" > "$outputfile"
        else
            grep -i "$pattern" "$inputfile" > "$outputfile"
        fi
    fi
fi
