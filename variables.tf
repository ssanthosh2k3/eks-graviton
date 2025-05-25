variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-eks-graviton-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.30"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "worker_instance_types" {
  description = "Instance types for worker nodes (Graviton-based)"
  type        = list(string)
  default     = ["m6g.xlarge"]  # 4 vCPUs, 16 GB RAM
}

variable "worker_desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "worker_max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 4
}

variable "worker_min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "eks-graviton"
    ManagedBy   = "terraform"
    "santhosh"  = "staging"
  }
}
