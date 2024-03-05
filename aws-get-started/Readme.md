# AWS Get Started

This is a HashiCorp Get Started training. In it, an EC2 instance is created, and you can see its declaration in the following file `aws_instance.tf`

Two types of authentication are used in this training.

## Using the profile configs for AWS

In this case, it is necessary to have the `AWS CLI` installed, to install it following the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html). Once the CLI is installed execute the following command

```sh
aws configure --profile <profile_name>
```

This command line will prompt you for the `AWS_ACCESS_KEY` and `AWS_SECRET_ACCESS_KEY`. These values are not persistent, they are valid only for the session in which this command is executed. The **<profile_name>** can be any, chosen by you. After that, use this **<profile_name>** in the provider block of the `provider.tf` file, as follows:

```terraform
profile = "<profile_name>"
```

## Using environment variables

For this training, we recommend using this type of authentication since you do not need to install the `AWS CLI`. You can define these environment variables as follows:

### Linux

```sh
export AWS_ACCESS_KEY_ID="<key_ID>"

export AWS_SECRET_ACCESS_KEY="<secret_key_ID>"
```

### Windows

```Powershell
$Env:AWS_ACCESS_KEY_ID = "<key_ID>"

$Env:AWS_SECRET_ACCESS_KEY = "<secret_key_ID>"
```

If you use this way, the values of the variables are not persistent over time, to make them persist, you must define them as environment variables of the OS, which is recommended. There are another way to store the `access_key` and `secret_key` values, directly in the Terraform code as plain text, which is not highly recommended.

One way to store sensitive information in terraform projects is by using `.tfvars` files which by default are ignored by almost every Version Control System (*VCS*). This is not the best way to keep sensitive information safe, but it is an option, since those files are stored locally.

## Using Terraform Cloud to store the State file

The first thing you need to do is create an account on [Terraform Cloud](https://app.terraform.io/public), after that, add the `cloud{}` block in the `terraform` block, you can see an example of this code in the **Terraform Cloud** page. Next, you need to authenticate with Terraform Cloud by running the command below and following the prompts to log in.

```sh
terraform login
```

Once successfully logged in, migrate the state file by running the following command

```sh
terraform init
```

After everything is finished successfully, delete the `terraform.tfstate` by running

```sh
rm -f *.tfstate*
```

Finally, set the following environment variables `access_key` and `secret_key` in the Terraform Cloud (for details, [click here](https://learn.hashicorp.com/tutorials/terraform/aws-remote?in=terraform/aws-get-started#set-workspace-variables)).

Now you are ready to apply these settings, run the `terraform apply` command and wait for the result. This Training Path is available at [link](https://learn.hashicorp.com/collections/terraform/aws-get-started).

### Contact Me

[LinkedIn](https://www.linkedin.com/in/adejonghm/) | [eMail](mailto:dejongh.morell@gmail.com) | [Telegram](https://t.me/adejonghm)
