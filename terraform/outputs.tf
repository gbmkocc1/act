output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "selected_ami_id" {
  value = data.aws_ami.amazon_linux.id
}
