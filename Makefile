DOTFILES := $(shell pwd)

all: crossplatform

crossplatform:
		sh $(DOTFILES)/script/generic.sh

platform:
		sh $(DOTFILES)/script/platform.sh

mac:	crossplatform platform

linux:	crossplatform platform

.PHONY: all crossplatform mac linux
