# ACN Training

Hands-on labs for environment creation

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
