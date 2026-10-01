terraform-init-backend:
ifndef GITLAB_TOKEN
	$(error GITLAB_TOKEN is undefined)
endif
	terraform init \
		-backend-config="address=https://gitlab.sikalabs.com/api/v4/projects/819/terraform/state/default" \
		-backend-config="lock_address=https://gitlab.sikalabs.com/api/v4/projects/819/terraform/state/default/lock" \
		-backend-config="unlock_address=https://gitlab.sikalabs.com/api/v4/projects/819/terraform/state/default/lock" \
		-backend-config="username=ondrejsika" \
		-backend-config="password=${GITLAB_TOKEN}" \
		-backend-config="lock_method=POST" \
		-backend-config="unlock_method=DELETE" \
		-backend-config="retry_wait_min=5"

generate-docs-for-modules:
	terraform-docs markdown table ./modules/user > modules/user/README.md
