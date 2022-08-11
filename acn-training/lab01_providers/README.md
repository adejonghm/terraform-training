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

## Connecting to AWS

To connect to AWS, use one of the options below:

### a) Profile configuration

```sh
aws configure --profile "<profile_name>"
```

### b) IAM Role configuration

```sh
aws sts assume-role --role-arn arn:aws:iam::<aws-account-id>:role/<iam-role-name> --role-session-name "<session-name>" --profile <profile-name> --output json
export AWS_ACCESS_KEY_ID=<access-key-id>
export AWS_SECRET_ACCESS_KEY=<secret-key-id>
export AWS_SESSION_TOKEN=<session-token>
```
