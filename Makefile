DOTFILES := $(shell pwd)

default: platform crossplatform

crossplatform:
	bash $(DOTFILES)/scripts/generic.sh

platform:
	bash $(DOTFILES)/scripts/platform.sh

.PHONY: default crossplatform platform
