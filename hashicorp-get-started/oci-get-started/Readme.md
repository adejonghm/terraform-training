# Get Started Oracle Cloud Infrastructure

This training is dedicated to the Oracle Cloud Infrastructure provider, in it, a VCN instance is created, you can find it in `oci_vcn.tf`

## Steps to configure the CLI

In this case, it is necessary to have the `OCI CLI` installed, to install it following the instructions [here](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm#InstallingCLI__linux_and_unix). Once the CLI is installed, configure it using the following command

```sh
oci session authenticate
```

Follow the prompts to enter the region where you have OCI tenancy. After that, run the above command again to configure the CLI with an additional named profile, in this case we use the name `learn-terraform`.

The output prints the location where the CLI has stored your token. Terraform will automatically detect the token, this token has a 1-hour Time To Live (TTL). If it expires, refresh it using the command below, providing the profile name.

```sh
oci session refresh --profile learn-terraformo
```

### Contact Me

[LinkedIn](https://www.linkedin.com/in/adejonghm/) | [eMail](mailto:dejongh.morell@gmail.com) | [Telegram](https://t.me/adejonghm)
