provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
  cluster_name = "prod_webservers"
  db_remote_state_bucket = "Terraform-ilemona"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate-il"
  region = "us-east-2"
  instance_type = "t2.micro"
  min_size = 2
  max_size = 3
}



terraform {
  backend "s3" {
    bucket = "terraform-ilemona"
    region = "us-east-2"
    key = "prod-env/webserver-cluster/terraform.tfstate"
    dynamodb_table = "terraform-locks-il"
    encrypt = true
  }
}


