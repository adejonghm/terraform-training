# Azure Load Balancer with Linux Servers

A Terraform project that demonstrates Infrastructure as Code (IaC) by deploying multiple Linux virtual machines behind an Azure Load Balancer. This lab showcases best practices for high availability, automated provisioning, and modular infrastructure design.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Usage](#usage)
- [Outputs](#outputs)
- [Testing](#testing)
- [Cleanup](#cleanup)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🎯 Overview

This project deploys a production-ready infrastructure setup in Azure consisting of:

- **Multiple Linux VMs**: Ubuntu 22.04 LTS virtual machines distributed across subnets
- **Azure Load Balancer**: Standard SKU load balancer with health probes for high availability
- **Network Security**: Network Security Groups (NSG) with proper firewall rules
- **Automated Setup**: Nginx web server installation via custom data scripts
- **Remote State**: Integration with existing VNet infrastructure via Terraform remote state
- **Cost Management**: Comprehensive resource tagging for FinOps and cost allocation

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      Azure Cloud                             │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │           Azure Load Balancer (Standard SKU)          │  │
│  │         Public IP: <lb_frontend_ip>                   │  │
│  └───────────────────┬──────────────────────────────────┘  │
│                      │                                        │
│         ┌────────────┴────────────┐                          │
│         │                         │                          │
│  ┌──────▼──────┐          ┌──────▼──────┐                   │
│  │   Subnet 1  │          │   Subnet 2  │                   │
│  │ 10.88.20.0/24│          │ 10.88.30.0/24│                   │
│  │             │          │             │                   │
│  │  ┌────────┐ │          │  ┌────────┐ │                   │
│  │  │  VM 1  │ │          │  │  VM 2  │ │                   │
│  │  │ Nginx  │ │          │  │ Nginx  │ │                   │
│  │  └────────┘ │          │  └────────┘ │                   │
│  └─────────────┘          └─────────────┘                   │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │         Network Security Group (NSG)                  │  │
│  │    Rules: Allow HTTP (port 9090) from Load Balancer  │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### Traffic Flow

1. **Client Request** → Public IP of Load Balancer
2. **Load Balancer** → Health probe checks backend VMs
3. **Traffic Distribution** → Load Balancer routes to healthy VMs
4. **Backend VMs** → Process request and return response
5. **Response** → Returns through Load Balancer to client

## ✨ Features

### High Availability

- **Multi-Subnet Distribution**: VMs are automatically distributed across different subnets
- **Health Probes**: Automatic health checking ensures only healthy VMs receive traffic
- **Failover**: Automatic failover if a VM becomes unhealthy

### Infrastructure as Code

- **Terraform Modules**: Reusable, modular infrastructure components
- **Remote State**: Integration with existing VNet infrastructure
- **Version Control**: All infrastructure defined in code

### Automation

- **Custom Data Scripts**: Automated nginx installation during VM provisioning
- **SSH Key Authentication**: Secure, key-based access to Linux VMs
- **Resource Tagging**: Comprehensive tagging for cost management and organization

### Security

- **Network Security Groups**: Firewall rules restricting access
- **Private IPs**: VMs use private IPs, only Load Balancer has public IP
- **SSH Key Authentication**: No password-based authentication

## 📦 Prerequisites

Before deploying this infrastructure, ensure you have:

1. **Azure Account**
   - Active Azure subscription
   - Appropriate permissions to create resources (Contributor role minimum)

2. **Azure CLI**

   ```bash
   # Install Azure CLI (if not already installed)
   # macOS
   brew install azure-cli
   
   # Login to Azure
   az login
   ```

3. **Terraform**

   ```bash
   # Install Terraform (version >= 1.5.0)
   # macOS
   brew install terraform
   
   # Verify installation
   terraform version
   ```

4. **SSH Key Pair**

   ```bash
   # Generate SSH key pair (if not exists)
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   
   # Public key will be at: ~/.ssh/id_rsa.pub
   ```

5. **Remote State Backend**
   - Existing Azure Storage Account for Terraform state
   - Existing VNet and subnets deployed via remote state
   - Remote state backend configured in `backend.tf`

6. **Required Modules**
   - Remote modules from GitHub:
     - `github.com/adejonghm/terraform-modules/tags` (FinOps tagging)
     - `github.com/adejonghm/terraform-modules/subnet` (Subnet creation)

## 📁 Project Structure

```
load_balancer_servers/
├── base.tf                    # Main infrastructure configuration
├── locals.tf                  # Local variables and VM-to-subnet mapping
├── variables.tf               # Input variables definition
├── outputs.tf                 # Output values
├── provider.tf                # Azure provider configuration
├── backend.tf                 # Remote state backend configuration
├── terraform.tfvars           # Variable values (user-specific)
├── modules/
│   ├── vm/                    # Linux VM module
│   │   ├── vm.tf              # VM resource definitions
│   │   ├── variables.tf       # VM module variables
│   │   └── outputs.tf         # VM module outputs
│   └── load_balancer/         # Load balancer module
│       ├── lb.tf              # Load balancer resource definitions
│       ├── variables.tf       # Load balancer module variables
│       └── outputs.tf         # Load balancer module outputs
├── scripts/
│   └── install_nginx.sh       # Web server installation script
└── README.md                  # This file
```

### File Dependencies

```
provider.tf → base.tf → modules/vm/ → modules/load_balancer/
     ↓           ↓            ↓              ↓
backend.tf  variables.tf  locals.tf    outputs.tf
     ↓           ↓
terraform.tfvars
```

## ⚙️ Configuration

### Required Variables

Edit `terraform.tfvars` with your specific values:

```hcl
subscription_id = "your-azure-subscription-id"
ssh_key_path    = "~/.ssh/id_rsa.pub"
```

### Key Variables (with defaults)

| Variable | Description | Type |
|----------|-------------|------|
| `rg_name` | Resource group name | string |
| `vm_name` | List of VM names | list(string) |
| `user` | Linux VM admin username | string |
| `lb_name` | Load balancer name | string |
| `lb_sku` | Load balancer SKU | string |
| `backend_port` | Health probe port | number |
| `subnets` | Map of subnet names to CIDR blocks | map(string) |

### FinOps Variables

| Variable | Description |
|----------|-------------|
| `owner` | Resource owner |
| `management` | Management tool |
| `environment` | Environment (dev/test/prod/labs) |
| `project` | Project name |

### Network Configuration

The project creates two subnets by default:

- `snetukslabbalsrvpool01`: `10.88.20.0/24`
- `snetukslabbalsrvpool02`: `10.88.30.0/24`

Each VM is automatically assigned to a subnet. The number of VMs must equal the number of subnets.

### Backend Configuration

Update `backend.tf` with your remote state configuration:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "your-rg-name"
    storage_account_name = "your-storage-account"
    container_name       = "tfstates"
    key                  = "labs/load_balancer_servers/terraform.tfstate"
  }
}
```

## 🚀 Usage

### 1. Initialize Terraform

```bash
# Initialize Terraform and download providers/modules
terraform init
```

### 2. Review the Execution Plan

```bash
# Preview changes before applying
terraform plan
```

### 3. Apply the Configuration

```bash
# Deploy the infrastructure
terraform apply

# Type 'yes' when prompted to confirm
```

### 4. Access the Load Balancer

After deployment completes:

```bash
# Get the load balancer frontend IP
terraform output lb_frontend_ip

# Test the web application
curl http://$(terraform output -raw lb_frontend_ip):9090
```

## 📤 Outputs

The deployment provides the following outputs:

| Output | Description |
|--------|-------------|
| `lb_frontend_ip` | Public IP address of the Azure Load Balancer frontend |

To view all outputs:

```bash
terraform output
```

To get a specific output value:

```bash
terraform output lb_frontend_ip
```

## 🧪 Testing

### Health Check Verification

1. **Check Load Balancer Health Probes**

   ```bash
   az network lb probe list \
     --resource-group rgukslabbalsrvpool \
     --lb-name lbeukslabbalsrvpool01 \
     --output table
   ```

2. **Verify Backend Pool Members**

   ```bash
   az network lb address-pool address list \
     --resource-group rgukslabbalsrvpool \
     --lb-name lbeukslabbalsrvpool01 \
     --pool-name bpool-lbeukslabbalsrvpool01 \
     --output table
   ```

3. **Test Load Distribution**

   ```bash
   # Make multiple requests to see load distribution
   for i in {1..10}; do
     curl -s http://$(terraform output -raw lb_frontend_ip):9090 | grep -o "Server.*" || echo "Request $i"
   done
   ```

### Expected Behavior

- ✅ All VMs should be healthy in the load balancer backend pool
- ✅ HTTP requests should be distributed across VMs
- ✅ If a VM becomes unhealthy, traffic should route to healthy VMs only
- ✅ Nginx welcome page should be accessible through the load balancer

## 🧹 Cleanup

To destroy all resources created by this Terraform configuration:

```bash
# Review what will be destroyed
terraform plan -destroy

# Destroy all resources
terraform destroy

# Type 'yes' when prompted to confirm
```

**⚠️ Warning**: This will permanently delete all resources including VMs, load balancer, and associated networking components.

## 🔧 Troubleshooting

### Common Issues

#### 1. SSH Key Path Error

```
Error: open ~/.ssh/id_rsa.pub: no such file or directory
```

**Solution**: Ensure the SSH public key path in `terraform.tfvars` is correct. Use absolute path if needed:

```hcl
ssh_key_path = "/Users/your-username/.ssh/id_rsa.pub"
```

#### 2. Remote State Not Found

```
Error: Failed to get existing workspaces: storage container "tfstates" not found
```

**Solution**:

- Verify the storage account and container exist
- Check backend configuration in `backend.tf`
- Ensure you have access to the storage account

#### 3. VNet/Subnet Not Found

```
Error: subnet not found
```

**Solution**:

- Verify the remote state contains VNet information
- Check the remote state key path in `base.tf`
- Ensure the VNet exists and is accessible

#### 4. Load Balancer Health Probe Failing

```
All backend VMs showing as unhealthy
```

**Solution**:

- Verify nginx is running on the VMs: `systemctl status nginx`
- Check NSG rules allow traffic on port 9090
- Verify the health probe port matches the nginx listening port
- Check VM network connectivity

#### 5. Permission Denied Errors

```
Error: authorization failed
```

**Solution**:

- Verify Azure CLI is logged in: `az account show`
- Check you have Contributor role on the subscription
- Ensure service principal (if used) has appropriate permissions

### Verification Steps

1. **Check Resource Group**

   ```bash
   az group show --name rgukslabbalsrvpool
   ```

2. **List All Resources**

   ```bash
   az resource list --resource-group rgukslabbalsrvpool --output table
   ```

3. **Check VM Status**

   ```bash
   az vm list --resource-group rgukslabbalsrvpool --show-details --output table
   ```

4. **View Load Balancer Details**

   ```bash
   az network lb show \
     --resource-group rgukslabbalsrvpool \
     --name lbeukslabbalsrvpool01
   ```

5. **Check NSG Rules**

   ```bash
   az network nsg rule list \
     --resource-group rgukscstbaseresrcs \
     --nsg-name nsgukslabbalsrvpool \
     --output table
   ```

## 🤝 Contributing

This is a learning lab project. Suggestions and improvements are welcome!

### Development Guidelines

- Follow Terraform best practices
- Maintain consistent naming conventions
- Update documentation when making changes
- Test changes in a non-production environment first

## 📝 License

This project is provided as-is for educational and learning purposes.

## 👤 Author

**adejonghm**

- Developed: July 9, 2025
- Last Updated: December 3, 2025
- Purpose: Terraform training lab for load balancing concepts with Azure Load Balancer

## 📚 Additional Resources

- [Azure Load Balancer Documentation](https://docs.microsoft.com/en-us/azure/load-balancer/)
- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
- [Azure Network Security Groups](https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview)

---

**Note**: This project uses remote modules from `github.com/adejonghm/terraform-modules`. Ensure you have access to these repositories or update the module sources accordingly.
