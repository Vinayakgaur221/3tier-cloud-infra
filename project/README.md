# ☁️ Azure Three-Tier Web Application Infrastructure

![Azure](https://img.shields.io/badge/Azure-0089D6?style=for-the-badge&logo=microsoft-azure&logoColor=white)

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

A modular three-tier web application infrastructure built on **Microsoft Azure using Terraform**, following production-oriented Infrastructure as Code practices.

## 🏗️ Architecture

```text
        [ Internet ]
             │
       ┌─────┴──────────────┐
       │                    │
       ▼                    ▼
┌──────────────────┐   ┌──────────────────┐
│ App Gateway      │   │ Azure Bastion    │
│ Public IP        │   │ Public IP        │
│ Public Subnet    │   │ Admin Access     │
└────────┬─────────┘   └────────┬─────────┘
         │                      │
         │ HTTP 80 / HTTPS 443  │
         │                      ▼
         │              [ AzureBastionSubnet ]
         │                      │
         │                      ▼
         │              Private VMSS Access
         │                      │
         ▼                      │
┌────────────────────────────────────────────────────────┐
│              Azure Virtual Network (VNet)              │
│                                                        │
│  [ Private Application Subnet ]                       │
│  ┌──────────────────────────────────┐                 │
│  │ VM Scale Set (VMSS)              │◄──── Bastion     │
│  │ No Public IP                     │      Access      │
│  └───────────────┬──────────────────┘                 │
│                  │                                     │
│                  │ Port 5432                           │
│                  ▼                                     │
│  [ Private Database Subnet ]                           │
│  ┌──────────────────────────────────┐                 │
│  │ Azure PostgreSQL Flexible Server │                 │
│  └──────────────────────────────────┘                 │
│                                                        │
│  [ NAT Gateway ] ──────────────► Outbound Internet     │
└────────────────────────────────────────────────────────┘

🔧 Azure Services
Azure Application Gateway
Azure Bastion
Virtual Machine Scale Set
PostgreSQL Flexible Server
Virtual Network & Subnets
Network Security Groups
NAT Gateway
Azure Key Vault
Managed Identity
Log Analytics
Public IP


📂 Project Structure

project/
├── child-modules/
│   ├── application-gateway/
│   ├── azure-bastion/
│   ├── database/
│   ├── key-vault/
│   ├── monitoring/
│   ├── nat-gateway/
│   ├── network-security-group/
│   ├── resource-group/
│   ├── subnet/
│   ├── virtual-machine-scale-set/
│   └── vnet/
│
└── three-tier-infrastructure/
    ├── main.tf
    ├── provider.tf
    ├── variables.tf
    ├── terraform.tfvars.example
    └── versions.tf

🚀 Deployment

az login
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply 


🔐 Security & Best Practices
Public and private subnet separation
Dedicated AzureBastionSubnet for secure administrative access
Azure Bastion for accessing private VMSS instances
Application Gateway with dedicated Public IP
Azure Bastion with dedicated Public IP
Private VMSS without public IPs
NSGs for controlled traffic flow
NAT Gateway for outbound connectivity
Azure Key Vault for secrets
Managed Identity for Azure authentication
Terraform state and .tfvars excluded from Git

🧠 Key Learnings
Modular Terraform
Azure networking
Application Gateway
Azure Bastion
VM Scale Sets
PostgreSQL
NSGs & NAT Gateway
Key Vault & Managed Identity
Infrastructure as Code