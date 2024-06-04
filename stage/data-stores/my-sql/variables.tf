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
  description = "The enviroment used in resurce creation"
  default = "staging-env"
  type = string
  
}