# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

## Terraform configuration

terraform {

  # backend "s3" {
  #   bucket  = "lo-petgrackle-panera"
  #   key     = "states"
  #   region  = "us-east-1"
  #   profile = "hashicorp-doormat"
  # }

  backend "gcs" {
    bucket = "lo-petgrackle-panera"
    prefix = "terraform/state"
  }

  # cloud {
  #   organization = "lo-petgrackle"
  #   workspaces {
  #     name = "learn-terraform-cloud-migrate"
  #   }
  # }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }

  required_version = ">= 1.1.0"

}

variable "name_length" {
  description = "The number of words in the pet name"
  default     = "6"
}

resource "random_pet" "pet_name" {
  length    = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name.id
}
