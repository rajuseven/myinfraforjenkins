provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  default = [
    "jenkins",
    "tomcat-1",
    "tomcat-2",
    "monitoring-server"
  ]
}

variable "key_pair" {
  default = "terraform"
}

resource "aws_instance" "one" {
  count = length(var.instance_names)

  ami           = "ami-06b5375e3af24939c"
  instance_type = "t2.medium"
  key_name      = var.key_pair

  tags = {
    Name = var.instance_names[count.index]
  }
}
