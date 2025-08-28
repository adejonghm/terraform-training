# Load Balancing VMs Lab

## Overview

This lab demonstrates how to deploy multiple Linux virtual machines in Azure with load balancing capabilities. The infrastructure is built using Terraform and includes proper tagging, modular design, and remote state management.

## Architecture

The lab creates the following resources:

- **Resource Group**: Centralized resource management
- **Multiple Linux VMs**: Ubuntu 22.04 LTS virtual machines distributed across subnets
- **Network Integration**: VMs are placed in existing subnets from remote state
- **Tagging**: Comprehensive tagging using a dedicated tags module
- **Load Balancer**: (Module available but not currently deployed)

## Prerequisites

Before running this lab, ensure you have:

1. **Azure CLI** installed and authenticated
2. **Terraform** installed (version 1.0+)
3. **SSH Key Pair** generated and available
4. **Azure Subscription** with appropriate permissions
5. **Remote State Backend** configured (Azure Storage Account)

## File Structure

```bash
load_balancing_vms/
├── base.tf               # Main infrastructure configuration
├── base.windows          # Windows VM configuration (alternative)
├── variables.tf          # Input variables definition
├── outputs.tf            # Output values
├── provider.tf           # Azure provider configuration
├── backend.tf            # Remote state configuration
├── terraform.tfvars      # Variable values
├── modules/
│   ├── vm_linux/         # Linux VM module
│   ├── vm_windows/       # Windows VM module
│   ├── tags/             # Tagging module
│   └── load_balancer/    # Load balancer module
└── README.md             # This file
```

## Configuration

### Required Variables

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `subscription_id` | Azure Subscription ID | string | - |
| `key_path` | Path to SSH public key | string | - |
| `win_pass` | Windows VM admin password | string | - |

### Optional Variables

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `location` | Azure region | string | "South Central US" |
| `rg_name` | Resource group name | string | "rglabloadbalancing" |
| `vm_name_prefix` | VM naming prefix | string | "vmloadbalancer" |

## Usage

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Review the Plan

```bash
terraform plan
```

### 3. Apply the Configuration

```bash
terraform apply
```

### 4. Access the VMs

After deployment, you can access the VMs using SSH:

```bash
# Get the public IP addresses
terraform output linuxvm_ip

# SSH to a VM (replace with actual IP)
ssh lx-user01@<vm_public_ip>
```

## Features

### Modular Design

- **VM Modules**: Separate modules for Linux and Windows VMs
- **Tags Module**: Centralized tagging for cost management
- **Load Balancer Module**: Available for future use

### Remote State Integration

- Uses existing subnet configuration from remote state
- Enables infrastructure reuse and consistency

### Scalability

- Configurable number of VMs via `number_of_vms` local
- Distributed across multiple subnets for high availability

### Security

- SSH key-based authentication for Linux VMs
- Sensitive password handling for Windows VMs
- Network security through subnet placement

## Outputs

The deployment provides the following outputs:

- `linuxvm_ip`: Public IP addresses of all Linux VMs
- `windowsvm_ip`: Public IP addresses of Windows VMs (commented out)

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

## Notes

- The lab currently deploys 2 Linux VMs by default
- VMs are distributed across available subnets from remote state
- Windows VM configuration is available in `base.windows` but not deployed
- Load balancer module is available but not currently integrated

## Developer

**Developed by**: adejonghm  
**Date**: July 9, 2025  
**Purpose**: Terraform training lab for load balancing concepts
