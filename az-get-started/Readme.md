# Get Started Azure Cloud

This training is dedicated to the Azure Cloud provider, in it, an VNet is created. you can find it in `resources.tf`

## Steps to configure the CLI

In this case, it is necessary to have the `AZURE CLI` installed, to install it following the instructions [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli). Once the CLI is installed, authenticate to Azure with the following command, if using 2FA you need to add the **tenant** option

```sh
az login --tenant "<TenantId>"
```

After successful authentication, your terminal will display your subscription information. You can see this information by running this command at any time

```sh
az account list
```

Find and select the subscription ID (**id**) of the account in your subscription info, and then set the account with the Azure CLI with the following command

```sh
az account set --subscription "<SubscriptionId>"
```

Next, use the following command to create a Service Principal, an application within Azure Active Directory (*AAD*) with the authentication tokens Terraform needs to perform actions on your behalf. Using the same **SubscriptionId** specified in the preview step

```sh
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SubscriptionId>"
```

Lastly, set the environment variables, using the information obtained in the previous steps.

### Linux

```sh
export ARM_CLIENT_ID="<APPID_VALUE>"

export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"

export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID_VALUE>"

export ARM_TENANT_ID="<TENANT_ID_VALUE>"
```

### Windows

```Powershell
$Env:ARM_CLIENT_ID = "<APPID_VALUE>"

$Env:ARM_CLIENT_SECRET = "<PASSWORD_VALUE>"

$Env:ARM_SUBSCRIPTION_ID = "<SUBSCRIPTION_ID_VALUE>"

$Env:ARM_TENANT_ID = "<TENANT_ID_VALUE>"
```

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

Finally, set the following environment variables `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID` in the Terraform Cloud (for details, [click here](https://learn.hashicorp.com/tutorials/terraform/azure-remote?in=terraform/azure-get-started#update-the-terraform-cloud-environment-variables)).

Now you are ready to apply these settings, run the `terraform apply` command and wait for the result. This Training Path is available at [link](https://learn.hashicorp.com/collections/terraform/azure-get-started).

### Contact Me

[LinkedIn](https://www.linkedin.com/in/adejonghm/) | [eMail](mailto:dejongh.morell@gmail.com) | [Telegram](https://t.me/adejonghm)
