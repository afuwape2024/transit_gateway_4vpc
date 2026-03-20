output "detroit_vpc_public_route_table" {
  value = aws_route_table.detroit_vpc_public_route_table.id
}

output "detroit_eip" {
  value = aws_eip.detroit_eip.id
}
output "detroit_nat_gw1" {
  value = aws_nat_gateway.detroit_nat_gw1.id
}

output "detroit_vpc_private_route_table" {
  value = aws_route_table.detroit_vpc_private_route_table.id
}

#===========================================================
#===========================================================
#===========================================================
output "chicago_vpc_public_route_table" {
  value = aws_route_table.chicago_vpc_public_route_table.id
}

output "chicago_eip" {
  value = aws_eip.chicago_eip.id
}
output "chicago_nat_gw1" {
  value = aws_nat_gateway.chicago_nat_gw1.id
}

output "chicago_vpc_private_route_table" {
  value = aws_route_table.chicago_vpc_private_route_table.id
}
#===========================================================
#===========================================================
#===========================================================
output "columbus_vpc_public_route_table" {
  value = aws_route_table.columbus_vpc_public_route_table.id
}

output "columbus_eip" {
  value = aws_eip.columbus_eip.id
}
output "columbus_nat_gw1" {
  value = aws_nat_gateway.columbus_nat_gw1.id
}

output "columbus_vpc_private_route_table" {
  value = aws_route_table.columbus_vpc_private_route_table.id
}

#===========================================================
#===========================================================
#===========================================================
output "indianapolis_vpc_public_route_table" {
  value = aws_route_table.indianapolis_vpc_public_route_table.id
}

output "indianapolis_eip" {
  value = aws_eip.indianapolis_eip.id
}
output "indianapolis_nat_gw1" {
  value = aws_nat_gateway.indianapolis_nat_gw1.id
}

output "indianapolis_vpc_private_route_table" {
  value = aws_route_table.indianapolis_vpc_private_route_table.id
}

