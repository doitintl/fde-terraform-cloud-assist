terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0, < 6.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
}

module "gemini_cloud_assist" {
  source  = "../.."
  version = ">= 0.0.0" # Replace with the released module version when consuming from the registry

  project_id         = var.project_id
  group_id           = var.group_id
  disable_on_destroy = var.disable_on_destroy
}

output "gemini_cloud_assist" {
  description = "Outputs exposed by the Gemini Cloud Assist module"
  value = {
    project_id     = module.gemini_cloud_assist.project_id
    group_id       = module.gemini_cloud_assist.group_id
    iam_member_ids = module.gemini_cloud_assist.iam_member_ids
    api_service_id = module.gemini_cloud_assist.api_service_id
  }
}
