# Fundamentals

## The Terraform Workflow

**WRITE**: This typically starts with creating a Git repository, commonly on the GitHub platform, where you store your Terraform code.

**PLAN**: This is when you review the changes your code will make. This is a required step in the workflow because you're not deploying any infrastructure yet, but you can see in detail what changes your code will make. If you need to make any changes, you can modify the code and thus avoid creating resources with errors.

**APPLY**: After reviewing your plan and confirming everything is correct, you will be ready to create the resources in the cloud.

```mermaid
flowchart LR
  W("WRITE"); P(PLAN); A(APPLY)
  W ---> P ---> W
  P --> A  
```

## Initializing the Working Directory

In **AWS**, create a user (*terraform*) via **IAM** and then attach **AdministratorAccess** as access policies. After creating the user, add the access credentials in the **Security Credentials** tab using the **Access Key** area. Select the **Command Line Interface (CLI)** option to create these *access_key* and *secret*. Finally, you must declare this *access_key* and *secret* as environment variables.

```sh
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

In **Azure**, use **Microsoft Entra ID** to register a new application. In Microsoft Entra ID, go to the App Registration menu and create a new record. Finally, you must declare this information as environment variables.

```sh
export ARM_CLIENT_ID= Application (client) ID
export ARM_TENANT_ID= Directory (tenant) ID
export ARM_SUBSCRIPTION_ID= Subscription/Subscription ID
export ARM_CLIENT_SECRET= Certificates and Secrets (value)
```

To start a Terraform project, you need to [install Terraform](https://developer.hashicorp.com/terraform/downloads) on your computer and, after installation, use the `init` command. This is a critical command for any project, as it prepares everything needed for your project work. After writing the initial Terraform files, you should run this command in the same folder where you placed your files.

### Reconfigure

This command restart initial configurations including backend configurations, Terrform modules downloads and other.

```sh
terraform init -reconfigure
```

### Migrate State

This command is used to migrate the existing **state** to a new location. There is another option to migrate the state, which would be to use the `-force-copy` subcommand.

```sh
terraform init -migrate-state
```

### Backend config

With this command, we can use dynamic **states** for different environments. For this, the **backend block** within the `main.tf` file must be empty, and the configuration is placed in separate files to specify different paths and avoid overwriting the **state** of one environment with another.

```sh
terraform init -backend-config=<backend-config-file>
```

### Terraform Block

**Parameters:**

- `require_version` -> Used to define the Terraform version for your project/code.
- `require_provider` -> Used to define the provider(s) that you will use in your project.
- `backend` -> Used to configure where the `*.tfstate` file is saved.
- `cloud` -> Used to configure Terraform Cloud.
- `experiments` -> Used to test beta Terraform features.
  
In **AWS**, it is possible to define `tags` by default for all created resources within the `provider` block using the sub-block `default_tags = {}`.

On the other hand, to define tags by default in **Azure**, you have to define a file called `locals.tf` with the following structure:

```terraform
locals {
  common_tags = {
    key_name-1 = "value"
    key_name-2 = "value"
  }
}
```

The command below will download the auxiliary components (modules and plugins) necessary for your code to work and store them in the `.terraform` folder that will be created automatically when the command is executed. These modules and plugins provide the libraries that allow you to interact, through API calls, with whatever infrastructure you are deploying, whether cloud or on-premises. The upgrade option forces the command to download the latest version of the plugins even when the `.terraform` folder already exists.

```sh
terraform init -upgrade
```

Additionally, this command verifies and configures the Terraform Backend. The backend defines where Terraform stores its `.state` files. Terraform uses the `.state` file to keep track of the resources it manages. Most non-trivial Terraform configurations integrate with Terraform Cloud or use a backend to store the `.state` file remotely. This lets multiple people access the state files and work together on that collection of infrastructure resources.

If the backend configurations are not defined, the `.state` file will be stored locally on your computer, which is not a good practice to work collaboratively on the same project or infrastructure.

### Alternative

If you don't want to install Terraform on your computer, you can run it inside a container (e.g., [Docker](https://docs.docker.com/get-started/)), which makes it easy to work with different versions of Terraform for multiple projects.

```sh
docker run -it -v /path-of-the-files:/app -w /app --entrypoint ""  hashicorp/terraform:light sh
```

When using a container to execute the Terraform CLI, we must use volumes to access the Terraform files within the container where we run the CLI. That's why we used the `-v` parameter in the example above.

## Plan

```sh
terraform plan -out <name_plan_file>
```

The `-out` parameter allows us to save the Plan execution to a local file, so we guarantee that when we run the Apply command, we will execute exactly as planned. This is a HashiCorp recommendation.

### Other Alternative

These alternatives can be used with Plan or Apply command.

`--replace=value`: serves to indicate to Terraform that a specific resource will be replaced (destroyed and then rebuilt). This flag cannot be used together with the -destroy flag

`-target=value`: serves to apply changes to a specific Terraform block. This command is recommended in exceptional situations.

## Apply

```sh
terraform apply

