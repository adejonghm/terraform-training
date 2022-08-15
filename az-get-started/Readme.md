# Get Started Azure Cloud

This training is dedicated to the Azure Cloud provider, in it, an VNet is created. you can find it in `resources.tf`

## Steps to configure the CLI

In this case, it is necessary to have the `AZURE CLI` installed, to install it following the instructions [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli). Once the CLI is installed, authenticate to Azure with the following command, if using 2FA you need to add the **tenant** option

```sh
az login --tenant "<TenantId>"
```

After successful authentication, your terminal will display your subscription information. Find and select the subscription ID (**id**) of the account in your subscription info, and then set the account with the Azure CLI with the following command

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

### Contact Me

[LinkedIn](https://www.linkedin.com/in/adejonghm/) | [eMail](mailto:dejongh.morell@gmail.com) | [Telegram](https://t.me/adejonghm)
