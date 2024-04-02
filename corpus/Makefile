SHELL	= /bin/bash
.ONESHELL:

.PHONY: pull
pull:
	# rename local branch as main!
	git submodule foreach git checkout main
	git submodule foreach git pull

.PHONY: clean
clean:
	$(RM) schema.list
	$(MAKE) -C OpenAPI clean

# WARNING MacOS find can generate //

.PHONY: openapi
openapi:
	$(MAKE) -C OpenAPI schema

schema.list: openapi
	{ 
	  # Store
	  # argh… stupid files which contain ' characters
	  find ./Store/schemastore-analysis/JSON -name '*.json' -print | sed "s/'/\\\'/"
	  find ./Store/schemastore/src/schemas/json -name '*.json' -print
	  # Ref
	  find ./Ref/json-schema-spec -name '*.json' -print
	  find ./Ref/JSON-Schema-Test-Suite -name '*-schema.json' -print
	  find ./Ref/test-suite-extracts -name '*.json' -print
	  find ./Ref/schemas -name '*.json' -print
	  # Misc
	  find ./Misc/VRAC -name '*.json' -print
	  find ./Misc/apidae -name '*.schema' -print
	  find ./Misc/kubernetes/*-standalone-strict -name '*.json' -print
	  find ./Misc/openAPI/schemas -name '*.json' -print
	  find ./Misc/schema.data.gouv.fr/schemas -name '*.json' -print
	  find ./Misc/sp-simulateurs -name '*.schema.json' -print
	  find ./Misc/washington-post/src -name '*.json' -print
	  find ./Misc/snowplow/schemas -type f -print
	  # ODS
	  find ./ODS -name '*.json' -print
	  # JSC
	  find ./JSC/json-schema-corpus -name '*.json' -print
	  find ./JSC/JSC_extracts -name '*.json' -print
	  # OpenAPI
	  find ./OpenAPI -name '*.schema.json' -print
	} | sort -d > $@
