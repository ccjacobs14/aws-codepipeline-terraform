################################################################################
# S3 Bucket
################################################################################

resource "aws_s3_bucket" "that" {
  bucket_prefix = var.application_name

  force_destroy = true
}


################################################################################
# S3 Bucket policy
################################################################################

resource "aws_s3_bucket_policy" "that" {
  bucket = aws_s3_bucket.that.id

  policy = data.aws_iam_policy_document.s3.json
}


################################################################################
# S3 Bucket server side encryption Configuration
################################################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "that" {
  bucket = aws_s3_bucket.that.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.that.arn
      sse_algorithm     = "aws:kms"
    }
  }
}


################################################################################
# S3 Policies
################################################################################

data "aws_iam_policy_document" "s3" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }

    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObjectAcl",
      "s3:PutObject",
      "s3:ListBucket"
    ]

    resources = [aws_s3_bucket.that.arn, "${aws_s3_bucket.that.arn}/*"]

    condition {
      test     = "ArnEquals"
      variable = "AWS:SourceArn"
      values   = [aws_codepipeline.that.arn, aws_codebuild_project.that.arn]
    }
  }
}
