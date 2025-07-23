aws_region              = "us-east-1"
project_name            = "Two-Tier AWS Infrastructure with Terraform"

vpc_cidr                = "10.0.0.0/16"
subnet_ids              = ["10.0.1.0/24","10.0.2.0/24"]
public_subnet_1_cidr    = "10.0.1.0/24"
public_subnet_2_cidr    = "10.0.2.0/24"
private_subnet_1_cidr   = "10.0.3.0/24"
private_subnet_2_cidr   = "10.0.4.0/24"
allowed_ssh_cidrs       ="103.177.27.114"
instance_type           ="t2.micro"

availability_zone_1      = "ap-south-1a"
availability_zone_2      = "ap-south-1b"


# RDS variables
db_name           = "mydb"
db_username       = "admin"
db_password       = "MySecurePassword123!"
instance_class = "db.t3.micro"

#Route53
route53_zone_name   = "example.com"  # replace with your actual domain
route53_record_name = "www"
route53_alb_dns     ="dns name of alb"

