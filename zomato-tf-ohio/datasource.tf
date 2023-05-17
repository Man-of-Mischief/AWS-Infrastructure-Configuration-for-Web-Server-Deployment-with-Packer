#### data source to find ami

data "aws_ami" "ami" {

  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["zomato-prod-*"]
  }

  filter {
    name   = "tag:project"
    values = ["zomato"]
  }

  filter {
    name   = "tag:env"
    values = ["prod"]
  }
}

######## data source to find hosted zone ID

data "aws_route53_zone" "zone" {
  name         = var.domain
  private_zone = false
}