output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.t3_micro_vm.id
}

output "public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.t3_micro_vm.public_ip
}
