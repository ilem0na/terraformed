variable "server_port" {
    description = "The port the server will use for HTTP requests"
    type = number
    default = 8080
}

variable "cluster_name" {
    description = "The name to use for all the cluster resources"
    type = string
}
variable "db_remote_state_bucket" {
    description = "The name of the S3 bucket for the database's remote state"
    type = string
}
variable "db_remote_state_key" {
    description = "The path for the database's remote state in S3"
    type = string
}

variable "region" {
  description = "region for resource "
  type = string
}

variable "instance_type" {
  description = "Type of VM to run e.g (t2.micro)"
  default = "t2.micro"
  type = string
}

variable "min_size" {
    description = "value of the minimum size for server"
    default = 2
    type = number
}

variable "max_size" {
    description = "value of the max size for server"
    default = 3
    type = number
}

variable "custom_tags" {
    description = "Custom tags to set on the Instances in the ASG"
    type = map(string)
    default = {}
}
