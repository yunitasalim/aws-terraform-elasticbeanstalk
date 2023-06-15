variable "app_name"{
    description = "Åpplication name"
    type        = string
    default     = "beanstalk-app"
}

variable "aws_region"{
    description = "AWS region code to provision the resources"
    type        = string
    default     = "us-west-1"
}

variable "env_prod_name"{
    description = "Name for ebs prod envi"
    type        = string
    default     = "prod"
}

variable "env_nonprod_name"{
    description = "Name for ebs nonprod envi"
    type        = string
    default     = "beta"
}

variable "zone_a"{
    description = "Zone-1a for the resources"
    type        = string
    default     = "us-west-1a"
}


variable "zone_b"{
    description = "Zone-1b for the resources"
    type        = string
    default     = "us-west-1c"
}
