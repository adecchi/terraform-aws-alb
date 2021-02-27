#####################
# GLOBAL VARIABLES  #
#####################
variable "resources_timeouts" {
  description = "Default Terraform Timeout for AWS Resource creation"
  type        = string
  default     = "5m"
}

###################################
# VARIABLE LOADBALANCER RESOURCES #
###################################
variable "create_lb" {
  description = "Load Balancer should be created ??"
  type        = bool
  default     = true
}

variable "name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "The resource name prefix and Name tag of the load balancer."
  type        = string
  default     = null
}

variable "load_balancer_type" {
  description = "Type of load balancer to create"
  type        = string
  default     = "application"
}

variable "internal" {
  description = "Load balancer should be expose to Internet"
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "List of security groups to attach to the load balancer."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "List of subnets to associate with the load balancer."
  type        = list(string)
  default     = null
}

variable "idle_timeout" {
  description = "TTL seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}

variable "enable_cross_zone_load_balancing" {
  description = "Cross zone load balancing should be enabled in application load balancers."
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "If true. This will prevent Terraform from deleting the load balancer. Defaults to false."
  type        = bool
  default     = false
}

variable "enable_http2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
  type        = bool
  default     = true
}


variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer."
  type        = string
  default     = "ipv4"
}

variable "drop_invalid_header_fields" {
  description = "Indicates whether invalid header fields are dropped in application load balancers. Defaults to false."
  type        = bool
  default     = false
}

variable "subnet_mapping" {
  description = "List of subnet blocks to attach to network load balancer"
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "loadbalancer_tags" {
  description = "A map of tags to add to load balancer"
  type        = map(string)
  default     = {}
}

variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Required values are: name, backend_protocol, backend_port"
  type        = any
  default     = []
}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
  default     = null
}

variable "target_group_tags" {
  description = "A map of tags to add to all target groups"
  type        = map(string)
  default     = {}
}


variable "http_tcp_listeners" {
  description = "A list of maps describing the HTTP listeners or TCP ports for this ALB. Required values are: port, protocol."
  type        = any
  default     = []
}

variable "instances_ids" {
  description = "List of Instances Ids"
  type        = list(string)
  default     = null
}



