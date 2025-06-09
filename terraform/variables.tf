variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1" # You can override via CLI or tfvars
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
  default     = "newkey"   # 👉 Replace with your real AWS key pair name
}

variable "cluster_encryption_config" {
  description = "EKS encryption config"
  type = object({
    provider_key_arn = string
    resources        = list(string)
  })
  default = {
    provider_key_arn = ""        # fallback if not using an external KMS key
    resources        = ["secrets"]
  }
}
