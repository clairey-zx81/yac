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
		"corpus/Store/schemastore-analysis/JSON/Ansible_2.5.json"

extract "Fig 8.b" \
		".definitions.arrayStringRule.oneOf[1].items.anyOf[0]" \
		"corpus/Store/schemastore/src/schemas/json/stylelintrc.json"

extract "Fig 8.c" \
		".|del(.additionalProperties,.\"\$schema\")" \
		"corpus/Misc/kubernetes/master-standalone-strict/quantity.json"

extract "Fig 8.d" \
        ".definitions.notification.properties.recipients|del(.anyOf[0,1].properties)" \
		"corpus/Store/schemastore/src/schemas/json/bamboo-spec.json"

extract "Fig 8.e" \
		'.definitions.nodeTypeCloudifyAzureNodesNetworkLoadBalancerProbeInterfaces.properties."cloudify.interfaces.lifecycle".properties.delete' \
		"corpus/Store/schemastore/src/schemas/json/cloudify.json"

extract "Fig 9.a" \
		".properties.externally_connectable|del(.description,.items.properties.ids[],.items.properties.accepts_tls_channel_id,.items.properties.matches,.items.additionalProperties)" \
		"corpus/Store/schemastore-analysis/JSON/JSON_schema_for_Google_Chrome_extension_manifest_files.json"

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
		"corpus/Store/schemastore-analysis/JSON/JSON_schema_for_https__cypress.io_test_runner_cypress.json_file._Details_at_https__on.cypress.io_configuration.json"

extract "Fig 10.b" \
		".definitions.mongo.items.properties.port|del(.description,.title,.default)" \
		"corpus/Store/schemastore/src/schemas/json/monika-config-schema.json"

extract "Fig 11.a" \
		".properties.extensions.items|del(.properties[][])" \
		"corpus/Store/schemastore/src/schemas/json/vsext.json"

extract "Fig 11.b" \
		".items.anyOf[13]|del(.include[],.name[])" \
		"corpus/Store/schemastore-analysis/JSON/Ansible_2.5.json"

extract "Fig 12.a" \
		".properties.postActions.items.allOf[1].oneOf[3].properties.args.properties.targetFiles.oneOf[0]|del(.description)" \
		"corpus/Store/schemastore/src/schemas/json/template.json"

extract "Fig 12.b" \
		'.properties."sap.ui5".properties.routing.properties.routes' \
		"corpus/Store/schemastore-analysis/JSON/JSON_schema_for_UI5_manifest.json_project_declaration.json"

extract "Fig 12.c" \
		".definitions.fileHashes" \
		"corpus/Store/schemastore/src/schemas/json/azure-deviceupdate-manifest-definitions-4.0.json"

extract "Fig 12.d" \
		".|del(.name)" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_81088.json"

extract "Fig 12.e" \
		".|del(.name)" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_81088.json"

extract "Fig 12.f" \
		".items" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_37714.json"

extract "Fig 13" \
		".definitions.geometry|del(.required)" \
		"corpus/ODS/data.laregion.fr/20181005_opendata_dej.json"

extract "Fig 14.a" \
		".properties|del(.age_group)" \
		"corpus/JSC/JSC_extracts/pp_53086_000.json"

extract "Fig 14.b" \
		".properties.update_configs.items.properties.allowed_updates" \
		"corpus/Store/schemastore/src/schemas/json/dependabot.json"

extract "Fig 14.c" \
		".definitions.job_template.properties.artifacts.properties.paths|del(.description)" \
		"corpus/Store/schemastore-analysis/JSON/Gitlab_CI_configuration.json"

extract "Fig 14.d" \
		".|del(.title)" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_73935.json"

extract "Fig 14.e" \
		".properties.experienceEndpoints.properties.items.items.properties.unauthorizedReply.oneOf[0].properties.statusCode" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_9882.json"

extract "Fig 14.f" \
		".definitions.billow.properties.OctaveCount|del(.description)" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_17072.json"

extract "Fig 14.g" \
		".definition.commandStep.groupStep.properties.steps" \
		"corpus/Store/schemastore-analysis/JSON/JSON_schema_for_Buildkite_pipeline_configuration_files.json"
