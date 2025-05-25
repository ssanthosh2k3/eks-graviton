aws_region     = "ap-south-1"
cluster_name   = "my-eks-graviton-cluster"
cluster_version = "1.30"
vpc_cidr       = "10.0.0.0/16"

# Graviton instance types with 4 CPU cores
worker_instance_types   = ["m6g.xlarge"]
worker_desired_capacity = 2
worker_max_capacity     = 4
worker_min_capacity     = 1

tags = {
  Environment = "development"
  Project     = "eks-graviton-cluster"
  Owner       = "devops-team"
  ManagedBy   = "terraform"
  "santhosh"  = "staging"
}
