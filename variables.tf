variable "aws_region" {
  default = "us-east-1"
}
variable "project_name" {
  type        = string
  description = "Project name"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "allowed_ssh_cidrs" {
  description = "List of CIDR blocks allowed to access EC2 instances via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"] 
}
variable "key_name" {
  description = "The name of the existing EC2 key pair for SSH access"
  type        = string
}
variable "instance_type" {
  description = "The EC2 instance type (e.g., t2.micro, t3.small)"
  type        = string
  default     = "t2.micro"
}
variable "ami_id" {
  description = "The AMI ID for the EC2 instances (e.g., Ubuntu, Amazon Linux)"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" 
}
variable "aws_region" {
  type        = string
  description = "AWS region"
}
variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}
variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  type = string
}



variable "private_subnet_2_cidr" {
  type = string
}
variable "subnet_ids" {
  description = "List of private subnet IDs for the RDS subnet group"
  type        = list(string)
}


#RDS
variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}
variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}
variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}
variable "instance_class" {
  description = "Instance class/type for the RDS"
  type        = string
  default     = "db.t3.micro"
}
variable "vpc_id" {
  description = "VPC ID to launch the RDS instance in"
  type        = string
}



variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}


#route53
variable "alb_dns" {
  description = "DNS name of the ALB"
  type        = string
}

variable "zone_name" {
  description = "Route53 hosted zone name (e.g., example.com)"
  type        = string
}

variable "record_name" {
  description = "Record name to create (e.g., www)"
  type        = string
}
