SHELL	= /bin/bash
.ONESHELL:

.PHONY: wget
wget:
	wget -X /assets/,/scdl/,/etalab/ -r https://schema.data.gouv.fr/schemas/
	$(RM) -rf schema.data.gouv.fr/{scdl,etalab} schema.data.gouv.fr/robots.txt
	find schema.data.gouv.fr/ -name '*.html' -print | xargs  $(RM)
