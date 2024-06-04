provider "aws" {
  region = "us-east-2"
}

module "sql_relational_database" {
  source = "../../../modules/data-stores/my-sql"
  db_env = var.stage
  db_username = var.db_username
  db_password = var.db_password

}

terraform {
  backend "s3" {
    bucket = "terraform-ilemona"
    region = "us-east-2"
    key = "prod/datastore/sql_relational_database/terraform.tfstate"
    dynamodb_table = "terraform-locks-il"
    encrypt = true
  }
}