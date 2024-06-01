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


resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name  = "scale-out-during-business-hours"
  autoscaling_group_name = module.webserver_cluster.asg_name
  min_size = 1
  max_size = 3
  desired_capacity = 2
  recurrence = "0 9 * * *"
}

resource "aws_autoscaling_schedule" "scale_in_after_business_hours" {
  scheduled_action_name  = "scale-in-after-business-hours"
  autoscaling_group_name = module.webserver_cluster.asg_name
  min_size = 1
  max_size = 3
  desired_capacity = 2
  recurrence = "0 17 * * *"
}