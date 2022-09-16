data "aws_vpc" "tf_data_vpc" {
  filter {
    name   = "tag:Name"
    values = ["Main VPC created through Terraform"]
  }
}

resource "aws_security_group" "tf_security_group_allow_traffic" {

  name        = "tf_security_group_allow_traffic"
  description = "Security group to control traffic"
  vpc_id      = data.aws_vpc.tf_data_vpc.id

  ingress {
    description = "Allow incoming SSH connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["89.246.68.120/32"]
  }

  ingress {
    description = "Allow incoming HTTP connection"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["89.246.68.120/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Security group to control traffic"
  }
}
