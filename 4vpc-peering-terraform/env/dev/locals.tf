locals {
  region             = var.region
  outside_cidr_block = var.outside_cidr_block
  availability_zones = var.availability_zones

  # Public NACL (local will be configure in NACL folder main.tf)

  web_nacl = {
    ingress_http = {
      rule_no    = 100
      protocol   = "tcp"
      action     = "allow"
      cidr_block = var.outside_cidr_block
      from_port  = 80
      to_port    = 80
    }

    ingress_https = {
      rule_no    = 110
      protocol   = "tcp"
      action     = "allow"
      cidr_block = var.outside_cidr_block
      from_port  = 443
      to_port    = 443
    }

    ingress_ephemeral = {
      rule_no    = 120
      protocol   = "tcp"
      action     = "allow"
      cidr_block = var.outside_cidr_block
      from_port  = 1024
      to_port    = 65535
    }

    egress_all = {
      rule_no    = 130
      protocol   = "-1"
      action     = "allow"
      cidr_block = var.outside_cidr_block
      from_port  = 0
      to_port    = 0
    }
  }

  # ========================
  # ========================
  # Private/app NACL rules per city 
  # ONLY access from the web_subnet

  app_nacls = {
    detroit = {
      web_cidrs = var.detroit_web_subnet_cidr_block
      db_cidrs  = var.detroit_database_subnet_cidr_block
    }
    chicago = {
      web_cidrs = var.chicago_web_subnet_cidr_block
      db_cidrs  = var.chicago_database_subnet_cidr_block
    }
    columbus = {
      web_cidrs = var.columbus_web_subnet_cidr_block
      db_cidrs  = var.columbus_database_subnet_cidr_block
    }
    indianapolis = {
      web_cidrs = var.indianapolis_web_subnet_cidr_block
      db_cidrs  = var.indianapolis_database_subnet_cidr_block
    }
  }

  # ========================
  # ========================
  # Database NACL rules
  # ONLY access from the app_subnet 

  database_nacls = {
    detroit = {
      app_cidrs = var.detroit_app_subnet_cidr_block
    }
    chicago = {
      app_cidrs = var.chicago_app_subnet_cidr_block
    }
    columbus = {
      app_cidrs = var.columbus_app_subnet_cidr_block
    }
    indianapolis = {
      app_cidrs = var.indianapolis_app_subnet_cidr_block
    }
  }

  # ========================
  # ========================
  # ========================
  ports = {
    web_http  = 80
    web_https = 443
    app       = 8080
    postgres  = 5432
    ephemeral_from = 1024
    ephemeral_to   = 65535
  }
}

