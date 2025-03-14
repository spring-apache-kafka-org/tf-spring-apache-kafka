provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "helm" {
  kubernetes {
    host  = module.eks.endpoint
    cluster_ca_certificate = base64decode(module.eks.certificate_authority)
    token = module.eks.token
  }
}

terraform {
  required_version = ">=1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.86.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17.0"
    }
  }

  /*backend "s3" {
    bucket         = "apache-kafka-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "apache-kafka-terraform-locks"
    encrypt        = true
  }*/
}

module "ecr" {
  source           = "../../modules/ecr"
  env              = var.env
  ecr_repositories = var.ecr_repositories
  owner            = var.owner
  discipline       = var.discipline
  purpose          = var.purpose
}

module "eks" {
  source        = "../../modules/eks"
  env           = var.env
  eks_name      = var.eks_name
  eks_version   = var.eks_version
  eks_role_arn  = module.iam.eks_cluster_role_arn
  node_role_arn = module.iam.eks_node_role_arn
  subnet_ids    = module.vpc.private_subnet_ids
  owner         = var.owner
  discipline    = var.discipline
  purpose       = var.purpose
}

module "helm" {
  source       = "../../modules/helm"
  env          = var.env
  eks_name     = module.eks.eks_name
  eks_endpoint = module.eks.endpoint
  eks_ca       = module.eks.certificate_authority
  eks_token    = module.eks.token

  depends_on = [module.eks]
}

module "iam" {
  source     = "../../modules/iam"
  env        = var.env
  eks_name   = var.eks_name
  owner      = var.owner
  discipline = var.discipline
  purpose    = var.purpose
}

module "s3" {
  source          = "../../modules/s3"
  env             = var.env
  bucket_name     = var.bucket_name
  lock_table_name = var.lock_table_name
  owner           = var.owner
  discipline      = var.discipline
  purpose         = var.purpose
}

module "vpc" {
  source               = "../../modules/vpc"
  env                  = var.env
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  availability_zones   = var.availability_zones
  eks_name             = var.eks_name
  owner                = var.owner
  discipline           = var.discipline
  purpose              = var.purpose
}