terraform apply <name_plan_file>

terraform apply -auto-approve

terraform apply -destroy
```

The `terraform destroy` command is an alias for `terraform apply -destroy`, and for that reason, they both perform the same action.

## Other commands

```sh
terraform console  -> "open an interactive terraform console."

terraform fmt -recursive -> "format all files found in sub-folders."

terraform fmt -check -> "show a list of all files that are not formatted."

terraform fmt -diff -> "shows the alterations made to the code."

terraform output -> "display the defined output in the terminal."

terraform output -raw <output-name> -> "display the value of the specified output."

terraform plan -destroy

terraform providers -> "show a list with all the providers used in the project/code."

terraform refresh -> "performs an update of the configurations made manually, in the *.tfstate file."

terraform show <file-name> -> "Show content of this file."

terraform show -> "Show content of the State file."

terraform get -> "Download and update modules mentioned in the root module."
```

## Resources

The resource is the most important element in the HCL language. The resource block is where the characteristics of the infrastructure element are described.

```terraform
resource "<resource_type>" "<resource_local-name>" {
  Arguments
}
```

One of the arguments that you can use is `tags = {}`. When you define a **Name** tag with a capital letter using the AWS *provider*, this tag is used as the resource name in the *AWS Management Console*.

### Special block

**time_sleep**: is a special block that is used to generate a specific time delay between resource creation.
<https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep.html>

### Meta Arguments

**depends_on**:

This meta argument is used to handle hidden resource or module dependencies that Terraform cannot automatically infer.

**count:**
This meta argument is used to create as many copies of a block as you want. This meta argument cannot be used with the `for_each` meta argument in the same block. If you want to give different names for each instance that you create, you can use the `count.index` variable as follows:

```terraform
resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  tags = {
    Name = "Server ${count.index}"
  }
}
```

**for_each:**

This meta argument is used to create copies of a resource and you can use it over maps or sets of strings. To access the iterated elements, `each.key` is used to access the keys, and `each.value` is used to obtain the values of the keys. If what you are iterating is a resource, `each.value.<field_name>` is used to access the resource's fields.

```terraform
resource "azurerm_storage_account" "storage-account" {
  for_each = azurerm_storage_account.resource-group
  resource_group_name      = each.value.name
}
```

The difference between `for_each` and `count` is that with `for_each` we can make copies of blocks in a more advanced way. This meta argument cannot be used with the `count` meta argument in the same block.

**lifecycle:**

This meta argument can only be used in the resource block. This meta argument has arguments like `create_before_destroy`, `prevent_destroy`, `ignore_changes`, `replace_triggered_by`.

## Types and Expressions

- **List (or Tuple)**: a sequence of values, like ["us-west-1a", "us-west-1c"]. Identify elements in a list with consecutive whole numbers, starting with zero.
- **Map (or Object)**: a group of values identified by named labels, like {name = "Mabel", age = 52}.
- **Data Source** is like a variable, but the difference is that the values attributed to it are defined outside of Terraform, by another separate Terraform configuration, or modified by functions. A data source is accessed via a special kind of resource known as a `data` resource.

## Multiple Provider Configurations

You can optionally define multiple configurations for the same provider, and select which one to use on a per-resource or per-module basis. The primary reason for this is to support multiple regions for a cloud platform.

A `provider` block without an `alias` argument is the *default* configuration for that provider. Resources that don't set the `provider` meta-argument will use the default provider configuration that matches the first word of the resource type name.

For multi-regions, it is necessary to define a new provider block with the other region and define the `alias` parameter in the new block. Once defined, use the meta parameter `provider = <provider name>.<alias>` in the resource declaration block.

## Variables and Outputs

For Terraform to establish communication with the provider through the CLI, it is necessary to define the *Access Credentials*. It is a good practice to define these credentials as environment variables to avoid publishing them in version control repositories and to have an extra layer of security in our projects. To declare these environment variables, you can use an external file that is referenced within the `provider` block using the `shared_credentials_files`.

Each input **variable** must be declared using a **variable block**:

```tf
variable "<variable_name>" {
  arguments....
}
```

Terraform CLI defines the following optional arguments for variable declarations:

- **default** -> This is the default value that the variable will have if another is not defined later (string, number, bool).
- **type** -> This argument specifies what value types are accepted for the variable.
- **description** -> This specifies the input variable's documentation.
- **validation** -> A block to define validation rules, usually in addition to type constraints.
- **sensitive** -> This argument defines the variable as sensitive or confidential and does not display the value in the **Output**.
- **nullable** -> Specifies if the variable can be null within the module.

Terraform loads the variables in the following order, with 1 being the lowest precedence and 6 being the highest precedence:

1. The `variables.tf` file, if present.
2. Environment variables
3. The `terraform.tfvars` file, if present.
4. The `terraform.tfvars.json` file, if present.
5. Any `*.auto.tfvars` or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
6. Any `-var` and `-var-file` options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

The **Output** values make information about your infrastructure available on the command line and can expose information for other Terraform configurations to use.

```tf
output "<output_name>" {
  value = <resource_type>.<resource_name>.<argument>
}
```

## Provisioners (AWS)

Provisioners allow the execution of various commands or scripts on either local or remote machines, and they can also transfer files from a local environment to a remote one.

There are three available provisioners: `file` (used for copying), `local-exec` (used for local operations), `remote-exec` (used for remote operations). **HashiCorp/Terraform** recommends using provisioners as a **LAST OPTION** to perform that task since when using provisioners, **Terraform** has no control over the **State File**. You should always exhaust all options provided by Terraform before using provisioners. When you use `file` or `remote-exec`, creating a **Provisioner Connection Block** is mandatory.

The provisioning block will always be placed inside the resource we are creating.

<https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax>

## Module

To use local modules in Terraform, create a folder in the root project with your `*.tf` files inside. When you work with modules, you can define the variables using a `variables.tf` file in the module folder but can't assign a default value. As shown below, variables defined within modules must be assigned the values in the module block definition.

```tf
module "<module_name>" {
  #...

