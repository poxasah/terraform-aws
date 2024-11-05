##################
# IAM Policy Read/Write to Keyspaces sabrina-keyspaces-demo
#####

resource "aws_iam_policy" "keyspaces_iam_policy_write" {
  name        = "${var.project_owner}-${var.project}-write-${var.datacenter}"
  description = "IAM Policy Read/Write to Keyspaces sabrina-keyspaces-demo"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
          "cassandra:UpdatePartitioner",
          "cassandra:Drop",
          "cassandra:Create",
          "cassandra:Alter",
          "cassandra:Select",
          "cassandra:Restore",
          "cassandra:Modify"
        ],
        "Resource": [
          "arn:aws:cassandra:${var.region}:${data.aws_caller_identity.current.account_id}:/keyspace/sabrina-keyspaces-demo/*",
          "arn:aws:cassandra:${var.region}:${data.aws_caller_identity.current.account_id}:/keyspace/system*"
        ]
      }
    ]
  })
  tags = {
    Project      = var.project
    ProjectOwner = var.project_owner
    Multidc      = var.datacenter
    application  = "sabrina-keyspaces-demo"
  }
}

##################
# IAM Groups
#####

resource "aws_iam_group" "keyspaces_iam_group_write" {
  name = "${var.project_owner}-${var.project}-write-${var.datacenter}"
}

##################
# Associate Policy with Groups
#####

resource "aws_iam_group_policy_attachment" "attachment_keyspaces_iam_group_write" {
  group      = aws_iam_group.keyspaces_iam_group_write.id
  policy_arn = aws_iam_policy.keyspaces_iam_policy_write.arn
}

##################
# Associate Groups with Existing User
#####

resource "aws_iam_user_group_membership" "attachment_keyspaces_iam_user_write" {
  user = var.keyspaces_iam_user_wr_name
  groups = [aws_iam_group.keyspaces_iam_group_write.name]
}