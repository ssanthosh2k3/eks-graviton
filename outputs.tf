output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = module.eks.cluster_security_group_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "worker_node_group_arn" {
  description = "Amazon Resource Name (ARN) of the EKS Node Group"
  value       = module.eks_workers.node_group_arn
}

output "kubeconfig_command" {
  description = "Command to update kubeconfig"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${var.cluster_name}"
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "worker_node_group_name" {
  value = module.eks_workers.node_group_name
}

output "worker_iam_role_name" {
  value = module.eks_workers.worker_role_name
}

output "worker_iam_role_arn" {
  value = module.eks_workers.worker_role_arn
}

output "worker_node_group" {
  value = module.eks_workers.node_group
}



data "aws_security_group" "eks_cluster_sg" {
  id = module.eks.cluster_security_group_id
}

output "cluster_security_group_name" {
  value = data.aws_security_group.eks_cluster_sg.name
}


output "eks_cluster_security_group_id" {
  description = "Cluster security group ID"
  value       = module.eks.cluster_security_group_id
}

