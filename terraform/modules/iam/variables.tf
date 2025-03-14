variable "env" {
  description = "The environment name"
  type        = string
}

variable "eks_name" {
  description = "The EKS cluster name"
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