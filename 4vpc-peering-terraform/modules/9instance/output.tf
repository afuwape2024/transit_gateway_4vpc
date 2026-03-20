output "web_server" {
  value = aws_instance.app_server.id
}
output "app_server" {
  value = aws_instance.app_server.id
}

