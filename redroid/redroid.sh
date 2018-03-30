#!/bin/bash

if [[ $# -ne 2 ]]; then
  echo "Two arguments must be provided"
  echo "./redroid.sh $target_folder $added_prefix"
  exit 1
fi

# We need optipng to compress
optipng -v > /dev/null || {
  echo "Optipng not found. Run brew install optipng"
  exit 1
}

mkdir $1/xhdpi
mkdir $1/xxhdpi

for f in $1/*.png;
do
  name=${f##*/}
  nospace=${name//[ ]/_}
  lowers="$(echo $nospace | tr '[A-Z]' '[a-z]')"
  fullname=""

  if [[ "$lowers" == *3x* ]]
    then
    fullname="$1/xxhdpi/$2_${lowers/@3x/}"
    cp "$f" $fullname
  elif [[ "$name" == *2x* ]]
    then
    fullname="$1/xhdpi/$2_${lowers/@2x/}"
    cp "$f" $fullname
  fi
  optipng $fullname
done
exit 0

