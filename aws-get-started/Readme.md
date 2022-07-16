# Get Started AWS

This training is dedicated to the AWS provider, in it, an EC2 instance is created. (`aws_instance.tf`)

Two types of authentication are used in this training.

### Using the profile configs for AWS.

In this case, it is necessary to have the `AWS CLI` installed, to install it following the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html). Once the CLI is installed execute the following command in the terminal:

```sh
aws configure --profile <profile_name>
```

This command line will prompt you for the `AWS_ACCESS_KEY` and `AWS_SECRET_ACCESS_KEY`. These values are not persistent, they are valid only for the session in which this command is executed. The profile_name can be any, chosen by you. After that, use this profile_name in the provider block of the `provider.tf` file, as follows:

```terraform
profile = "<profile_name>"
```

### Using environment variables

For this training, we recommend using this type of authentication since you do not need to install the `AWS CLI`. You can define these environment variables as follows:

#### Linux

```sh
export AWS_ACCESS_KEY_ID="<key_ID>"

export AWS_SECRET_ACCESS_KEY="<secret_key_ID>"
```

#### Windows

```Powershell
$Env:AWS_ACCESS_KEY_ID = "<key_ID>"

$Env:AWS_SECRET_ACCESS_KEY = "<secret_key_ID>"
```

If you use this way, the values of the variables are not persistent, for the variables to persist over time you must create those variables together with the environment variables of the operating system, which is recommended. There is another way to store the `access_key` and `secret_key` values, to store them directly in the Terraform code as plain text, which is not highly recommended. We use this option for this lab because we create temporary environments on AWS, with a maximum lifetime of 4 hours. If you want to do this Training Path, follow this [link](https://learn.hashicorp.com/collections/terraform/aws-get-started).

### Contact Me

[LinkedIn](https://www.linkedin.com/in/adejonghm/) | [eMail](mailto:dejongh.morell@gmail.com) | [Telegram](https://t.me/adejonghm)
