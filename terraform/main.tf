# Network

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/25"

  tags = {
    Name = "Main"
  }
}

# Instance

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
