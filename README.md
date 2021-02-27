# AWS ALB/NLB Terraform module
These types of resources are supported:

* [ALB/NLB](https://www.terraform.io/docs/providers/aws/r/lb.html)

## Usage

```hcl
module "tienda_alb" {
  source               = "git@github.com:adecchi/terraform-aws-alb.git?ref=tags/0.0.1"
  create_lb       = true
  vpc_id          = module.tienda_vpc.vpc_id
  security_groups = [module.tienda_vpc.public_security_group_id]
  subnets         = module.tienda_vpc.public_subnet_ids
  target_groups = [{
    name             = "WEB-SERVERS"
    backend_protocol = "HTTP"
    backend_port     = 80
    }
  ]
  http_tcp_listeners = [{
    protocol = "HTTP"
    port     = 80
    }
  ]
  instances_ids = concat(module.tienda_ec2_apache.ids, module.tienda_ec2_nginx.ids)
  depends_on    = [module.tienda_ec2_apache, module.tienda_ec2_nginx]
}
```
## Outputs

| Name | Description |
|------|-------------|
| lb_arn | List of ARNs of instances |
| lb_dns_name| The DNS name of the load balancer |