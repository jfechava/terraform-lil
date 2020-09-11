
resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.environment-example-two.id
  cidr_block = cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.environment-example-two.id
  cidr_block = cidrsubnet(aws_vpc.environment-example-two.cidr_block, 2, 2)
  availability_zone = "us-east-1c"
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = aws_vpc.environment-example-two.id

  ingress {
    cidr_blocks = [
      aws_vpc.environment-example-two.cidr_block
    ]
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }
}