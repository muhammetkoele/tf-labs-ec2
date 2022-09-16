data "aws_subnet" "tf_data_subnet" {
  filter {
    name   = "tag:Name"
    values = ["Public Subnet 1"]
  }
}

resource "aws_instance" "tf_instance" {
  subnet_id              = data.aws_subnet.tf_data_subnet.id
  instance_type          = "t2.small"
  ami                    = "ami-065deacbcaac64cf2"
  vpc_security_group_ids = [aws_security_group.tf_security_group_allow_traffic.id]
  key_name               = "talent-academy-ec2"
}
