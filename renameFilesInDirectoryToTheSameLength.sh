#!/bin/sh
echo 'USAGE ./renameFilesInDirectoryToTheSameLength.sh <PATH_TO_SOURCE_DIR>'

src=$1
# Remove trailling slash
src=${src%/}
needle="$src/"

prefix="Anita & Matija ("
sufix=").jpg"

# ? > 000&
# ?? > 00&
# ??? > 0&

# TODO(stepanic): fix to work witohout patter modification
for x in $src/Anita\ \&\ Matija\ \(??\).jpg
do
  newFile=$(echo $x | sed -e 's/[0-9]\{2\}/00&/g')
  echo $x
  echo $newFile
  mv "$x" "$newFile"
done

