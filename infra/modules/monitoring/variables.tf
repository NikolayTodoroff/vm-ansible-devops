variable "prefix" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vm_id" {
  type = string
}

variable "alert_email" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}