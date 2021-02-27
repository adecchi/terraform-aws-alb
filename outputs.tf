output "lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = concat(aws_lb.lb.*.arn, [""])[0]
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = concat(aws_lb.lb.*.dns_name, [""])[0]
}