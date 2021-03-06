provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source = "../../"

  name = "simple-example"

  cidr = "10.0.0.0/16"

  private_subnets = {
    "subnet-1" = {
      cidr = "10.0.1.0/24",
      az   = "eu-west-1a"
    },
    "subnet-2" = {
      cidr = "10.0.2.0/24",
      az   = "eu-west-1b"
    },
    "subnet-3" = {
      cidr = "10.0.3.0/24",
      az   = "eu-west-1c"
    }
  }
  public_subnets = {
    "subnet-4" = {
      cidr = "10.0.101.0/24",
      az   = "eu-west-1a"
    },
    "subnet-5" = {
      cidr = "10.0.102.0/24",
      az   = "eu-west-1b"
    },
    "subnet-6" = {
      cidr = "10.0.103.0/24",
      az   = "eu-west-1c"
    }
  }

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}

