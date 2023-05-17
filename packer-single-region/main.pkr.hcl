source "amazon-ebs" "region" {

  access_key = var.access_key
  secret_key = var.secret_key

  source_ami    = var.source_ami
  ami_name      = local.image-name
  instance_type = "t2.micro"
  region        = var.region
  ssh_username  = "ec2-user"

  tags = {
    Name    = local.image-name
    project = var.project
    env     = var.env
  }
}

build {
  sources = [
    "source.amazon-ebs.region"
  ]

  provisioner "shell" {
    script          = "userdata.sh"
    execute_command = "sudo {{.Path}}"
  }
}