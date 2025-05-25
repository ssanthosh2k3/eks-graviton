output "node_group" {
  description = "Full node group resource attributes"
  value       = aws_eks_node_group.workers
}


output "node_group_status" {
  description = "Status of the EKS Node Group"
  value       = aws_eks_node_group.workers.status
}

output "node_group_name" {
  value = aws_eks_node_group.workers.node_group_name
}

output "node_group_arn" {
  value = aws_eks_node_group.workers.arn
}

output "worker_role_name" {
  value = aws_iam_role.worker.name
}

output "worker_role_arn" {
  value = aws_iam_role.worker.arn
}



