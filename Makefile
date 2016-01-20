DOTFILES := $(shell pwd)

test:
	bash $(DOTFILES)/git/test.sh

default: crossplatform

crossplatform:
	bash $(DOTFILES)/scripts/generic.sh

platform:
	bash $(DOTFILES)/scripts/platform.sh

mac:	crossplatform platform

linux:	crossplatform platform

.PHONY: default crossplatform mac linux
