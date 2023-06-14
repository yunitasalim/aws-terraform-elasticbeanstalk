
# Create the Elastic Beanstalk environment without load balancer using VPC A
resource "aws_elastic_beanstalk_environment" "env" {
  name        = var.env_name  # Update with your desired environment name
  application = var.app_name
  solution_stack_name = var.solution_stack_name
  tier        = var.tier
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.ec2_instance_type
  }
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.instance_profile_name
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  
  //[TODO] Change to private subnet
  setting {
     namespace = "aws:ec2:vpc"
     name      = "AssociatePublicIpAddress"
     value     =  "True"
   }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }
  
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }
  
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.ec2_subnets
  }

}