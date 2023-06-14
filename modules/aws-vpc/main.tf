
# Create VPC A
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.env_name  
  }
}


# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.env_name
  }
}

# Create Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"  # Update with your desired route table name
  }
}


# Create public subnet zone-a for VPC Staging
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.az_a_public_cidr
  availability_zone       = var.az_a   
  tags = {
    Name = "VPC ${var.env_name} Public Subnet A"
  }
}

# Create public subnet zone-b for VPC B
resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.az_b_public_cidr
  availability_zone       = var.az_b

  tags = {
    Name = "VPC ${var.env_name} Public Subnet B"
  }
}

# Associate Public Subnet with Route Table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_association_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_route_table.id
}


# [TOD0] Create a private subnet 
# # Create private subnet zone-a for VPC Staging
# resource "aws_subnet" "staging_private_subnet_a" {
#   vpc_id                  = aws_vpc.staging.id
#   cidr_block              = "17.1.5.0/24"  # Update with the desired CIDR block for the private subnet in VPC B
#   availability_zone       = "us-west-1a"   # Update with the desired availability zone for the private subnet

#   tags = {
#     Name = "VPC Staging Private Subnet A"  # Update with the desired name for the private subnet
#   }
# }


# # Create private subnet zone-b for VPC Staging
# resource "aws_subnet" "staging_private_subnet_b" {
#   vpc_id                  = aws_vpc.staging.id
#   cidr_block              = "17.1.4.0/24"  # Update with the desired CIDR block for the private subnet in VPC B
#   availability_zone       = "us-west-1c"   # Update with the desired availability zone for the private subnet

#   tags = {
#     Name = "VPC Staging Private Subnet B"  # Update with the desired name for the private subnet
#   }
# }