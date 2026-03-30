# Uploading Image

If you want to test this laboratory, you must install the **Azure CLI** following these [instructions](https://learn.microsoft.com/pt-br/cli/azure/install-azure-cli).

After **Azure CLI** is installed, use this command.

```azurecli
az storage blob upload -f terraform-logo.jpg --blob-url '<blob_url>/terraform-logo.jpg<sas_token>'
```

> :warning: Warning <br/>
Replace the **<blob_url>** for your Blob URL output and the **<sas_token>** for your SAS Token output.
