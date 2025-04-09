resource "random_password" "db_password" {
    length = 16
    special = true
    override_special = " _!%"
}

resource "aws_secretsmanager_secret" "db_secret" {
    name = "dev-db-password"
  
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
    secret_id = aws_secretsmanager_secret.db_secret.id
    secret_string = random_password.db_password.result
  
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = aws_secretsmanager_secret.db_secret.id
}

resource "aws_db_subnet_group" "dev_subnet_group" {
    name = "dev-db-subnet-group"
    subnet_ids =  [
        aws_subnet.subnet1-public.id,
        aws_subnet.subnet2-public.id,
        aws_subnet.subnet3-public.id
    ]
    tags = {
      Name = "Dev Db subnet Group"
    }
    }
  


resource "aws_db_instance" "dev_db_instance" {
    identifier = "devdb"
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.medium"
    db_name = "dev_db"
    username  = 
    password = data.aws_secretsmanager_secret_version.db_secret_version.secret_string
    publicly_accessible = true 
    db_subnet_group_name = aws_db_subnet_group.dev_subnet_group.id 
  
}

