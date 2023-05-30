resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  cidr_block = var.public_subnet_cidr_blocks[count.index]
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "example-public-subnet-${count.index}"
  }
}


#resource "aws_subnet" "public" {
#  vpc_id     = aws_vpc.main.id
#  cidr_block = "10.0.1.0/24"
#
#  tags = {
#    Name = "Public"
#  }
#}



resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  cidr_block = var.private_subnet_cidr_blocks[count.index]
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "example-private-subnet-${count.index}"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
  
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}
