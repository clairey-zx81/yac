SHELL	= /bin/bash
.ONESHELL:

.PHONY: wget
wget:
	wget -X /assets/,/scdl/,/etalab/ -r https://schema.data.gouv.fr/schemas/
	$(RM) -rf schema.data.gouv.fr/{scdl,etalab}

.PHONY: pull
pull:
	# rename local branch as main!
	git submodule foreach git checkout main
	git submodule foreach git pull