  variable-A = ""
  variable-N = ""
}
```

On the other hand, to show the outputs of the modules, it is necessary to declare in the `outputs.tf` an output block for each of the output variables declared in the module.

```tf
output "<output_name>" {
  value = module.<module-name>.property
}
```

You can also create resources in the root module using information from the child module as long as this information is declared via output.

```tf
resource "aws_elb" "example" {
  # ...
  instances = module.<module_name>.<output_name>
}
```

[Modules Documentation](https://developer.hashicorp.com/terraform/language/modules/syntax)

## Backend, State & Locking

A backend defines where Terraform stores its [State](https://developer.hashicorp.com/terraform/language/state) data files. This *state* is stored by default in a local file named `terraform.tfstate`, but we recommend storing it remotely or in Terraform Cloud to version, encrypt, and securely share it with your team.

Some of these backends act as simple remote disks to store *state* files, but others allow *State* to be locked while operations are performed, which helps prevent conflicts and inconsistencies. This locking happens automatically on all operations that could write state. The file `terraform.tfstate.lock.info` has information about the state of Terraform, even the user who is currently running it.

There is a command that allows you to forcibly unlock the `state`. This command can be used, for example, if the remote connection is lost when `terraform apply` is running. When we try a new `terraform plan`, it will show an error because the `state` is locked. The lock ID should appear in the error displayed when trying to execute a `state` that is running. To unlock the state, use the following command:

```sh
terraform force-unlock <lockID>
```

Some backend configurations can be passed when executing the `init` command. For that, you use the `-backend-config="key=value"` parameter. This configuration is independent for each provider.

Terraform must store *State* about your managed infrastructure and configuration. This *state* is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

Terraform uses *state* to determine which changes to make to your infrastructure. Prior to any operation, Terraform does a refresh to update the *state* with the real infrastructure.

### Subcommands

```sh
terraform state <subcommand> -> Command responsible for manipulating the tfstate file.
```

- `pull` -> Brings all the information from the *tfstate* file wherever it is stored remotely.

- `push` -> Updates some local modifications of the state file, where it is stored remotely. Following the same idea of Git. When entering the remote state store, it is mandatory to use the -force flag, otherwise the push cannot be performed.

- `list` -> Lists the resources within the *tfstate*.

- `rm` -> Delete resources within the *tfstate*. This is not highly recommended because after deleting a resource within the *tfstate*, you lose control over that resource, but it is not deleted from the infrastructure and provider, and when you run a new plan, Terraform will try to create that resource again. If you delete that resource from the *tfstate* and the code, you lose control over that resource, but it is still running on the infrastructure.

- `mv` -> Move resources around within the project, e.g., you can move a resource from one module to another. It can be used to rename resources inside the Terraform code, or what is the same, within the *tfstate* (this is not recommended).

- `replace-provider <current_provider> <new_provider>` -> You can change or replace the provider in the tfstate, using this command.

- `show <resource_name>` -> Show the information about that resource.

Whenever the `terraform destroy` command is executed, the structure where the searched file is stored can be deleted. To avoid this problem, the `-lock=false` flag is used to avoid destroying the infrastructure where the searched file is located. This `-lock=false` flag can also be used in the `terraform plan` command to skip validation, that is, avoid conflicts.

**Note**: Whenever any modification is made to the backend, it is mandatory to execute the `init` command.

## Import

This command adds existing resources in the infrastructure to be managed by Terraform. For these cases, two aspects are needed:

1. Create the Terraform code block that recreates the running resource you want to import.
2. Import this resource into the state file.

Example of the `import` command in the AWS provider:

```sh
terraform import <aws_resource_type>.<resource_name> <aws_resource_id>
```

- `<aws_resource_type>.<resource_name>` is the name of the resource in the Terraform code.

- `<aws_resource_id>` is the ID of the resource that is running on the infrastructure. You can use the resource name instead.

<https://developer.hashicorp.com/terraform/cli/commands/import>

## Expressions

A **Conditional Expression** uses the value of a boolean expression to select one of two values. The syntax of a conditional expression is as follows:

```terraform
condition ? true_val : false_val
```

Where, if the condition is true, the result is `true_val`, otherwise the result is `false_val`.

The **For expression**

A `for` expression's input (given after the `in` keyword) can be a list, a set, a tuple, a map, or an object. The type of brackets around the expression decides what type of result it produces. To get a tuple as a result, use `[` and `]`, however, if you use `{` and `}`, the result will be an object and you must provide two result expressions that are separated by the `=>` symbol:

```terraform
[for s in var.list : upper(s)]

