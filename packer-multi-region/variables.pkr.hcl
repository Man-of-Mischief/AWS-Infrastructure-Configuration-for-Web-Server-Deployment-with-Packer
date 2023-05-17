variable "access_key" {
  default = "gdsgdfgfnmhvjhbkvgf"
}

variable "secret_key" {
  default = "gdsfxdgfhgdsfg+asgdbhdrsafersfd"
}

variable "project" {
  default = "zomato"
}

variable "env" {
  default = "prod"
}

locals {
  random-number = uuidv4()
}

locals {
  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
}

locals {
  image-name = "${var.project}-${var.env}-${local.random-number}--${local.image-timestamp}"
}

variable "regions" {
  type = map(string)
  default = {
    "region1" = "ap-south-1"
    "region2" = "us-east-2"
  }
}

variable "ami" {
  type = map(string)
  default = {
    "ap-south-1" = "ami-0b08bfc6ff7069aff"
    "us-east-2"  = "ami-08333bccc35d71140"
  }
}
