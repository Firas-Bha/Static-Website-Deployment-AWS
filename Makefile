

# Variables
TERRAFORM_DIR=.   # Répertoire contenant les fichiers Terraform
AWS_PROFILE=default         # Profil AWS à utiliser
AWS_REGION=eu-central-1        # Région AWS par défaut

build:
	@echo "Building the Docker image..."
	docker build -t $(DOCKER_IMAGE) .

init:
	@echo "Initializing Terraform..."
	cd $(TERRAFORM_DIR) && terraform init

plan:
	@echo "Planning Terraform changes..."
	cd $(TERRAFORM_DIR) && terraform plan 

apply:
	@echo "Applying Terraform changes..."
	cd $(TERRAFORM_DIR) && terraform apply 

destroy:
	@echo "Destroying Terraform resources..."
	cd $(TERRAFORM_DIR) && terraform destroy 

.PHONY: init plan apply destroy clean help
