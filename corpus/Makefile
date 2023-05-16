SHELL	= /bin/bash
.ONESHELL:

.PHONY: pull
pull:
	# rename local branch as main!
	git submodule foreach git checkout main
	git submodule foreach git pull
