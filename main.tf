provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../../"

  name = "Group-6"
  cidr = "192.168.0.0/16"

  azs             = ["${local.region}a", "${local.region}b"]
  private_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24"]
  public_subnets  = ["192.168.5.0/24", "192.168.6.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "Jay"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "Group6-vpc"
  }
}
