variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the network being created"
  type        = string
}

variable "routing_mode" {
  type        = string
  
  description = "The network routing mode (default 'GLOBAL')"
}


variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  
}

variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
 
}

variable "mtu" {
  type        = number
  description = "The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively."
  
}

variable "enable_ipv6_ula" {
  type        = bool
  description = "Enabled IPv6 ULA, this is a permenant change and cannot be undone! (default 'false')"
  
}

variable "internal_ipv6_range" {
  type        = string
 
  description = "When enabling IPv6 ULA, optionally, specify a /48 from fd20::/20 (default null)"
}

variable "network_firewall_policy_enforcement_order" {
  type        = string
  
  description = "Set the order that Firewall Rules and Firewall Policies are evaluated. Valid values are `BEFORE_CLASSIC_FIREWALL` and `AFTER_CLASSIC_FIREWALL`. (default null or equivalent to `AFTER_CLASSIC_FIREWALL`)"
}


# =================Subnetwork================
variable "subnetwork_name" {
  description = "Name of the subnetwork"
  type        = string
}

variable "subnetwork_ip_cidr_range" {
  description = "IP CIDR range for the subnetwork"
  type        = string
  default     = "10.2.0.0/16"
}

variable "secondary_ip_cidr_range" {
  type = string
}

variable "subnetwork_region" {
  description = "Region for the subnetwork"
  type        = string
}

# variable "auto_create_subnetworks" {
#   description = "Auto-create subnetworks flag for the network"
#   type        = bool
  
# }

variable "subnetwork_range_name" {
  description = "Name of the Range"
  type = string
  
}

# ================Firewall===============
# variable "firewall_name" {
#   description = "Name of the firewall rule"
#   type        = string
# }

