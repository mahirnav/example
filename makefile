.PHONY:all
all:| format ci

.PHONY:ci
ci:| lint check test

.PHONY:install
install: .venv

.venv:
	pdm install

.PHONY:format
format: install
	pdm run ruff format

.PHONY:lint
lint: install
	pdm run ruff check

.PHONY:check
check: install
	pdm run mypy .

.PHONY:test
test: install
	pdm run pytest

.PHONY:clean
clean:
	git clean -dfX
