terraform {
  required_version = ">=1.11.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.29.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "sessjr-resource-group"
    storage_account_name = "sessjrterraformstage"
    container_name       = "sessjr-terraform-remote-stage"
    key                  = "pipeline-github/terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_location

  default_tags {
    tags = {
      owner : "sessjr"
      managed-by : "terraform"
    }
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "sessjr-terraform-course-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "sessjr-resource-group"
    storage_account_name = "sessjrterraformstage"
    container_name       = "sessjr-terraform-remote-stage"
    key                  = "azure-vnet/terraform.tfstate"
  }
}
