variable "env" {
  description = "The environment name"
  type        = string
}

variable "ecr_repositories" {
  description = "List of ECR repositories"
  type        = list(string)
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