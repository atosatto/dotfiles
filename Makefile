DOTFILES := $(shell pwd)

default: all

all:
	@$(DOTFILES)/scripts/setup.sh

.PHONY: default all
