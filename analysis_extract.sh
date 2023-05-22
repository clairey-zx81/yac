#! /bin/bash

function extract()
{
  local msg=$1 path=$2 file=$3
  echo "# $msg"
  echo "# - $path"
  echo "# - $file"

  jq "$path" "$file"
  echo
}

extract "Fig 5" "." "corpus/JSC/json-schema-corpus/json_schema_corpus/pp_16421.json"

extract "Fig 8.a" ".items.anyOf[15].properties.clc_loadbalancer.properties.port|del(.description)" "corpus/store/schemastore-analysis/JSON/Ansible_2.5.json"
