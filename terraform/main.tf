############################################
# Terraform Azure Resource Group Example
############################################

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "gporg"
    workspaces {
      name = "Space-Game---web"
    }
  }
}

terraform {
  required_version = "~> 1.14.8"

}

# Specify the required provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Use a stable version
    }
  }
}

# Configure the Azure provider
provider "azurerm" {
  features {} # Required block, even if empty
}

# Variables for flexibility
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "Azure region for the Resource Group"
  type        = string
  default     = "East US"
}

# Create the Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Output the Resource Group details
output "resource_group_id" {
  description = "The ID of the created Resource Group"
  value       = azurerm_resource_group.rg.id
}
