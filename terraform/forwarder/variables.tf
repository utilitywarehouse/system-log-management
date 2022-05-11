variable "fluentd_image_url" {
  description = "Fluentd's image url"
  type        = string
  default     = "quay.io/utilitywarehouse/fluentd"
}

variable "fluentd_image_tag" {
  description = "Fluentd's image tag"
  type        = string
  default     = "v1.14.6-1"
}

variable "aggregator_host" {
  description = "Endpoint where the aggregator is receiving logs"
  type        = string
  default     = ""
}

variable "aggregator_username" {
  description = "Username for the basic auth of the aggregator"
  type        = string
}

variable "aggregator_password" {
  description = "Password for the basic auth of the aggregator"
  type        = string
}

variable "log_cluster" {
  description = "Label to be added to collected logs. Id of the cluster where the log is produced"
  type        = string
}

variable "log_machinerole" {
  description = "Label to be added to collected logs. Role of the machine where the log is produced"
  type        = string
}
