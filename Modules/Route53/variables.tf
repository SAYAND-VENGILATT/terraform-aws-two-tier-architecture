variable "zone_name" {
  description = "The Route53 hosted zone name"
  type        = string
}

variable "record_name" {
  description = "The DNS record name to create"
  type        = string
}

variable "alb_dns" {
  description = "The DNS name of the ALB"
  type        = string
}
