variable "env" {
  description = "The environment name"
  type        = string
}

variable "eks_name" {
  description = "The EKS cluster name"
  type        = string
}

variable "eks_version" {
  description = "The EKS cluster version"
  type        = string
}

variable "eks_role_arn" {
  description = "The IAM role ARN for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The IAM role ARN for the EKS node group"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the EKS cluster"
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