variable "ebs_role"{
    description = "IAM Role for ElasticBeanstalk"
    type        = string
    default     = "EBRole"
}

variable "ebs_instance_profile_name"{
    description = "IAM Role for ElasticBeanstalk"
    type        = string
    default     = "EBInstanceProfile"
}
