provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "web_server" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"
    key_name = aws_key_pair.server_key.key_name
    security_groups = [aws_security_group.web_security_group.name]
    tags = {
        Name = "web-server"
    }

     provisioner "file" {
        source      = "./install-nginx.sh"
        destination = "/tmp/install-nginx.sh"
    }
    provisioner "remote-exec" {
      inline = [ 
        "chmod +x /tmp/install-nginx.sh",
        "sudo /tmp/install-nginx.sh"
       ]
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        host = self.public_ip
        private_key = file("~/.ssh/id_rsa")
    }
}

resource "aws_key_pair" "server_key" {
    key_name = "server-key"
    public_key = var.public_key
}

resource "aws_security_group" "web_security_group" {
  name        = "web-config"
  description = "Example Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
