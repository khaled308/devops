resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "my_public_subnet"{
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.0/25"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "my_private_subnet"{
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.128/25"
}

resource "aws_key_pair" "my_key_pair" {
    key_name = "my-key-pair"
    public_key = var.public_key
}

resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "ssh access"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "public_instance" {
    ami = var.free_tier_ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.my_key_pair.key_name
    subnet_id = aws_subnet.my_public_subnet.id
    security_groups = [aws_security_group.my_security_group.id]

    provisioner "file" {
        source      = var.private_key_path
        destination = "~/.ssh/id_rsa"
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = file("~/.ssh/id_rsa")
    }
}
 
resource "aws_instance" "private_instance" {
    ami = var.free_tier_ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.my_key_pair.key_name
    subnet_id = aws_subnet.my_private_subnet.id
    security_groups = [aws_security_group.my_security_group.id]
}
