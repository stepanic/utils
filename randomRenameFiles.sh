#!/bin/sh
echo 'USAGE ./randomRenameFilesPrefix <PATH_TO_DIR>'
echo 'foo.txt TO 00034_foo.txt'

path=$1
# Remove trailling slash
path=${path%/}
needle="$path/"

for entry in "$path"/*
do
  file=${entry/$needle/}
  random=$(LC_ALL=C; cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
  $(mv "${entry}" "${path}/M_${random}_${file}")
done
