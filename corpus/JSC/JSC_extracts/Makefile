SHELL	= /bin/bash
.ONESHELL:

generate:
	find ../json-schema-corpus/json_schema_corpus -name '*.json' -print | \
	  xargs -P 8 -L 1000 ../json_schema_extract.py
