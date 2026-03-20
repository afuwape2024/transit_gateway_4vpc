module "detroit_vpc" {
  source = "../../modules/1detroit_vpc"
  detroit_vpc                    = var.detroit_vpc
  detroit_vpc_cidr_block         = var.detroit_vpc_cidr_block
  detroit_web_subnet_cidr_block  = var.detroit_web_subnet_cidr_block
  detroit_app_subnet_cidr_block  = var.detroit_app_subnet_cidr_block
  detroit_database_subnet_cidr_block = var.detroit_database_subnet_cidr_block
  availability_zones             = var.availability_zones
}

module "chicago_vpc" {
  source = "../../modules/2chicago_vpc"

  chicago_vpc                   = var.chicago_vpc
  chicago_vpc_cidr_block        = var.chicago_vpc_cidr_block
  chicago_web_subnet_cidr_block = var.chicago_web_subnet_cidr_block
  chicago_app_subnet_cidr_block = var.chicago_app_subnet_cidr_block
  chicago_database_subnet_cidr_block  = var.chicago_database_subnet_cidr_block
  availability_zones            = var.availability_zones
}


module "columbus_vpc" {
  source = "../../modules/3columbus_vpc"

  columbus_vpc                   = var.columbus_vpc
  columbus_vpc_cidr_block        = var.columbus_vpc_cidr_block
  columbus_web_subnet_cidr_block = var.columbus_web_subnet_cidr_block
  columbus_app_subnet_cidr_block = var.columbus_app_subnet_cidr_block
  columbus_database_subnet_cidr_block  = var.columbus_database_subnet_cidr_block
  availability_zones             = var.availability_zones
}

module "indianapolis_vpc" {
  source = "../../modules/4indianapolis_vpc"

  indianapolis_vpc                   = var.indianapolis_vpc
  indianapolis_vpc_cidr_block        = var.indianapolis_vpc_cidr_block
  indianapolis_web_subnet_cidr_block = var.indianapolis_web_subnet_cidr_block
  indianapolis_app_subnet_cidr_block = var.indianapolis_app_subnet_cidr_block
  indianapolis_database_subnet_cidr_block  = var.indianapolis_database_subnet_cidr_block
  availability_zones             = var.availability_zones
}

module "internet_gateway" {
  source = "../../modules/5internet_gateway"
  chicago_vpc = module.chicago_vpc.chicago_vpc
  detroit_vpc = module.detroit_vpc.detroit_vpc
  columbus_vpc = module.columbus_vpc.columbus_vpc
  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
}

module "route_table" {
  source = "../../modules/6route_table"
  outside_cidr_block = var.outside_cidr_block

  detroit_vpc = module.detroit_vpc.detroit_vpc
  detroit_vpc_public_subnet = module.detroit_vpc.detroit_vpc_web_subnet_0
  detroit_vpc_private_subnet = module.detroit_vpc.detroit_vpc_app_subnet_0
  detroit_vpc_public2_subnet = module.detroit_vpc.detroit_vpc_web_subnet_1
  detroit_vpc_private2_subnet = module.detroit_vpc.detroit_vpc_app_subnet_1
  detroit_vpc_igw = module.internet_gateway.detroit_vpc_igw
  
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_public_subnet = module.chicago_vpc.chicago_vpc_web_subnet_0
  chicago_vpc_private_subnet = module.chicago_vpc.chicago_vpc_app_subnet_0
  chicago_vpc_public2_subnet = module.chicago_vpc.chicago_vpc_web_subnet_1
  chicago_vpc_private2_subnet = module.chicago_vpc.chicago_vpc_app_subnet_1
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw 

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_public_subnet = module.columbus_vpc.columbus_vpc_web_subnet_0
  columbus_vpc_private_subnet = module.columbus_vpc.columbus_vpc_app_subnet_0
  columbus_vpc_public2_subnet = module.columbus_vpc.columbus_vpc_web_subnet_1
  columbus_vpc_private2_subnet = module.columbus_vpc.columbus_vpc_app_subnet_1
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw 

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_public_subnet = module.indianapolis_vpc.indianapolis_vpc_web_subnet_0
  indianapolis_vpc_private_subnet = module.indianapolis_vpc.indianapolis_vpc_app_subnet_0
  indianapolis_vpc_public2_subnet = module.indianapolis_vpc.indianapolis_vpc_web_subnet_1
  indianapolis_vpc_private2_subnet = module.indianapolis_vpc.indianapolis_vpc_app_subnet_1
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw   
  
}

