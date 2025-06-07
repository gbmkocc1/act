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
            "token.actions.githubusercontent.com:sub": "repo:gbmkocc1/act:*"
          }
        }
      }
    ]
  })

  description = "IAM Role for GitHub Actions in gbmkocc1/act repo"
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
          "eks:*",
          "iam:PassRole",
          "ec2:*",
          "s3:*",
          "sts:AssumeRole"
        ],
        Resource = "*"
      }
    ]
  })
}
