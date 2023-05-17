source "amazon-ebs" "region1" {

  access_key = var.access_key
  secret_key = var.secret_key

  source_ami    = var.ami[var.regions.region1]
  ami_name      = local.image-name
  instance_type = "t2.micro"
  region        = var.regions.region1
  ssh_username  = "ec2-user"

  tags = {
    Name    = local.image-name
    project = var.project
    env     = var.env
  }
}

source "amazon-ebs" "region2" {

  access_key = var.access_key
  secret_key = var.secret_key

  source_ami    = var.ami[var.regions.region2]
  ami_name      = local.image-name
  instance_type = "t2.micro"
  region        = var.regions.region2
  ssh_username  = "ec2-user"

  tags = {
    Name    = local.image-name
    project = var.project
    env     = var.env
  }
}

build {
  sources = [
    "source.amazon-ebs.region1",
    "source.amazon-ebs.region2"
  ]

  provisioner "shell" {
    script          = "userdata.sh"
    execute_command = "sudo {{.Path}}"
  }
}