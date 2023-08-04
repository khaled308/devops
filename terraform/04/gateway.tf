# internet gateway
resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
}

# nat gateway
resource "aws_eip" "my_eip" {
    vpc = true
}

resource "aws_nat_gateway" "my_nat_gateway" {
    allocation_id = aws_eip.my_eip.id
    subnet_id = aws_subnet.my_public_subnet.id
}