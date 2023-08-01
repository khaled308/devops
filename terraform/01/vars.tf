variable "instance_count" {
  default = 1
}

variable "instance_type" {
    default = "t2.micro"
}

variable "instance_ami" {
    default = "ami-0c55b159cbfafe1f0"
}

variable "region" {
    default = "us-east-2"
}