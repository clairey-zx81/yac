#! /bin/bash

node="../node_modules/node/bin/node"

URL="$1"

NAME=${URL#https://}
NAME=${NAME%/*}
test -d $NAME || mkdir $NAME

./OpenDataSoft_scrap.py $URL |
while read dataset ; do
  echo "Scrapping $URL $dataset"
  $node OpenDataSoft_JSON_Model.js \
	"$URL/api/v2/catalog/datasets/$dataset" > \
    $NAME/$dataset.json
  sleep 1
done
