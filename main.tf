provider "aws" {
  region = "us-west-1"
}

module "aws_iam" {
    source                      = "./modules/aws-iam/"
    ebs_role                    = "EBRole3"
    ebs_instance_profile_name   = "EBInstanceProfile3"
}



# resource "aws_iam_instance_profile" "eb_instance_profile" {
#   name = "EBInstanceProfile2"  # Update with your desired instance profile name
#   role = aws_iam_role.eb_role.name
# }

# resource "aws_iam_role" "eb_role" {
#   name = "EBRole2"  # Update with your desired IAM role name

#   assume_role_policy = <<EOF
# {
# "Version": "2008-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }



# resource "aws_iam_role_policy_attachment" "eb_policy_attachment" {
#   role       = aws_iam_role.eb_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"  # Update with the desired policy ARN
# }



module "aws_vpc_staging" {
    source              = "./modules/aws-vpc/"
    env_name            = "Beta"
    vpc_cidr_block      = "17.1.0.0/16"
    az_a                = "us-west-1a"
    az_b                = "us-west-1c"
    az_a_public_cidr    = "17.1.1.0/24"
    az_b_public_cidr    = "17.1.2.0/24"
}

resource "aws_elastic_beanstalk_application" "rainbowrides" {
  name = "Rainbow Rides"  # Update with your desired application name
}

module "aws_elastic_beanstalk_environment_beta"{
    source                  = "./modules/aws-ebs-envi"
    app_name                = aws_elastic_beanstalk_application.rainbowrides.name
    env_name                = "Beta"
    solution_stack_name     = "64bit Amazon Linux 2 v3.5.8 running PHP 8.0"
    tier                    = "WebServer"
    ec2_instance_type       = "t2.micro"
    instance_profile_name   = module.aws_iam.ebs_instance_profile
    vpc_id                  = module.aws_vpc_staging.vpc_id
    ec2_subnets             = module.aws_vpc_staging.instance_subnets
}

module "aws_vpc_prod" {
    source              = "./modules/aws-vpc/"
    env_name            = "Prod"
    vpc_cidr_block      = "17.2.0.0/16"
    az_a                = "us-west-1a"
    az_b                = "us-west-1c"
    az_a_public_cidr    = "17.2.1.0/24"
    az_b_public_cidr    = "17.2.2.0/24"
}

module "aws_elastic_beanstalk_environment_prod" {
    source                  = "./modules/aws-ebs-envi"
    app_name                = aws_elastic_beanstalk_application.rainbowrides.name
    env_name                = "Beta"
    solution_stack_name     = "64bit Amazon Linux 2 v3.5.8 running PHP 8.0"
    tier                    = "WebServer"
    ec2_instance_type       = "t2.micro"
    instance_profile_name   = module.aws_iam.ebs_instance_profile
    vpc_id                  = module.aws_vpc_prod.vpc_id
    ec2_subnets             = module.aws_vpc_prod.instance_subnets
}

