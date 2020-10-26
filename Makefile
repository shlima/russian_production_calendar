.PHONY: help

help:
	@echo 'Available targets:'
	@echo '  make release'

release:
	bin/release.sh
