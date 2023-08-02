#! /bin/bash
#
# Generate all extracts for report:
#
# "An Analysis of Defects in Public JSON Schema"
# Claire Yannou-Medrala and Fabien Coelho
# Technical Report A/794/CRI, Mines Paris - PSL
#

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
		'.properties.externally_connectable|
         del(.description,.items.properties.ids[],
             .items.properties.accepts_tls_channel_id,
             .items.properties.matches,
             .items.additionalProperties)' \
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
        '."$defs".ActionInput' \
        "corpus/Misc/VRAC/openapi_launchdarkly_components.json"

extract "Fig 12.a" \
		".properties.postActions.items.allOf[1].oneOf[3].properties.args.properties.targetFiles.oneOf[0]|del(.description)" \
		"corpus/Store/schemastore/src/schemas/json/template.json"

extract "Fig 12.b" \
		'.properties."sap.ui5".properties.routing.properties.routes|del(.description,.items.properties[])' \
		"corpus/Store/schemastore-analysis/JSON/JSON_schema_for_UI5_manifest.json_project_declaration.json"

extract "Fig 12.c" \
		".definitions.fileHashes|del(.title,.description,.properties[],.maxProperties,.required)" \
		"corpus/Store/schemastore/src/schemas/json/azure-deviceupdate-manifest-definitions-4.0.json"

extract "Fig 12.d" \
		".|del(.name,.title,.description,.\"\$schema\",.id)" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_81088.json"

extract "Fig 12.e" \
		'.properties.build|
         del(.description,
             .properties.buildpacks,
             .properties.dockerfile,
             .properties."build-target",
             .properties.builder,
             .properties.args,
             .properties.image.description)' \
		"corpus/Store/schemastore/src/schemas/json/fly.json"

extract "Fig 12.f" \
		'.items|
         del(.description,
             .properties.label[],
             .properties.namespaces,
             .properties.tag)' \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_37714.json"

extract "Fig 13" \
		'.|del(.description,.title,
               .definitions."20181005_opendata_dej",
               .definitions.geoJSON,
               .definitions.bbox,
               .definitions.crs,
               .definitions.namedCrs,
               .definitions.linkedObject,
               .definitions.geometryCollection,
               .definitions.feature,
               .definitions.featureCollection,
               .definitions.linkedCrs,
               .definitions.geometry["title","required","position","positionArray","lineString","linearRing"],
               .definitions.geometry.oneOf[0,1,2,3,5],
               .definitions.geometry.polygon[],
               .definitions."20181005_opendata_dej_records",
               .definitions.geometry.oneOf[4].title,
               .definitions.geometry.oneOf[].properties.type)' \
		"corpus/ODS/data.laregion.fr/20181005_opendata_dej.json"

extract "Fig 14.a" \
		".properties|del(.age_group)" \
		"corpus/JSC/JSC_extracts/pp_53086_000.json"

extract "Fig 14.b" \
		'.properties.update_configs.items.properties.allowed_updates|
         del(.description,.items.properties)' \
		"corpus/Store/schemastore/src/schemas/json/dependabot.json"

extract "Fig 14.c" \
		'.definitions.job_template.properties.artifacts.properties.paths|
         del(.description)' \
		"corpus/Store/schemastore-analysis/JSON/Gitlab_CI_configuration.json"

extract "Fig 14.d" \
		".|del(.title)" \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_73935.json"

extract "Fig 14.e" \
		'.properties.experienceEndpoints.properties.items.items.properties.unauthorizedReply.oneOf[0].properties.statusCode' \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_9882.json"

extract "Fig 14.f" \
		'.definitions.billow.properties.OctaveCount|
         del(.description,.title)' \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_17072.json"

extract "Fig 14.g" \
        '.definitions.groupStep.properties.steps|
         del(.description,.items[])' \
		"corpus/Store/schemastore-analysis/JSON/JSON_schema_for_Buildkite_pipeline_configuration_files.json"

extract "Fig 15" \
		".properties.errorPage|
         del(.items.properties,.items.file,.items.required)" \
		"corpus/Store/schemastore/src/schemas/json/xs-app.json"

extract "Fig 16.a" \
		".definitions.imgUrl|del(.links)" \
		"corpus/Store/schemastore/src/schemas/json/jasonette.json"

extract "Fig 16.b" \
		'.definitions.possibleErrors.properties."no-unsafe-finally"' \
		"corpus/Store/schemastore-analysis/JSON/JSON_schema_for_ESLint_configuration_files.json"

extract "Fig 16.c" \
		".|del(.title,.properties,.required,.definitions,.description,.type,.anyOf)" \
		"corpus/Store/schemastore-analysis/JSON/Unity_Assembly_Definition.json"

extract "Fig 16.d" \
		".properties.id" \
		"corpus/JSC/JSC_extracts/pp_80381_013.json"

extract "Fig 16.e" \
		'.properties.""' \
		"corpus/JSC/json-schema-corpus/json_schema_corpus/pp_54206.json"

extract "Fig 18" \
		'.|del(.properties[],.definitions,.required)' \
		"corpus/Store/schemastore-analysis/JSON/CryProj_schema.json"

extract "Fig 19.a" \
		'.|del(.allOf,.definitions.foo,.definitions.base_foo.type)' \
		"corpus/Ref/test-suite-extracts/draft4_ref_006.json"

extract "Fig 19.b" \
		'.|del(.additionalProperties,.properties,.definitions.duration,.definitions.loggerLevel,
		 .definitions.transportProtocols,.definitions.namespace,.definitions.hostType,
		 .definitions.hardwareProblemTemplate,.definitions.sequential,.definitions.outputDirectory,
		 .definitions.keyValuePairVariables.patternProperties,
		 .title,.type)' \
		"corpus/Store/schemastore/src/schemas/json/hws-config.json"

extract "Fig 20.a" \
		'."$defs"."r2c-internal-project-depends-on-content".properties."depends-on-either"|del(.properties.package,.required)' \
		"corpus/Store/schemastore/src/schemas/json/semgrep.json"

extract "Fig 20.b" \
		".definitions.notification.properties.recipients|del(.anyOf[].properties)" \
		"corpus/Store/schemastore/src/schemas/json/bamboo-spec.json"

extract "Fig 21.a" \
		'.|del(."$schema")' \
		"corpus/Misc/kubernetes/master-standalone-strict/microtime-meta-v1.json"

extract "Fig 21.b" \
		'.defs.scale.allOf[1].oneOf[0].properties.range.oneOf[3].properties.extent.oneOf[0]' \
		"corpus/Store/schemastore/src/schemas/json/vega.json"

extract "Fig 22" \
		'.definitions."http_sd_configs".items|
		 del(.description,.properties.url."description,format",.required,.additionalProperties,
		 .properties["refresh_interval","basic_auth","authorization","oauth2","bearer_token","bearer_token_file","proxy_url","follow_redirects","tls_config"])' \
		"corpus/Store/schemastore/src/schemas/json/prometheus.json"

extract "Fig 23" \
		'.properties."manifest_version"|del(.description)' \
		"corpus/Store/schemastore-analysis/JSON/JSON_schema_for_Google_Chrome_extension_manifest_files.json"