[for index, value in var.list : "${index} is ${value}"]

{ for key, value in var.list : key => value.id}
```

The **Dynamic Blocks**

Dynamic blocks allow us to construct repeatable nested blocks within a resource with custom values for each of the different nested blocks, for example, ingress, where we can define different cidr_blocks. These blocks work like the `For` expression, but generate nested blocks rather than complex objects.

Dynamic blocks can iterate over maps or lists. As in `for_each`, dynamic blocks allow access to information using `keys` and `values` words, and the **"iterator name"** instead of the `each` word.

The iterator argument (optional) sets the name of a temporary variable that represents the current element of the complex value. If omitted, the name of the variable defaults to the label of the dynamic block.

```terraform
resource "azure-****" "name" {
  dynamic "dynamic_name (Iterator)" {
    for_each = var.variable_name
    content {
      name = dynamic_name.value["name"]
      port = dynamic_name.key
    }
  }
}
```

The **Terraform Console**

This command provides an interactive command-line console for evaluating and experimenting with expressions. You can use it to test interpolations before using them in configurations and to interact with any values currently saved in state. If the current state is empty or has not yet been created, you can use the console to experiment with the expression syntax and built-in functions. If remote state is used by the current backend, Terraform will read the state for the current workspace from the backend before evaluating any expressions. The `console` locks the state, and you cannot use other actions that modify the state while the console is in use.

The **Built-in Function**

They are a set of predefined Terraform functions that you can call from expressions to transform and combine values within your code.

[Conditional Expression Documentation](https://developer.hashicorp.com/terraform/language/expressions/conditionals) |
[For Expression Documentation](https://developer.hashicorp.com/terraform/language/expressions/for) |
[Comparison Operators](https://developer.hashicorp.com/terraform/language/expressions/operators) |
[Dynamic Blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks) |
[Terraform Console](https://developer.hashicorp.com/terraform/cli/commands/console) |
[Built-in Functions](https://developer.hashicorp.com/terraform/language/functions)

## Workspaces CLI

Workspaces in the Terraform CLI refer to separate instances of **state data** inside the same Terraform working directory. They are distinctly different from workspaces in HCP Terraform, which each have their own Terraform configuration and function as separate working directories.

Workspaces cannot be used when we require different credentials for each workspace we will use, where we provision our resources.

For local state, Terraform stores the workspace states in a directory called `terraform.tfstate.d`. This directory should be treated similarly to local-only `terraform.tfstate`. Some teams commit these files to version control, but we recommend using a remote backend instead when there are multiple collaborators.

By default, Terraform creates the default workspace and you can create a new one using the new command (`terraform workspace new <wk-name>`). You cannot delete the active workspace, to do that, you can switch (`terraform workspace select <wk-name>`) to another workspace to delete the other one (`terraform workspace delete <wk-name>`).

[Workspaces](https://developer.hashicorp.com/terraform/cli/commands/workspace) |
[Backends allow the use of workspaces](https://developer.hashicorp.com/terraform/language/state/workspaces)

## Documentation

- [Official Documentation](https://developer.hashicorp.com/terraform/docs)
- [Official AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
