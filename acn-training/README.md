# ACN Training

Hands-on labs for environment creation

## Initializing Terraform

To initialize terraform, run the command below inside the project folder:

```sh
terraform init
```

The `.terraform` folder will be created after startup containing all necessary plugins.

## Planning Infrastructure with Terraform

To validate the features that will be implemented, run the command below:

```sh
terraform plan
```

## Applying Infrastructure with Terraform

To implement the provisioned resources, run the command below:

```sh
terraform apply
```

**A confirmation for implementation will be requested

## Refresh the State file

When running the command below, it scans the provider and validates changes made manually outside of terraform and updates the State file with these changes.

```sh
terraform apply -refresh-only
```
