.DEFAULT_GOAL:=help

.PHONY: help
help: ## show help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST)|awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

awsInit: ## terraform initialize
	terraform init;

# example
applyExampleGlobal: ## apply global plan for example
	$(call terraform-apply,example,global)

destroyDreampayGlobal: ## destroy global plan for exampoe
	$(call terraform-destroy,example,global)

# dreampay
applyDreampayGlobal: ## apply global plan for dream pay
	$(call terraform-apply,dreampay,global)

destroyDreampayGlobal: ## destroy global plan for dream pay
	$(call terraform-destroy,dreampay,global)

clear: ## remove tfstate
	rm -rf aws/tfstate/**/*.tfstate

define terraform-apply
    @terraform apply -state=$1/$2/$2.tfstate $1/$2
endef

define terraform-destroy
    @terraform destroy -state=$1/$2/$2.tfstate $1/$2
endef

