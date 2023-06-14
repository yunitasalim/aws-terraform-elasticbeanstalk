output "vpc_id" {
  description = "ID of VPC"
  value       = aws_vpc.vpc.id
}

output "elb_subnets" {
  description = "VPC Subnets for the ELB"
  value       = join(",", [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id])
}

//[TODO] Move the EC2 instances to private subnet
output "instance_subnets" {
  description = "VPC Subnets for the ELB"
  value       = join(",", [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id])
}