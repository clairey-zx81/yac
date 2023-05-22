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

extract "Fig 5" \
		"." \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_16421.json"

extract "Fig 8.a" \
		".items.anyOf[15].properties.clc_loadbalancer.properties.port|del(.description)" \
		"corpus/store/schemastore-analysis/JSON/Ansible_2.5.json"

extract "Fig 8.b" \
		".definitions.arrayStringRule.oneOf[1].items.anyOf[0]" \
		"corpus/store/schemastore/src/schemas/json/stylelintrc.json"

extract "Fig 8.c" \
		".|del(.additionalProperties)" \
		"corpus/Misc/kubernetes/master-standalone-strict/quantity.json"

extract "Fig 8.d" \
		".definitions.notification.properties.recipients" \
		"corpus/store/schemastore/src/schemas/json/bamboo-spec.json"

extract "Fig 8.e" \
		'.definitions.nodeTypeCloudifyAzureNodesNetworkLoadBalancerProbeInterfaces.properties."cloudify.interfaces.lifecycle".properties.delete' \
		"corpus/store/schemastore/src/schemas/json/cloudify.json"

extract "Fig 9.a" \
		".properties.externally_connectable" \
		"corpus/store/schemastore-analysis/JSON/JSON_schema_for_Google_Chrome_extension_manifest_files.json"

extract "Fig 9.b" \
		'.definitions."github_com-brainicorn-skelp-skelplate-SimpleVar".properties.default|del(.description)' \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_27224.json"

extract "Fig 9.c" \
		".properties.docs.items.properties.recordView|del(.description)" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_24218.json"

extract "Fig 9.d" \
		".definitions.Claim_CareTeam.allOf[1].properties.sequence|del(.description)" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_2512.json"

extract "Fig 10.a" \
		".properties.reporterOptions|del(.description)" \
		"corpus/store/schemastore-analysis/JSON/JSON_schema_for_https__cypress.io_test_runner_cypress.json_file._Details_at_https__on.cypress.io_configuration.json"

extract "Fig 10.b" \
		".definitions.mongo.items.properties.port|del(.description)" \
		"corpus/store/schemastore/src/schemas/json/monika-config-schema.json"

extract "Fig 11.a" \
		".properties.extensions.items" \
		"corpus/store/schemastore/src/schemas/json/vsext.json"

extract "Fig 11.b" \
		".items.anyOf[13]" \
		"corpus/store/schemastore-analysis/JSON/Ansible_2.5.json"
