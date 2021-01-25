
.PHONY: help
help: 	## This help message
	@echo -e "usage: make [target]\n\n"
	@echo -e "targets:\n"
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"


.PHONY: test
test: 	## run tests
	@pytest --doctest-modules --junitxml=junit/test-results.xml --cov=src --cov-report=xml --cov-report=html

.PHONY: checkstyle
checkstyle: 	## run checkstyle
	@flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
	@flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics

.PHONY: venv
venv:  	## create virtual environment
	@python -m venv venv

.PHONY: deps
deps:  	## install dependencies
	@python -m pip install --upgrade pip
	@pip install -r requirements.txt

.PHONY: dev-deps
dev-deps:  	## install dev dependencies
	@pip install flake8 pytest pytest-cov
