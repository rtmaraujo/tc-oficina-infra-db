resource "aws_db_subnet_group" "tc" {
  name       = "tc-oficina-db-subnet-group"
  subnet_ids = data.aws_subnets.private.ids

  tags = {
    Name = "tc-oficina-db-subnet-group"
  }
}

resource "aws_security_group" "tc_db" {
  name        = "tc-oficina-db-sg"
  description = "Security group do RDS PostgreSQL"
  vpc_id      = data.aws_vpc.tc.id

  ingress {
    description = "Acesso a partir do security group da aplicacao no EKS"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tc-oficina-db-sg"
  }
}

resource "aws_db_instance" "tc" {
  identifier     = "tc-oficina-db"
  engine         = "postgres"
  engine_version = "15.7"

  instance_class = var.db_instance_class

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  allocated_storage       = var.allocated_storage
  storage_type            = "gp3"
  storage_encrypted       = true
  backup_retention_period = var.backup_retention_days
  multi_az                = var.multi_az
  publicly_accessible     = false

  db_subnet_group_name   = aws_db_subnet_group.tc.name
  vpc_security_group_ids = [aws_security_group.tc_db.id]

  skip_final_snapshot       = false
  final_snapshot_identifier = "tc-oficina-db-final"

  tags = {
    Name        = "tc-oficina-db"
    Environment = var.environment
  }
}
