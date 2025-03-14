variable "region" {
  description = "The AWS region"
  type        = string
}

variable "access_key" {
  description = "The AWS access key"
  type        = string
}

variable "secret_key" {
  description = "The AWS secret key"
  type        = string
}

variable "env" {
  description = "The environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "The availability zones"
  type        = list(string)
}

variable "eks_name" {
  description = "The EKS cluster name"
  type        = string
}

variable "eks_version" {
  description = "The EKS cluster version"
  type        = string
}

variable "ecr_repositories" {
  description = "List of ECR repositories"
  type        = list(string)
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