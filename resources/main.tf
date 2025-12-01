resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ "sg-07306e019683163e7" ]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z055196614WSVQYU4VYMA"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 50
  records = [aws_instance.frontend.private_ip]
}