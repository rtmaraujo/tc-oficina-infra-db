output "db_endpoint" {
  description = "Endpoint do banco de dados"
  value       = aws_db_instance.tc.endpoint
}

output "db_name" {
  description = "Nome do banco"
  value       = aws_db_instance.tc.db_name
}

output "db_username" {
  description = "Usuario do banco"
  value       = aws_db_instance.tc.username
}

output "db_port" {
  description = "Porta do banco"
  value       = aws_db_instance.tc.port
}
