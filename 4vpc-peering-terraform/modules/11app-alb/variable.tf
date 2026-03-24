variable "detroit_web_target_group" {
  type    = string
  default = "detroit_web_target-group"
}
variable "chicago_web_target_group" {
  type    = string
  default = "chicago_web_target-group"
}
variable "columbus_web_target_group" {
  type    = string
  default = "columbus_web_target-group"
}
variable "indianapolis_web_target_group" {
  type    = string
  default = "indianapolis_web_target-group"
}
variable "outside_cidr_block" {}

variable "detroit_vpc" {}
variable "detroit_vpc_web_subnet" {}
variable "detroit_vpc_web2_subnet" {}
variable "detroit_vpc_app_subnet" {}
variable "detroit_vpc_app2_subnet" {}
variable "detroit_vpc_igw" {}

variable "chicago_vpc" {}
variable "chicago_vpc_web_subnet" {}
variable "chicago_vpc_app_subnet" {}
variable "chicago_vpc_web2_subnet" {}
variable "chicago_vpc_app2_subnet" {}
variable "chicago_vpc_igw" {}

variable "columbus_vpc" {}
variable "columbus_vpc_web_subnet" {}
variable "columbus_vpc_app_subnet" {}
variable "columbus_vpc_web2_subnet" {}
variable "columbus_vpc_app2_subnet" {}
variable "columbus_vpc_igw" {}

variable "indianapolis_vpc" {}
variable "indianapolis_vpc_web_subnet" {}
variable "indianapolis_vpc_app_subnet" {}
variable "indianapolis_vpc_web2_subnet" {}
variable "indianapolis_vpc_app2_subnet" {}
variable "indianapolis_vpc_igw" {}