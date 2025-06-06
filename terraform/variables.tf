variable "region" {
  default = "us-east-1"  # 👉 Replace with your AWS region
}

variable "aws_access_key" {
  type = string
  default = "aws_access_key"  # 👉 Replace in GitHub secrets
}

variable "aws_secret_key" {
  type = string
  default = "aws_secret_key" # 👉 Replace in GitHub secrets
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "github-keypair"   # 👉 Replace with your real AWS key pair name
}
