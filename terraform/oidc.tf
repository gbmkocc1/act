resource "aws_iam_role" "github_oidc_role" {
  name = "GitHubOIDCRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::784434437104:oidc-provider/token.actions.githubusercontent.com"
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub": "repo:gbmkocc1:*"
          }
        }
      }
    ]
  })

  description = "IAM Role for GitHub Actions in gbmkocc1"
}

resource "aws_iam_role_policy" "github_oidc_policy" {
  name = "GitHubOIDCPolicy"
  role = aws_iam_role.github_oidc_role.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "iam:*",
          "eks:*",
          "ec2:*",
          "s3:*",
          "logs:*",
          "sts:*",
          "kms:DescribeKey",
          "kms:GetKeyPolicy",
          "kms:GetKeyRotationStatus",
          "kms:ListAliases",
          "kms:ListKeys",
          "kms:ListResourceTags",
          "kms:Decrypt",
          "kms:Encrypt",
          "kms:GenerateDataKey*",
          "kms:PutKeyPolicy"              # ✅ FINAL KMS PERMISSION
        ],
        Resource = "*"
      }
    ]
  })
}
