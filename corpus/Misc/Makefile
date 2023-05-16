SHELL	= /bin/bash
.ONESHELL:

.PHONY: wget
wget:
	wget -X /assets/,/scdl/,/etalab/ -r https://schema.data.gouv.fr/schemas/
	$(RM) -rf schema.data.gouv.fr/{scdl,etalab}
