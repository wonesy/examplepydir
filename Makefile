PY_EXE := /usr/local/bin/python3

FRUIT_DIR := fruit/
FRUIT_PY_FILES := $(shell find $(FRUIT_DIR)/src/fruit -type f -name '*.py')
FRUIT_OUT := $(FRUIT_DIR)dist/fruit-$(shell grep '^version' $(FRUIT_DIR)/setup.cfg | cut -d' ' -f3)-py3-none-any.whl

SERVER_DIR := server/
SERVER_PY_FILES := $(shell find $(SERVER_DIR)/ -type f -name '*.py')

debug:
	@echo $(FRUIT_OUT)

fruit: $(FRUIT_OUT)

$(FRUIT_OUT): $(FRUIT_PY_FILES) $(FRUIT_DIR)/setup.cfg $(FRUIT_DIR)/pyproject.toml
	$(PY_EXE) -m build $(FRUIT_DIR)

server: $(FRUIT_OUT) $(SERVER_PY_FILES) $(SERVER_DIR)/Pipfile
	@cd $(SERVER_DIR); rm -rf Pipfile.lock; pipenv install
	@cd $(SERVER_DIR); pipenv run python server.py


.PHONY: clean
clean:
	@rm -rf $(FRUIT_DIR)/{dist,__pycache__}