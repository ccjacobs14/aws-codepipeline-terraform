resource "aws_codecommit_repository" "that" {
  repository_name = var.application_name
}
