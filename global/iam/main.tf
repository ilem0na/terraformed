provider "aws" {
  region = "us-east-2"
}

module "users" {
  source = "../../modules/landing-zone/iam-user"
  for_each = toset(var.usernames)
  usernames = each.value
}
