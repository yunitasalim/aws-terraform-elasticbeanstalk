variable "app_name"{
    description = "Åpplication name"
    type        = string
    default     = "beanstalk-app"
}

variable "env_name"{
    description = "Environment name"
    type        = string
    default     = "staging"
}

variable "solution_stack_name"{
    description = "Solution stack name"
    type        = string
    default     = "64bit Amazon Linux 2 v3.5.8 running PHP 8.0"
}

variable "tier"{
    description = "Beanstalk app tier"
    type        = string
    default     = "WebServer"
}

variable "ec2_instance_type"{
    description = "Instance type for the cluster"
    type        = string
    default     = "t2.micro"
}

variable "instance_profile_name"{
    description = "Instance profile of the compute cluster"
    type        = string
    default     = "EBInstanceProfile"
}


variable "vpc_id"{
    description = "VPC-ID for the environment"
    type        = string
}

variable "ec2_subnets"{
    description = "Subnets for the EC2 instances"
    type        = string
}
