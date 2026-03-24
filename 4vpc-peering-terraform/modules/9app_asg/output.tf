output "detroit_web_scaling_group" {
  value = aws_autoscaling_group.detroit_web_scaling_group.id
}
output "detroit_web_template" {
    value = aws_launch_template.detroit_web_template.id
}

#=================================================
output "chicago_web_scaling_group" {
  value = aws_autoscaling_group.chicago_web_scaling_group.id
}
output "chicago_web_template" {
    value = aws_launch_template.chicago_web_template.id
}

#=================================================
output "columbus_web_scaling_group" {
  value = aws_autoscaling_group.columbus_web_scaling_group.id
}
output "columbus_web_template" {
    value = aws_launch_template.columbus_web_template.id
}

#=================================================
output "indianapolis_web_scaling_group" {
  value = aws_autoscaling_group.indianapolis_web_scaling_group.id
}
output "indianapolis_web_template" {
    value = aws_launch_template.indianapolis_web_template.id
}

#=================================================