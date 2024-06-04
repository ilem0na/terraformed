variable "db_username" {
  description = "username of the db instance"
  type = string
  sensitive = true
}

variable "db_password" {
  description = "db password for RDS instance"
  type = string
  sensitive = true
}


variable "stage" {
  description = "enviroment for prod"
  default = "prod"
}