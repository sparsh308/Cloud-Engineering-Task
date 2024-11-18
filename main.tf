provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  name    = "static-app-vpc"
  cidr    = "10.0.0.0/16"
  azs     = ["us-west-2a", "us-west-2b"]
  subnets = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "19.10.0"
  cluster_name    = "static-app-cluster"
  cluster_version = "1.27"
  subnets         = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id
  node_groups = {
    general = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }
}
