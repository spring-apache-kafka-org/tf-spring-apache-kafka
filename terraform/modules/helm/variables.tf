variable "env" {
  description = "The environment name"
  type        = string
}

variable "eks_name" {
  description = "The EKS cluster name"
  type        = string
}

variable "eks_endpoint" {
  description = "The EKS cluster endpoint"
  type        = string
}

variable "eks_ca" {
  description = "The EKS cluster certificate authority"
  type        = string
}

variable "eks_token" {
  description = "The EKS cluster token"
  type        = string
}