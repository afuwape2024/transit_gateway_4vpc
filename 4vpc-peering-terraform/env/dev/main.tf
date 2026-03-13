module "detriot_vpc" {
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


