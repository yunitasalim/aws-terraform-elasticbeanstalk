resource "aws_iam_role" "ebs_role" {
  name = var.ebs_role  # Update with your desired IAM role name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "eb_policy_attachment" {
  role       = aws_iam_role.ebs_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"  # Update with the desired policy ARN
}

resource "aws_iam_instance_profile" "ebs_instance_profile" {
  name = var.ebs_instance_profile_name  # Update with your desired instance profile name
  role = aws_iam_role.ebs_role.name
}