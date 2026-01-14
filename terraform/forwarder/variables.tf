variable "log_cluster" {
  description = "Label to be added to collected logs. Id of the cluster where the log is produced"
  type        = string

  validation {
    condition     = can(regex("^(exp-1|dev|prod)-(aws|gcp|merit)$", var.log_cluster))
    error_message = "Invalid kubernetes cluster value."
  }
}

variable "log_machinerole" {
  description = "Label to be added to collected logs. Role of the machine where the log is produced"
  type        = string
}

variable "loki_url" {
  default     = "loki"
  description = "Loki url"
}

variable "loki_username" {
  default     = "loki"
  description = "Loki user"
}

variable "loki_password" {
  description = "Loki password"
}

variable "vector_image_url" {
  description = "Vector's image url"
  type        = string
  default     = "timberio/vector"
}

variable "vector_image_tag" {
  description = "Vector's image tag"
  type        = string
  default     = "latest-debian"
}
