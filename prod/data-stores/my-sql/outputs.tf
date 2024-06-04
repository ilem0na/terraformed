output address {
  value = module.sql_relational_database.address
  description = "The address of the database for connection"
}

output "port" {
  value = module.sql_relational_database.port 
  description = "The port of the database for connection"
  
}