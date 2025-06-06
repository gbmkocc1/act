variable "region" {
  default = "us-east-1"  # 👉 Replace with your AWS region
}

variable "aws_access_key" {
  type = string
  default = "AWS_ACCESS_KEY_ID"  # 👉 Replace in GitHub secrets
}

variable "aws_secret_key" {
  type = string
  default = "AWS_SECRET_ACCESS_KEY" # 👉 Replace in GitHub secrets
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "github-keypair"   # 👉 Replace with your real AWS key pair name
}
