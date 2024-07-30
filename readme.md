# Terraform

1. block terraform
2. provider config


## Usage

```
terraform init

(if not credentials provided, first auth to cloud provider (az login))
terraform plan

terraform apply

terraform destroy

terraform validate

terraform fmt -recursive .

ansible-playbook -i inventories/inventory-azure.yaml playbook-azure.yaml
```
