#
.SILENT:
#

#==========================================================================================

.PHONY: yaml-lint
yaml-lint:
	printf "\n\n   Performing yaml linting on ${PLAYBOOK} ...\n"
	yamllint ${PLAYBOOK}; \
	if [ $$? -eq 0 ]; \
	then \
		printf "   yaml linting successful!\n"; \
	fi

#==========================================================================================

.PHONY: syntax-check
syntax-check:
	printf "\n\n   Performing syntax check...\n"
	ansible-playbook --syntax-check ${PLAYBOOK} --extra-vars "HOSTS=${HOSTS}"
	if [ $$? -eq 0 ]; \
	then \
		printf "   syntax check successful!\n"; \
	fi

#==========================================================================================

.PHONY: ansible-lint
ansible-lint:
	printf "\n\n   Performing ansible linting...\n"
	/opt/homebrew/bin/ansible-lint ${PLAYBOOK}
	if [ $$? -eq 0 ]; \
	then \
		printf "   ansible linting successful!\n"; \
	fi

#==========================================================================================

HOSTS := "test-server"

verify-pgenv: PLAYBOOK := "./install_pgenv.yaml"
verify-pgenv: yaml-lint syntax-check ansible-lint

verify-pyenv: PLAYBOOK := "./install_pyenv.yaml" 
verify-pyenv: yaml-lint syntax-check ansible-lint


