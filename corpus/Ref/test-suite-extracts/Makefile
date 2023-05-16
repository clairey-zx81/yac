SHELL	= /bin/bash
.ONESHELL:

generate:
	find ../JSON-Schema-Test-Suite/tests -name '*.json' | \
		xargs -P 8 -L 100 ./json_schema_test_suite_extract.py
