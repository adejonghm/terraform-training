# Fundamentals


tfvars es para definir valores predeterminados de variables

Parametros del bloque terraform
 - require_version
 - require_provider
 - backend
 - cloud -> para configurar TF Cloud
 - experiments -> para testear features do TF en beta
 - provider_meta -> 

AWS permite definir tags predeterminadas dentro del bloque provider, usando el bloque `default_tags = {}`. En Azure no es posible usar el bloque `default_tags = {}` dentro de bloque providers, por tanto para definir tags comunes para varios recursos, se puede usar los `locals.tf`.

## The Terraform Workflow

**WRITE**: This would typically start with creating a git repository, commonly the GitHub platform, where you put your Terraform code.

**PLAN**: This is the time when you review the changes your code will make. This is a required step in this workflow because you're not deploying any infrastructure yet, but you can see in detail what changes your code will make. If you need to make any changes, you can alter the code and thus avoid creating resources with errors.

**APPLY**: After reviewing your plan and everything is ok, you will be ready to create the resources in the cloud.

```mermaid
flowchart LR
  W("WRITE"); P(PLAN); A(APPLY)
  W ---> P ---> W
  P --> A  
```

## Initializing the Working Directory

**AWS**
Agregar usuario via IAM terraform y después adjuntar las politicas de accesso AdministratorAccess
Despues de creado, crear las credenciales de acceso en la pestaña credenciales/access keys

```sh
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

**Azure**
Buscar el servicio Entra ID, despues entrar en el menú App Registration. Luego creamos un nuevo registro, una vez creado, copiar los datos.

```sh
export ARM_CLIENT_ID= Application (client) ID
export ARM_TENANT_ID= Directory (tenant) ID
export ARM_SUBSCRIPTION_ID= Subscription/Subscription ID
export ARM_CLIENT_SECRET= Certificates and Secrets (value)
```

To start a Terraform project, you need to [install Terraform](https://developer.hashicorp.com/terraform/downloads) on your computer and, after installation, use the `init` command. This is a critical command for any project, as this is the tool that gets everything ready for your project work. After writing the initial Terraform files, you should run this command in the same folder where you placed your files.

Arreglar la redacion

### Terraform Block

**Parameters:**

- require_version -> It's used to define the Terraform version of your project/code.
- require_provider -> It's used to define the provider(s) that you will use in your project.
- backend -> It's used to configure where the `*.tfstate` file is saved.
- cloud -> It's used to configure Terraform Cloud.
- experiments -> It's used to test beta Terraform features.
- provider_meta

```sh
terraform init -upgrade
```

This command will download the auxiliary components (modules and plugins) necessary for your code to work and store them in the `.terraform` folder that will be created automatically when the command is executed. These modules and plugins provide the libraries that allow you to interact, through API calls, with whatever infrastructure you are deploying, whether cloud or on-premises. The upgrade option forces the command to download the latest version of the plugins even when the `.terraform` folder already exists.

Additionally, this command verifies and configures the Terraform Backend. The backend defines where Terraform stores its `.state` files. Terraform uses the `.state` file to keep track of the resources it manages. Most non-trivial Terraform configurations integrate with Terraform Cloud or use a backend to store the `.state` file remotely. This lets multiple people access the state files and work together on that collection of infrastructure resources.

If the backend configurations are not defined, the `.state` file will be stored locally on your computer, which is not a good practice to work collaboratively on the same project or infrastructure.

### Alternative

If you don't want to install Terraform on your computer, you can run it inside a container (e.g., [Docker](https://docs.docker.com/get-started/)), which makes it easy to work with different versions of Terraform for multiple projects.

```sh
docker run -it -v /path-of-the-files:/app -w /app --entrypoint ""  hashicorp/terraform:light sh
```

When we use a container to execute the Terraform CLI, we must use volumes to access the Terraform files within the container where we run the CLI. That's why we used the `-v` parameter in the example above.

## Plan

```sh
terraform plan -out <name_plan_file>
```

The `-out` parameter allows us to save the Plan execution to a local file, so we guarantee that when we run the Apply command, we will execute exactly as planned. This is a HashiCorp recommendation.

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
terraform console -> open an interactive terraform console.

terraform fmt -recursive -> format all files found in sub-folders

terraform fmt -check -> show a list of all files that are not formatted

terraform fmt -diff -> shows the alterations made to the code

terraform output -> display the defined output in the terminal.

terraform output -raw <output-name> -> display the value of the specified output

terraform plan -destroy

terraform providers -> show a list with all the providers used in the project/code

terraform refresh -> performs an update of the configurations made manually, in the *.tfstate file

terraform show <file-name> -> Show content of the file.
```

## Resources

Hablar de la estructura de los recursos y algunso argumentos escciales

cuando se coloca la tag **Name**, en mayúscula, ese es el nombre que se le asigna al recurso en la Console Management de AWS.

### Arguments

- `count` -> Defines the number of replicas of that resource.

## Types and Expressions

