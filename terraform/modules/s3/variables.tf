variable "env" {
  description = "The environment name"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "lock_table_name" {
  description = "The name of the Dynamodb table"
  type        = string
}

variable "owner" {
  description = "The owner of the resources"
  type        = string
}

variable "discipline" {
  description = "The discipline of the resources"
  type        = string
}

variable "purpose" {
  description = "The purpose of the resources"
  type        = string
}