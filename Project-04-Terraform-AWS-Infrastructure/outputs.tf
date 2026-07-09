output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP Address"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Public DNS Name"
  value       = aws_instance.web.public_dns
}

output "elastic_ip" {
  description = "Elastic IP Address"
  value       = aws_eip.web_eip.public_ip
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.web_sg.id
}