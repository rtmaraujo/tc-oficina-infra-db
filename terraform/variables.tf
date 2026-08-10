variable "aws_region" {
  description = "Regiao da AWS"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "prod"
}

variable "db_name" {
  description = "Nome do banco de dados"
  type        = string
  default     = "oficina_db"
}

variable "db_username" {
  description = "Usuario do banco"
  type        = string
  default     = "oficina_user"
}

variable "db_password" {
  description = "Senha do banco (informar via tfvars ou Secret Manager)"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Classe da instancia RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Armazenamento alocado em GB"
  type        = number
  default     = 20
}

variable "backup_retention_days" {
  description = "Dias de retencao de backup"
  type        = number
  default     = 7
}

variable "multi_az" {
  description = "Habilita Multi-AZ para alta disponibilidade"
  type        = bool
  default     = false
}

variable "allowed_cidr_blocks" {
  description = "CIDRs permitidos para acesso ao banco"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
