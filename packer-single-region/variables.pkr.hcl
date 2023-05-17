variable "access_key" {
  default = "fdsfdgfhgdsdadf"
}

variable "secret_key" {
  default = "fdsdg+efwrtgrerztgdxdgytr"
}

variable "project" {
  default = "zomato"
}

variable "env" {
  default = "prod"
}

variable "region"{
    default = "ap-south-1"
}

variable "source_ami"{
    default = "ami-0b08bfc6ff7069aff"
}

locals {
  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"

}

locals {
  image-name = "${var.project}-${var.env}-${local.image-timestamp}"
}

