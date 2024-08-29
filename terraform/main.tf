provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "web_sg" {
  name        = "projeto-provisionador"
  description = "Security group for web server"
  vpc_id      = "vpc-01c1aa5e38c59e8ca"  

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "projeto-provisionador"
  }
}

#resource "aws_key_pair" "key_pair" {
#  key_name   = "keypair-provisionador"
#  public_key = file("C:\\Users\\alanz\\.ssh\\id_rsa.pub")  # Caminho absoluto correto para a chave pública
#}

resource "aws_instance" "dev_instance" {
  ami           = "ami-05134c8ef96964280" # ID da AMI do Ubuntu
  instance_type = "t2.micro"

  tags = {
    Name = "Projeto-Provisionador"
  }

  user_data = file("D:\\PROGRAMMER\\Provisionador-de-Ambiente\\script\\setup.sh")  # Caminho absoluto correto para o script de inicialização
}

output "instance_ip" {
  value = aws_instance.dev_instance.public_ip
}
