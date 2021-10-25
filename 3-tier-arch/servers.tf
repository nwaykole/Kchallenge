#Create EC2 Instance for web servers
resource "aws_instance" "webserver1" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-1.id


  tags = {
    Name = "Web Server 1"
  }

}

resource "aws_instance" "webserver2" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-2.id

  tags = {
    Name = "Web Server2"
  }

}

#Create EC2 Instance for app server 1
resource "aws_instance" "appserver1" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.appserver-sg.id]
  subnet_id              = aws_subnet.application-subnet-1.id

  tags = {
    Name = "App Server1"
  }

}

#Create EC2 Instance for app server 2
resource "aws_instance" "appserver2" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.appserver-sg.id]
  subnet_id              = aws_subnet.application-subnet-2.id

  tags = {
    Name = "App Server2"
  }

}
