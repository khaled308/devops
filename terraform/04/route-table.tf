# public route table
resource "aws_route_table" "my_route_table-01" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.my_route_table-01.id
}

# private route table
resource "aws_route_table" "my_route_table-02" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
    }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.my_private_subnet.id
  route_table_id = aws_route_table.my_route_table-02.id
}