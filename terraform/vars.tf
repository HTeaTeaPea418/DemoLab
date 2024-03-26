variable "PATH_TO_PUBLIC_KEY" {
  default = "./keys/terraformkey.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  # Add the path to the private key you made in AWS like below
  # default = "./keys/terraform-key.pem"
  default = "YOUR_PRIVATE_KEY"
}

variable "VPC_CIDR" {
  default = "10.0.0.0/16"
}

variable "FIRST_SUBNET_CIDR" {
  default = "10.0.1.0/24"
}

variable "SECOND_SUBNET_CIDR" {
  default = "10.0.2.0/24"
}

variable "FIRST_DC_IP" {
  default = "10.0.1.100"
}

variable "USER_SERVER_IP" {
  default = "10.0.1.50"
}

variable "SECOND_DC_IP" {
  default = "10.0.2.100"
}

variable "PUBLIC_DNS" {
  default = "1.1.1.1"
}

variable "MANAGEMENT_IPS" {
  default = []
}

variable "SSM_S3_BUCKET" {
  default = "adlabstorage"
}

variable "ENVIRONMENT" {
  default = "deploy"
}

variable "DC_VM_SIZE" {
  default = "t2.medium"
}

variable "SERVER_VM_SIZE" {
  default = "t2.small"
}

data "aws_ami" "latest-windows-server" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}

data "aws_ami" "first-dc" {
  most_recent = true
  owners      = ["self"]
  count       = var.ENVIRONMENT == "deploy" ? 1 : 0
  filter {
    name   = "name"
    values = ["*-First-DC*"]
  }
}

data "aws_ami" "second-dc" {
  most_recent = true
  owners      = ["self"]
  count       = var.ENVIRONMENT == "deploy" ? 1 : 0
  filter {
    name   = "name"
    values = ["*-Second-DC*"]
  }
}

data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}