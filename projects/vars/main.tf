provider "aws" {
  region = "us-east-2"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "testEC2instance" {
  ami = "ami-0231217be14a6f3ba"
  instance_type = "t2.micro"
  count = var.number_of_servers
}
