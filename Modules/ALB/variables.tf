variable "project_name" {
  description = "Name prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "ec2_instance_ids" {
  description = "List of EC2 instance IDs to attach to target group"
  type        = list(string)
}
