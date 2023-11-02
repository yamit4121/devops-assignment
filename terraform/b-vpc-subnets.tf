resource "aws_vpc" "devops-vpc" {
  cidr_block = "10.0.0.0/8"

  tags = {
    Name = "devops-vpc"
  }
}

resource "aws_subnet" "private-ap-south-1a" {
  vpc_id            = aws_vpc.devops-vpc.id
  cidr_block        = "10.1.0.0/16"
  availability_zone = "ap-south-1a"

}

resource "aws_subnet" "private-ap-south-1b" {
  vpc_id            = aws_vpc.devops-vpc.id
  cidr_block        = "10.2.0.0/16"
  availability_zone = "ap-south-1b"

}

resource "aws_subnet" "public-ap-south-1a" {
  vpc_id                  = aws_vpc.devops-vpc.id
  cidr_block              = "10.3.0.0/16"
  availability_zone       = "ap-south-1a"

}

resource "aws_subnet" "public-ap-south-1b" {
  vpc_id                  = aws_vpc.devops-vpc.id
  cidr_block              = "10.2.0.0/16"
  availability_zone       = "ap-south-1b"

}
