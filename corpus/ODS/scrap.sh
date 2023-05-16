#! /bin/bash

node="../node_modules/node/bin/node"

URL="$1"

NAME=${URL#https://}
NAME=${NAME%/*}
test -d $NAME || mkdir $NAME

while read dataset ; do
  echo "Scrapping $URL $dataset"
  outfile="$NAME/$dataset.json"
  if ! [ -s "$outfile" ] ; then
    $node OpenDataSoft_JSON_Model.js \
      "$URL/api/v2/catalog/datasets/$dataset" > "$outfile"
    sleep 5
   else
     echo "skipping $outfile" >&2
   fi
done
