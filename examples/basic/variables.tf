variable "project_id" {
  description = "The target GCP project ID"
  type        = string
}

variable "group_id" {
  description = "The Google Group email to receive Gemini Cloud Assist access"
  type        = string
}

variable "disable_on_destroy" {
  description = "Disable the Gemini Cloud Assist API when destroying the example"
  type        = bool
  default     = true
}
