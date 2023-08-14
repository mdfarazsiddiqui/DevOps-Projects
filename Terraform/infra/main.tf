provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tf_server" {
  ami           = "ami-053b0d53c279acc90" # Amazon Linux 2 AMI ID for the desired region
  instance_type = "t2.micro"
  tags = {
    Name : "terraform-machine"
  }
}
