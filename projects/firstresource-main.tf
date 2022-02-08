provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "db" {
  ami = "ami-0231217be14a6f3ba"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

resource "aws_instance" "web" {
  ami = "ami-0231217be14a6f3ba"
  instance_type = "t2.micro"
  depends_on = [
    aws_instance.db
  ]
}

data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}
