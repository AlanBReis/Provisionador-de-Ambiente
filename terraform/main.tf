# Define o provedor AWS
provider "aws" {
  region = "us-west-2"
}

# Define o recurso de uma instância EC2
resource "aws_instance" "dev_instance" {
  ami           = "ami-05134c8ef96964280" # ID da AMI do Ubuntu
  instance_type = "t2.micro"

  tags = {
    Name = "DevInstance"
  }
}

# Define a saída da instância para acesso posterior
output "instance_ip" {
  value = aws_instance.dev_instance.public_ip
}
