#!/bin/sh
echo 'USAGE ./resizePhotosInDirectory.sh <PATH_TO_SOURCE_DIR> <PATH_TO_DESTINTATION_DIR>'

src=$1
dest=$2
# Remove trailling slash
src=${src%/}
dest=${dest%/}
needle="$src/"

for entry in "$src"/*
do
  file=${entry/$needle/}
  convert "$src/$file" -quality 90 -resize 4290 "$dest/$file"
done
