# Gemini Cloud Assist Terraform Module

Module to enable the Gemini Cloud Assist API in a project and grant the required IAM roles to a Google Group.

## Requirements
- Terraform >= 1.5.0
- Google provider >= 5.0.0 and < 6.0.0
- Existing GCP project and Google Group
- Permissions to enable services and manage IAM (`roles/serviceusage.serviceUsageAdmin` and `roles/resourcemanager.projectIamAdmin`)

## Usage
```hcl
module "gemini_cloud_assist" {
  source  = "doitintl/gemini-cloud-assist/google"
  version = "x.y.z" # pin a released version

  project_id         = "my-gcp-project"
  group_id           = "ticket-123456@cre.doit-intl.com"
  disable_on_destroy = true
}
```

Configure the Google provider in your root module, for example:
```hcl
provider "google" {
  project = var.project_id
}
```

See `examples/basic` for a runnable configuration that consumes this module locally (`source = "../.."`).

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `project_id` | The ID of the GCP project to grant access to | `string` | n/a | yes |
| `group_id` | Google Group email address to grant access to, format `ticket-<CASE_ID>@cre.doit-intl.com` | `string` | n/a | yes |
| `disable_on_destroy` | Disable the Gemini Cloud Assist API during destroy | `bool` | `true` | no |

## Outputs
| Name | Description |
|------|-------------|
| `project_id` | GCP project ID where access was granted |
| `group_id` | Google Group email address that was granted access |
| `iam_member_ids` | Map of IAM member resource IDs keyed by role (`viewer`, `user`, `investigation_user`) |
| `api_service_id` | ID of the enabled Gemini Cloud Assist API service |

## Notes
- The module enables `geminicloudassist.googleapis.com`; setting `disable_on_destroy = true` disables it on destroy.
- IAM propagation can take a couple of minutes after apply.
- Validate and format before publishing: `terraform fmt` and `terraform validate`.