- **List (or Tuple)**: a sequence of values, like ["us-west-1a", "us-west-1c"]. Identify elements in a list with consecutive whole numbers, starting with zero.
- **Map (or Object)**: a group of values identified by named labels, like {name = "Mabel", age = 52}.
- **Data** is like a variable, but the difference is that the values attributed to it are defined outside of Terraform, by another separate Terraform configuration, or modified by functions. A data source is accessed via a special kind of resource known as a `data` resource,

## Multiple Provider Configurations

You can optionally define multiple configurations for the same provider, and select which one to use on a per-resource or per-module basis. The primary reason for this is to support multiple regions for a cloud platform.

A `provider` block without an `alias` argument is the *default* configuration for that provider. Resources that don't set the `provider` meta-argument will use the default provider configuration that matches the first word of the resource type name.

For multi-regions, it is necessary to define a new provider block with the other region and define the `alias` parameter in the new block. Once defined, use the meta parameter `provide = <provider name>.<alias>` in the resource declaration block.

## Variables and Outputs

Explicar como usar variables de ambiente declaradas en el .bashrc o .zshrc

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
- **nullable** -> Specify if the variable can be null within the module.

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

- Environment variables
- The `terraform.tfvars` file, if present.
- The `terraform.tfvars.json` file, if present.
- Any `*.auto.tfvars` or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
- Any `-var` and `-var-file` options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

The **Output** values make information about your infrastructure available on the command line and can expose information for other Terraform configurations to use.

```tf
output "<output_name>" {
  value = <resource_type>.<resource_name>.<argument>
}
```

## Module

To use modules in Terraform, create a folder in the root project with your `*.tf` files inside. Additionally, it is necessary to create a file called `terrafile.tf` where the modules will be defined through the **Module** block, with their input and output variables.

```tf
module "<module_name>" {
  source  = "./path/of/the/module"
  version = ""

  #...
}
```

The variables defined within the modules must be assigned as input variables in the definition of the module block.

```tf
module "<module_name>" {
  #...

  variable-A = ""
  variable-N = ""
}
```

On the other hand, to show the outputs of the modules, it is necessary to declare in the `terrafile.tf` an output block for each of the output variables declared in the module.

```tf
output "<output_name>" {
  value = module.<module-name>.property
}
```

You can also create resources in the root module using information from the child module.

```tf
resource "aws_elb" "example" {
  # ...
  instances = module.<module_name>.<output_name>
}
```

[Modules Documentation](https://developer.hashicorp.com/terraform/language/modules/syntax)

## Backend, State & Locking

**Que es terraform state y para q sirve**

A backend defines where Terraform stores its [State](https://developer.hashicorp.com/terraform/language/state) data files. This *state* is stored by default in a local file named `terraform.tfstate`, but we recommend storing it remotely or in Terraform Cloud to version, encrypt, and securely share it with your team.

Some of these backends act as simple remote disks to store *state* files, but others allow *State* to be locked while operations are performed, which helps prevent conflicts and inconsistencies. This locking happens automatically on all operations that could write state. The file `terraform.tfstate.lock.info` has information about the state of TF, even the user who is currently running it.

Some backend configurations can be passed when executing the `init` command. For that, you use the `-backend-config="key=value"` parameter. This configuration is independent for each provider.

Terraform must store *State* about your managed infrastructure and configuration. This *state* is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

Terraform uses *state* to determine which changes to make to your infrastructure. Prior to any operation, Terraform does a refresh to update the *state* with the real infrastructure.

```sh
terraform state <subcommand> -> comando responsable por manipular el archivo tfstate
```

### Subcommands

- `pull` -> Brings all the information from the *tfstate* file wherever it is stored remotely.
- `push` -> Updates some local modifications of the state file, where it is stored remotely. Following the same idea of Git.
- `list` -> Lists the resources within the *tfstate*.
- `rm` -> Delete resources within the *tfstate*. This is not highly recommended because after deleting a resource within the *tfstate*, you lose control over that resource, but it is not deleted from the infrastructure and provider, and when you run a new plan, Terraform will try to create that resource again.
- `mv` -> Move resources around within the project, e.g., you can move a resource from one module to another. It can be used to rename resources within the *tfstate* (this is not recommended).

Whenever the `tf destroy` command is executed, the structure where the searched file is stored can be deleted. To avoid this problem, the `-lock=false` flag is used to avoid destroying the infrastructure where the searched file is located. This `-look=false` flag can also be used in the `tf plan` command to skip validation, that is, avoid conflicts.

*note*: Whenever any modification is made to the backend, it is mandatory to execute the `init` command.

## Import

Breve resumen de para que se usa ese comando.

<https://developer.hashicorp.com/terraform/cli/commands/import>

## Workspaces

Breve descripcion de q es y para q usarlo.

<https://developer.hashicorp.com/terraform/cli/commands/workspace>

## Documentation

- [Official Documentation](https://developer.hashicorp.com/terraform/docs)
- [Official AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
