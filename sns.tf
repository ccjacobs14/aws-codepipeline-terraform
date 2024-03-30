################################################################################
# SNS Topic
################################################################################

resource "aws_sns_topic" "that" {
  name         = var.application_name
  display_name = var.application_name
}


################################################################################
# SNS Topic Policy
################################################################################

resource "aws_sns_topic_policy" "that" {
  arn = aws_sns_topic.that.arn

  policy = data.aws_iam_policy_document.sns.json
}

data "aws_iam_policy_document" "sns" {
  statement {
    actions = [
      "SNS:Publish"
    ]
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
    resources = [
      aws_sns_topic.that.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_codepipeline.that.arn]
    }
  }
}


################################################################################
# SNS Subscription
################################################################################

resource "aws_sns_topic_subscription" "that" {
  topic_arn = aws_sns_topic.that.arn
  protocol  = "email"
  endpoint  = var.sns_endpoint
}