module "network_acl" {
  source = "../../modules/7nacl"
  outside_cidr_block = local.outside_cidr_block
  web_nacl = local.web_nacl
  app_nacls = local.app_nacls
  database_nacls = local.database_nacls
  database_ports = local.ports

  detroit_vpc        = module.detroit_vpc.detroit_vpc
  detroit_vpc_igw    = module.internet_gateway.detroit_vpc_igw
  detroit_vpc_web_subnet  = module.detroit_vpc.detroit_vpc_web_subnet_0
  detroit_vpc_web2_subnet = module.detroit_vpc.detroit_vpc_web_subnet_1
  detroit_vpc_app_subnet  = module.detroit_vpc.detroit_vpc_app_subnet_0
  detroit_vpc_app2_subnet = module.detroit_vpc.detroit_vpc_app_subnet_1
 
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_web_subnet = module.chicago_vpc.chicago_vpc_web_subnet_0
  chicago_vpc_app_subnet = module.chicago_vpc.chicago_vpc_app_subnet_0
  chicago_vpc_web2_subnet = module.chicago_vpc.chicago_vpc_web_subnet_1
  chicago_vpc_app2_subnet = module.chicago_vpc.chicago_vpc_app_subnet_1

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_web_subnet = module.columbus_vpc.columbus_vpc_web_subnet_0
  columbus_vpc_app_subnet = module.columbus_vpc.columbus_vpc_app_subnet_0
  columbus_vpc_web2_subnet = module.columbus_vpc.columbus_vpc_web_subnet_1
  columbus_vpc_app2_subnet = module.columbus_vpc.columbus_vpc_app_subnet_1

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_web_subnet = module.indianapolis_vpc.indianapolis_vpc_web_subnet_0
  indianapolis_vpc_app_subnet = module.indianapolis_vpc.indianapolis_vpc_app_subnet_0
  indianapolis_vpc_web2_subnet = module.indianapolis_vpc.indianapolis_vpc_web_subnet_1
  indianapolis_vpc_app2_subnet = module.indianapolis_vpc.indianapolis_vpc_app_subnet_1
}

module "security_group" {
  source = "../../modules/8security_group"
  outside_cidr_block = local.outside_cidr_block
  detroit_vpc        = module.detroit_vpc.detroit_vpc
  detroit_vpc_igw    = module.internet_gateway.detroit_vpc_igw
  detroit_vpc_web_subnet  = module.detroit_vpc.detroit_vpc_web_subnet_0
  detroit_vpc_web2_subnet = module.detroit_vpc.detroit_vpc_web_subnet_1
  detroit_vpc_app_subnet  = module.detroit_vpc.detroit_vpc_app_subnet_0
  detroit_vpc_app2_subnet = module.detroit_vpc.detroit_vpc_app_subnet_1
 
  chicago_vpc = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_web_subnet = module.chicago_vpc.chicago_vpc_web_subnet_0
  chicago_vpc_app_subnet = module.chicago_vpc.chicago_vpc_app_subnet_0
  chicago_vpc_web2_subnet = module.chicago_vpc.chicago_vpc_web_subnet_1
  chicago_vpc_app2_subnet = module.chicago_vpc.chicago_vpc_app_subnet_1

  columbus_vpc = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_web_subnet = module.columbus_vpc.columbus_vpc_web_subnet_0
  columbus_vpc_app_subnet = module.columbus_vpc.columbus_vpc_app_subnet_0
  columbus_vpc_web2_subnet = module.columbus_vpc.columbus_vpc_web_subnet_1
  columbus_vpc_app2_subnet = module.columbus_vpc.columbus_vpc_app_subnet_1

  indianapolis_vpc = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_web_subnet = module.indianapolis_vpc.indianapolis_vpc_web_subnet_0
  indianapolis_vpc_app_subnet = module.indianapolis_vpc.indianapolis_vpc_app_subnet_0
  indianapolis_vpc_web2_subnet = module.indianapolis_vpc.indianapolis_vpc_web_subnet_1
  indianapolis_vpc_app2_subnet = module.indianapolis_vpc.indianapolis_vpc_app_subnet_1
}

module "instance" {
  source = "../../modules/9instance"

  image_id       = var.image_id
  instance_type  = var.instance_type

  detroit_web_sg_id = module.security_group.detroit_web_sg_id
  detroit_app_sg_id = module.security_group.detroit_app_sg_id
  detroit_db_sg_id  = module.security_group.detroit_db_sg_id

