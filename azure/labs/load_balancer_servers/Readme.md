# Load Balancing Linux Servers Lab

## Overview

This lab demonstrates how to deploy multiple Linux virtual machines in Azure with a fully functional load balancer. The infrastructure is built using Terraform and includes proper tagging, modular design, remote state management, and automated web server installation.

## Architecture

The lab creates the following resources:

- **Resource Group**: Centralized resource management with comprehensive tagging
- **Multiple Linux VMs**: Ubuntu 22.04 LTS virtual machines distributed across subnets
- **Network Integration**: VMs are placed in existing subnets from remote state
- **Load Balancer**: Standard SKU Azure Load Balancer with health probes
- **Backend Pool**: VMs are automatically added to the load balancer backend pool
- **Web Server Installation**: Automated nginx installation via custom data scripts
- **Tagging**: Comprehensive tagging using a dedicated tags module for cost management

## Prerequisites

Before running this lab, ensure you have:

1. **Azure CLI** installed and authenticated
2. **Terraform** installed (version 1.0+)
3. **SSH Key Pair** generated and available
4. **Azure Subscription** with appropriate permissions
5. **Remote State Backend** configured (Azure Storage Account)
6. **Existing VNet and Subnets** deployed via remote state

## File Structure

```bash
load_balancer_linux_servers/
├── base.tf               # Main infrastructure configuration
├── locals.tf             # Local variables and VM mapping logic
├── variables.tf          # Input variables definition
├── outputs.tf            # Output values
├── provider.tf           # Azure provider configuration
├── backend.tf            # Remote state configuration
├── terraform.tfvars      # Variable values
├── modules/
│   ├── vm/               # Linux VM module
│   ├── tags/             # Tagging module
│   └── load_balancer/    # Load balancer module
├── scripts/
│   └── install_nginx.sh  # Web server installation script
└── README.md             # This file
```

## Configuration

### Required Variables

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `subscription_id` | Azure Subscription ID | string | - |
| `ssh_key_path` | Path to SSH public key | string | - |

### Key Variables

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `number_of_instances` | Number of VMs to create | number | 2 |
| `vm_name` | VM naming prefix | string | "vmlxserver" |
| `user` | Linux VM admin username | string | "lx_user01" |
| `rg_name` | Resource group name | string | "rgbalancingtraffic" |
| `lb_name` | Load balancer name | string | "lbextlxserverpool" |
| `lb_sku` | Load balancer SKU | string | "Standard" |

### FinOps Variables

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `owner` | Resource owner | string | "adejonghm" |
| `management` | Management tool | string | "terraform" |
| `environment` | Environment | string | "labs" |
| `project` | Project name | string | "lb_linux_servers" |

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

### 4. Access the Load Balancer

After deployment, you can access the web application through the load balancer:

```bash
# Get the load balancer frontend IP
terraform output lb_frontend_ip

# Access the web application
curl http://<load_balancer_ip>
```

## Features

### Load Balancer Configuration

- **Standard SKU**: High availability and advanced features
- **Health Probes**: Automatic health checking of backend VMs
- **Backend Pool**: Automatic VM registration in load balancer pool
- **Frontend IP**: Public IP for external access

### VM Distribution

- **Subnet Distribution**: VMs are automatically distributed across available subnets
- **High Availability**: Multiple VMs across different subnets for redundancy
- **Configurable Count**: Easy to scale by changing `number_of_instances`

### Automated Setup

- **Nginx Installation**: Automated web server setup via custom data scripts
- **SSH Key Authentication**: Secure access to Linux VMs
- **Ubuntu 22.04 LTS**: Latest stable Ubuntu release

### Remote State Integration

- **VNet Reference**: Uses existing VNet configuration from remote state
- **Subnet Reference**: Automatically uses available subnets
- **Consistent Networking**: Ensures infrastructure consistency

### Cost Management

- **Comprehensive Tagging**: All resources tagged for cost allocation
- **FinOps Module**: Centralized tagging strategy
- **Environment Tracking**: Clear environment identification

## Outputs

The deployment provides the following outputs:

- `lb_frontend_ip`: Public IP address of the Azure Load Balancer frontend

## Testing the Load Balancer

1. **Health Check**: The load balancer automatically health checks the VMs
2. **Load Distribution**: Traffic is distributed across healthy VMs
3. **Failover**: If a VM becomes unhealthy, traffic is routed to healthy VMs
4. **Web Access**: Access the nginx welcome page through the load balancer IP

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

## Notes

- **Default Configuration**: Deploys 2 Linux VMs by default
- **Subnet Distribution**: VMs are automatically distributed across available subnets
- **Web Server**: Each VM runs nginx web server
- **Load Balancer**: Standard SKU with health probes enabled
- **Security**: SSH key-based authentication for secure access

## Developer

**Developed by**: adejonghm  
**Date**: August 6, 2025  
**Purpose**: Terraform training lab for load balancing concepts with Azure Load Balancer

## Troubleshooting

### Common Issues

1. **SSH Key Path**: Ensure the SSH public key path is correct in `terraform.tfvars`
2. **Remote State**: Verify that the VNet and subnet remote state exists
3. **Permissions**: Ensure Azure CLI has sufficient permissions to create resources
4. **Load Balancer Health**: Check VM health status in Azure portal if web access fails

### Verification Steps

1. Check VM status in Azure portal
2. Verify load balancer health probes
3. Test web access through load balancer IP
4. Confirm SSH access to individual VMs
