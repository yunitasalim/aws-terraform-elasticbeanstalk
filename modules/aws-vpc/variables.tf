variable "env_name"{
    description = "Environment name"
    type        = string
    default     = "staging"
}

variable "vpc_cidr_block"{
    description = "IP cidr segment"
    type        = string
    default     = "17.1.0.0/16"
}


variable "az_a"{
    description = "Zone A"
    type        = string
    default     = "us-west-1a"
}

variable "az_b"{
    description = "Zone B"
    type        = string
    default     = "us-west-1b"
}

variable "az_a_public_cidr"{
    description = "Zone A public subnet cidr range"
    type        = string
    default     = "17.1.1.0/24"
}

variable "az_b_public_cidr"{
    description = "Zone B public subnet cidr range"
    type        = string
    default     = "17.1.2.0/24"
}

# [TODO] create private subnet
# variable "az_a_private_cidr"{
#     description = "Zone A private subnet cidr range"
#     type        = string
#     default     = "17.1.3.0/24"
# }

# variable "az_b_private_cidr"{
#     description = "Zone B private subnet cidr range"
#     type        = string
#     default     = "17.1.4.0/24"
# }




# variable "ec2_instance_name" {
#   description = "Name for web server EC2 instance"
#   type        = string
#   default     = "web_server"
# }

# variable "ec2_instance_type" {
#   description = "Instance type for web server EC2 instance"
#   type        = string
#   default     = "t2.micro"
# }

# variable "ec2_security_group_name" {
#   description = "Security group name for web server EC2 instance"
#   type        = string
#   default     = "web_server"

# }

# variable "ec2_security_group_description" {
#   description = "Security group description for web server EC2 instance"
#   type        = string
#   default     = "Allow traffic for webserver"
# }

# variable "vpc_id" {
#   description = "VPC id for web server EC2 instance"
#   type        = string
# }

# variable "subnet_id" {
#   description = "Subnet id for web server EC2 instance"
#   type        = string
# }