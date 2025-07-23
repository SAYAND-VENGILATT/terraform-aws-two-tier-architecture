terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_id=var.vpc_id
  vpc_cidr = var.vpc_cidr
  aws_region = var.aws_region
  project_name = var.project_name
 availability_zone_1=var.availability_zone_1
 availability_zone_2 = var.availability_zone_2
 public_subnet_1_cidr=var.public_subnet_1_cidr
 public_subnet_2_cidr = var.public_subnet_2_cidr
 private_subnet_1_cidr= var.private_subnet_1_cidr
 private_subnet_2_cidr = var.private_subnet_2_cidr

}

module "ec2" {
  source        = "./modules/ec2"
  vpc_id        = module.vpc.vpc_id
 public_subnet_1_cidr = module.vpc.public_subnet_1_cidr
 public_subnet_2_cidr = module.vpc.public_subnet_2_cidr
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  allowed_ssh_cidrs =var.allowed_ssh_cidrs
}


module "rds" {
  source         = "./modules/rds"
  project_name   =var.project_name
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
  db_name        = var.db_name
  db_username    = var.db_username
  db_password    = var.db_password
  instance_class = var.instance_class
}


module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids= module.vpc.public_subnet_ids
  ec2_instance_ids = module.ec2.instance_ids
  project_name = var.project_name
}

module "cloudfront" {
  source = "./modules/cloudfront"
  alb_dns = module.alb.dns_name
  project_name = var.project_name
}

module "waf" {
  source = "./modules/waf"
  project_name = var.project_name
}

module "route53" {
  source   = "./modules/route53"
  alb_dns  = module.alb.dns_name
  zone_name = var.zone_name
  record_name = var.record_name
}
