variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "List of CIDR blocks allowed to access EC2 instances via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"] 
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances (e.g., Ubuntu, Amazon Linux)"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" 
}

variable "instance_type" {
  description = "The EC2 instance type (e.g., t2.micro, t3.small)"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the existing EC2 key pair for SSH access"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "The ID of the first public subnet (for WebServer-1)"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "The ID of the second public subnet (for WebServer-2)"
  type        = string
}