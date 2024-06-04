provider "aws" {
  region = "us-east-2"
  
}


resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-${lower(var.db_env)}-ilemona"
  instance_class = "db.t3.micro"
  engine_version = "8.0"
  allocated_storage = 10
  engine = "mysql"
  skip_final_snapshot = true
  db_name = "ile${replace(var.db_env, "-", "")}database"

  username = var.db_username
  password = var.db_password
}


/*
terraform {
    backend "s3" {
        bucket = "terraform-ilemona"
        key = "data-stores/mysql/terraform.tfstate-il"
        region = "us-east-2"
        dynamodb_table = "terraform-locks-il"
        encrypt = true
    }
}
*/