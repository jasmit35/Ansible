#
.SILENT:
#
# play_book := "/users/jeff/Ansible/playbooks/install_pgenv.yml"
# play_book := "../devl/TRO/ansible/playbooks/make_directories.yml"
#
validate-playbook:
	printf "\nBeginning the validation for playbook ${PLAYBOOK}...\n"

	printf "\n   Performing syntax check...\n"
	ansible-playbook --syntax-check ${PLAYBOOK}

	printf "\n   Performing yaml linting...\n"
	yamllint ${PLAYBOOK}; \
	if [ $$? -eq 0 ]; \
	then \
		printf "   yaml linting successful!\n"; \
	fi

	printf "\n   Performing ansible linting...\n"
	ansible-lint ${PLAYBOOK} 
	if [ $$? -eq 0 ]; \
	then \
		printf "   ansible linting successful!\n"; \
	fi




