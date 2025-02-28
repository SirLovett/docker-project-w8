#create ec2 instances 

resource "aws_instance" "DockerInstance" {
  ami                    = data.aws_ami.amazon-2.id
  instance_type          = "t2.medium"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  key_name               = aws_key_pair.ec2_key.key_name
  user_data              = file("install.sh")
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  tags = {
    Name = "docker-instance"
  }

}
