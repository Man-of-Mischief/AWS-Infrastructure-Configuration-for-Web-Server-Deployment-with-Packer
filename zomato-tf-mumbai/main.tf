#### adding a record using zone ID

resource "aws_route53_record" "webserver" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = var.record
  type    = "A"
  ttl     = "5"
  records = [aws_eip.frontend_eip.public_ip]
}

#### EIP for frontend

resource "aws_eip" "frontend_eip" {
  instance = aws_instance.webserver.id
  vpc      = true
  tags = {
    Name = "frontend_eip"
  }
}

######### Keypair creation

resource "aws_key_pair" "mykey" {
  key_name   = "zomato"
  public_key = file("zomato-keypair.pub")
  tags = {
    Name      = "zomato"
    "project" = "zomato"
    "env"     = "dev"
  }
}

########## SGs

resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "Allow ssh, http and https traffic"

  ingress {
    description      = "HTTPS Port"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP Port"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name      = "webserver"
    "project" = "zomato"
    "env"     = "dev"
  }
}

######### EC2 Instance

resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.ami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.webserver.id]
  tags = {
    Name      = "webserver"
    "project" = "devops"
    "env"     = "dev"
  }

  lifecycle {
    create_before_destroy = true
  }
}
 