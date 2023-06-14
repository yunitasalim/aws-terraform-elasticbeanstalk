output "ebs_instance_profile" {
    description = "Instance profile name for EC2 Elastic Beanstalk ec2 instance cluster"
    value = aws_iam_instance_profile.ebs_instance_profile.id
}