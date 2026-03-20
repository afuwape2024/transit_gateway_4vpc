output "detroit_vpc_web_nacl" {
  value = aws_network_acl.detroit_vpc_web_nacl.id
}
output "detroit_vpc_app_nacl" {
  value = aws_network_acl.detroit_vpc_app_nacl.id
}

output "detroit_vpc_db_nacl" {
  value = aws_network_acl.detroit_vpc_database_nacl.id
}

#++=++++====++++++++=++++++++++++++==++==+

output "chicago_vpc_web_nacl" {
  value = aws_network_acl.chicago_vpc_web_nacl.id
}

output "chicago_vpc_app_nacl" {
  value = aws_network_acl.chicago_vpc_app_nacl.id
}

output "chicago_vpc_db_nacl" {
  value = aws_network_acl.chicago_vpc_database_nacl.id
}

#++=++++====++++++++=++++++++++++++==++==+

output "columbus_vpc_web_nacl" {
  value = aws_network_acl.columbus_vpc_web_nacl.id
}

output "columbus_vpc_app_nacl" {
  value = aws_network_acl.columbus_vpc_app_nacl.id
}

output "columbus_vpc_database_nacl" {
  value = aws_network_acl.columbus_vpc_database_nacl.id
}


#++=++++====++++++++=++++++++++++++==++==+
output "indianapolis_vpc_web_nacl" {
  value = aws_network_acl.indianapolis_vpc_web_nacl.id
}

output "indianapolis_vpc_app_nacl" {
  value = aws_network_acl.indianapolis_vpc_app_nacl.id
}

output "indianapolis_vpc_database_nacl" {
  value = aws_network_acl.indianapolis_vpc_database_nacl.id
}
