################################################################################
# Set required providers and version
################################################################################

terraform {
  backend "s3" {
    bucket = "terraform-state-storage-c1414103443790" 
    region = "us-east-1"
    key    = "global/s3/terraform.tfstate"
    dynamodb_table = "terraform-state-storage-c14"
    encrypt        = true
    kms_key_id     = "alias/terraform-state-storage-c14"

  }
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


################################################################################
# S3 Bucket
################################################################################

#resource "aws_s3_bucket" "that" {
#  bucket_prefix = "that-is-a-test-bucket-with-a-name-that-is-way-to-long-why-oh-i-cant-believe-it"
#}

