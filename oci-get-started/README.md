# Get Started Oracle Cloud Infrastructure

This training is dedicated to the Oracle Cloud Infrastructure provider, in it, an VCN instance is created. (`oci_vcn.tf`)

### Steps to configure the CLI.

In this case, it is necessary to have the `OCI CLI` installed, to install it following the instructions [here](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm#InstallingCLI__linux_and_unix). Once the CLI is installed, configure it using the following commands in the terminal:

```sh
oci session authenticate
```

Enter the region where you have an OCI lease. After that, run the same command again to configure the CLI with an additional named profile, in this case we use the name `learn-terraform`.

Terraform will automatically detect the token. The token has a 1-hour Time To Live (TTL). If it expires, refresh it with the command below, providing the profile name.

```sh
oci session refresh --profile learn-terraform
```

### Contact Me

[LinkedIn](https://www.linkedin.com/in/adejonghm/) | [eMail](mailto:dejongh.morell@gmail.com) | [Telegram](https://t.me/adejonghm)
