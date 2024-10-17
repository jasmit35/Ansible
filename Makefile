#
.SILENT:
#
validate-playbook:

	printf "\n\n   Performing syntax check..."
	ansible-playbook --syntax-check ${PLAYBOOK} --extra-vars "nodes=${NODES}"
	if [ $$? -eq 0 ]; \
	then \
		printf "   syntax check successful!\n"; \
	fi

	printf "\n\n   Performing yaml linting...\n"
	yamllint ${PLAYBOOK}; \
	if [ $$? -eq 0 ]; \
	then \
		printf "   yaml linting successful!\n"; \
	fi

	printf "\n\n   Performing ansible linting...\n"
	/opt/homebrew/bin/ansible-lint ${PLAYBOOK}
	if [ $$? -eq 0 ]; \
	then \
		printf "   ansible linting successful!\n"; \
	fi




