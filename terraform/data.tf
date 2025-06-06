data "aws_iam_policy_document" "bastion_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "s3_access" {
  statement {
    actions = ["s3:GetObject", "s3:ListBucket"]

    resources = [
      "arn:aws:s3:::my-bucket",
      "arn:aws:s3:::my-bucket/*"
    ]
  }
}
