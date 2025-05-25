terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Data sources for availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  cluster_name = var.cluster_name
  vpc_cidr     = var.vpc_cidr
  azs          = slice(data.aws_availability_zones.available.names, 0, 2)
  
  tags = var.tags
}

# EKS Cluster Module
module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  
  tags = var.tags
}

# EKS Worker Nodes Module
module "eks_workers" {
  source = "./modules/eks-workers"

  cluster_name     = var.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint
  cluster_ca_cert  = module.eks.cluster_certificate_authority_data
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.private_subnet_ids
  instance_types   = var.worker_instance_types
  desired_capacity = var.worker_desired_capacity
  max_capacity     = var.worker_max_capacity
  min_capacity     = var.worker_min_capacity
  
  tags = var.tags
  
  depends_on = [module.eks]
}
