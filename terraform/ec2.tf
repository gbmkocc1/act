resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["188.31.175.209/32"] # 🔥 For demo only — change to your IP in prod
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = "ami-0c02fb55956c7d316"  # Amazon Linux 2 in us-east-1
  instance_type               = "t2.micro"
  key_name                    = var.key_name             # 👈 Provide SSH key name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  
  tags = {
    Name = "bastion-host"
  }
}
