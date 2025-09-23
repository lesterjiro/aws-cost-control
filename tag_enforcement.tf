resource "aws_iam_policy" "enforce_tags" {
  name        = "EnforceTags"
  description = "Deny creating EC2/S3 without Project tag"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Deny"
        Action = [
          "ec2:RunInstances",
          "s3:CreateBucket"
        ]
        Resource = "*"
        Condition = {
          StringNotEqualsIfExists = {
            "aws:RequestTag/Project" = "required"
          }
        }
      }
    ]
  })
}

resource "aws_iam_group" "devs" {
  name = "devs"
}

resource "aws_iam_group_policy_attachment" "attach" {
  group      = aws_iam_group.devs.name
  policy_arn = aws_iam_policy.enforce_tags.arn
}
