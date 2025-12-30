output "instance_id" {
  value = aws_instance.web[*].id
}

output "instance_public_ips" {
  description = "Public IPs of all EC2 instances"
  value       = aws_instance.web[*].public_ip
}

output "instance_private_ips" {
  description = "Private IPs of all EC2 instances"
  value       = aws_instance.web[*].private_ip
}