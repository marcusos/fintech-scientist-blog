# globals
PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME = br_asset_pricing
PYTHON_VERSION_FULL = $(shell python --version 2>&1)
PIP_VERSION_FULL = $(wordlist 1,2,$(shell pip --version 2>&1))

# custom targets

.PHONY: environment
## create environment
environment:
	pyenv install -s 3.9.9
	pyenv virtualenv 3.9.9 fintech-scientist
	pyenv local fintech-scientist

.PHONY: render
## render the website
render:
	quarto render

.PHONY: run
## run the website locally
run:
	quarto preview
