# Terraform TFstates storage account

The problem with the initial terraform run is that it requires tfstates backend bucket to be present, there are usually two ways of fixing that problem.

1. Creating tfstates storage manually as the only manual thing created in a cloud
2. Create tfstates storage via terraform with backend section commented out and when created using by terraform apply, the section can be uncommented and then terraform will ask if local tfstate needs to be copied over to new backend path.
