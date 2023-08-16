variable "location" {
  type = string
  default = null
}

variable "resource_group_name" {
  type = string
  default = null
}

variable "diag_object" {
  description = "contains the logs and metrics for diagnostics"
  type = object({
    log_analytics_workspace_id = string
    log                        = list(tuple([string, bool, bool, number]))
    metric                     = list(tuple([string, bool, bool, number]))
  })
  default = null
}

variable "subnet_name" {
  type = string
  default = null
}

variable "dependencies" {
  type = string
  default = null
}