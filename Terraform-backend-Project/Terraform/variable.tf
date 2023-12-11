# ==========================VPC=======================

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
  type = string

  description = "When enabling IPv6 ULA, optionally, specify a /48 from fd20::/20 (default null)"
}

variable "network_firewall_policy_enforcement_order" {
  type = string

  description = "Set the order that Firewall Rules and Firewall Policies are evaluated. Valid values are `BEFORE_CLASSIC_FIREWALL` and `AFTER_CLASSIC_FIREWALL`. (default null or equivalent to `AFTER_CLASSIC_FIREWALL`)"
}

#========================== Subnet ========================

variable "subnetwork_name" {
  description = "Name of the subnetwork"
  type        = string
}

variable "subnetwork_ip_cidr_range" {
  description = "IP CIDR range for the subnetwork"
  type        = string

}

variable "secondary_ip_cidr_range" {
  type = string
}

variable "subnetwork_region" {
  description = "Region for the subnetwork"
  type        = string
}


variable "subnetwork_range_name" {
  description = "Name of the Range"
  type        = string

}

# ============================Firewall====================
variable "firewall_name" {
  description = "Name of the firewall rule"
  type        = string
}


# ============================IAM=========================

variable "account_id" {
  type = string
}

# ===========================Provider======================

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

# =======================Compute==========================
# Define variables for the instance template
variable "custom_image_name" {
  type = string

}

variable "instance_template_name" {
  description = "Name for the instance template"
  type        = string

}

variable "instance_template_description" {
  description = "Description for the instance template"
  type        = string

}

variable "machine_type" {
  description = "Machine type for the instance template"
  type        = string

}

# Define variables for the autoscaler
variable "autoscaler_name" {
  description = "Name for the autoscaler"
  type        = string

}


variable "autoscaler_max_replicas" {
  description = "Maximum number of replicas for the autoscaler"
  type        = number

}

variable "autoscaler_min_replicas" {
  description = "Minimum number of replicas for the autoscaler"
  type        = number

}

variable "autoscaler_cooldown_period" {
  description = "Cooldown period for the autoscaler"
  type        = number

}

variable "cpu_utilization_target" {
  description = "Target CPU utilization for the autoscaler"
  type        = number

}

# Define variables for the instance group manager
variable "instance_group_name" {
  description = "Name for the instance group manager"
  type        = string

}

variable "instance_group_description" {
  description = "Description for the instance group manager"
  type        = string

}

variable "instance_group_zone" {
  description = "Zone for the instance group manager"
  type        = string

}

variable "instance_group_base_name" {
  description = "Base instance name for the instance group manager"
  type        = string

}

variable "instance_group_target_size" {
  description = "Target size for the instance group manager"
  type        = number

}



# =======================LoadBalancer========================

variable "lb_name" {
  type = string
}

variable "check_interval_sec" {
  type = number

}

variable "timeout_sec" {
  type = number

}

variable "backend_service_name" {
  type = string

}

variable "protocol" {
  type = string

}


variable "port_name" {
  type = string

}

# variable "enable_cdn" {
#     type = bool

# }

# variable "lb_ip_name" {
#     type = string

# }

# variable "region" {
#     type = string

# }

# variable "google_compute_url_map_name" {
#     type = string

# }

# variable "google_compute_target_http_proxy_name" {
#     type = string

# }

variable "google_compute_global_address_name" {
  type = string
}

variable "google_compute_global_forwarding_rule_name" {
  type = string

}

variable "ip_protocol" {
  type = string

}

variable "load_balancing_scheme" {
  type = string

}

variable "port_range" {
  type = string

}

# variable "instance_group_name" {
#     type = string

# }

# variable "project_id" {
#     type = string

# }

# variable "zone" {
#     type = string

# }



# =========================AppEngine=====================
variable "project_name" {
  type = string

}

variable "location_id" {
  type = string
}

variable "service" {
  type = string

}

variable "location" {
  type = string

}

variable "force_destroy" {
  type = bool

}

variable "byte_length" {
  type = number

}

variable "deployment_version" {
  type = string
}
