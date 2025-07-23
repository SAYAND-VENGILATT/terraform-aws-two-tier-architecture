data "aws_route53_zone" "selected" {
  name         = var.zone_name
  private_zone = false
}

resource "aws_route53_record" "app_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.record_name
  type    = "CNAME"
  ttl     = 300
  records = [var.alb_dns]
}