  detroit_vpc             = module.detroit_vpc.detroit_vpc
  detroit_vpc_igw         = module.internet_gateway.detroit_vpc_igw
  detroit_vpc_web_subnet  = module.detroit_vpc.detroit_vpc_web_subnet_0
  detroit_vpc_web2_subnet = module.detroit_vpc.detroit_vpc_web_subnet_1
  detroit_vpc_app_subnet  = module.detroit_vpc.detroit_vpc_app_subnet_0
  detroit_vpc_app2_subnet = module.detroit_vpc.detroit_vpc_app_subnet_1

  chicago_vpc             = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw         = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_web_subnet  = module.chicago_vpc.chicago_vpc_web_subnet_0
  chicago_vpc_web2_subnet = module.chicago_vpc.chicago_vpc_web_subnet_1
  chicago_vpc_app_subnet  = module.chicago_vpc.chicago_vpc_app_subnet_0
  chicago_vpc_app2_subnet = module.chicago_vpc.chicago_vpc_app_subnet_1

  columbus_vpc             = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw         = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_web_subnet  = module.columbus_vpc.columbus_vpc_web_subnet_0
  columbus_vpc_web2_subnet = module.columbus_vpc.columbus_vpc_web_subnet_1
  columbus_vpc_app_subnet  = module.columbus_vpc.columbus_vpc_app_subnet_0
  columbus_vpc_app2_subnet = module.columbus_vpc.columbus_vpc_app_subnet_1

  indianapolis_vpc             = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw         = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_web_subnet  = module.indianapolis_vpc.indianapolis_vpc_web_subnet_0
  indianapolis_vpc_web2_subnet = module.indianapolis_vpc.indianapolis_vpc_web_subnet_1
  indianapolis_vpc_app_subnet  = module.indianapolis_vpc.indianapolis_vpc_app_subnet_0
  indianapolis_vpc_app2_subnet = module.indianapolis_vpc.indianapolis_vpc_app_subnet_1
}

module "database" {
  source = "../../modules/10database"
  database_mysql          = var.database_mysql
  database_username       = var.database_username
  database_password       = var.database_password

  database_security_group = module.security_group.detroit_db_sg_id
  db_subnet               = [module.detroit_vpc.detroit_vpc_database_subnet_0, module.detroit_vpc.detroit_vpc_database_subnet_1]
  outside_cidr_block      = var.outside_cidr_block

  detroit_vpc             = module.detroit_vpc.detroit_vpc
  detroit_vpc_igw         = module.internet_gateway.detroit_vpc_igw
  detroit_vpc_web_subnet  = module.detroit_vpc.detroit_vpc_web_subnet_0
  detroit_vpc_web2_subnet = module.detroit_vpc.detroit_vpc_web_subnet_1
  detroit_vpc_app_subnet  = module.detroit_vpc.detroit_vpc_app_subnet_0
  detroit_vpc_app2_subnet = module.detroit_vpc.detroit_vpc_app_subnet_1

  chicago_vpc             = module.chicago_vpc.chicago_vpc
  chicago_vpc_igw         = module.internet_gateway.chicago_vpc_igw
  chicago_vpc_web_subnet  = module.chicago_vpc.chicago_vpc_web_subnet_0
  chicago_vpc_app_subnet  = module.chicago_vpc.chicago_vpc_app_subnet_0
  chicago_vpc_web2_subnet = module.chicago_vpc.chicago_vpc_web_subnet_1
  chicago_vpc_app2_subnet = module.chicago_vpc.chicago_vpc_app_subnet_1

  columbus_vpc             = module.columbus_vpc.columbus_vpc
  columbus_vpc_igw         = module.internet_gateway.columbus_vpc_igw
  columbus_vpc_web_subnet  = module.columbus_vpc.columbus_vpc_web_subnet_0
  columbus_vpc_app_subnet  = module.columbus_vpc.columbus_vpc_app_subnet_0
  columbus_vpc_web2_subnet = module.columbus_vpc.columbus_vpc_web_subnet_1
  columbus_vpc_app2_subnet = module.columbus_vpc.columbus_vpc_app_subnet_1

  indianapolis_vpc             = module.indianapolis_vpc.indianapolis_vpc
  indianapolis_vpc_igw         = module.internet_gateway.indianapolis_vpc_igw
  indianapolis_vpc_web_subnet  = module.indianapolis_vpc.indianapolis_vpc_web_subnet_0
  indianapolis_vpc_app_subnet  = module.indianapolis_vpc.indianapolis_vpc_app_subnet_0
  indianapolis_vpc_web2_subnet = module.indianapolis_vpc.indianapolis_vpc_web_subnet_1
  indianapolis_vpc_app2_subnet = module.indianapolis_vpc.indianapolis_vpc_app_subnet_1
}








