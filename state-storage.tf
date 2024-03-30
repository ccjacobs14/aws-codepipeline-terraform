module "state_storage" {
  source = "./modules"

  aws_kms_alias                       = "terraform-state-storage-c14"
  tf_state_storage_bucket_name        = "terraform-state-storage-c14"
  tf_state_storage_dynamodb_lock_name = "terraform-state-storage-c14"
  aws_account_id                      = data.aws_caller_identity.current.account_id
}

