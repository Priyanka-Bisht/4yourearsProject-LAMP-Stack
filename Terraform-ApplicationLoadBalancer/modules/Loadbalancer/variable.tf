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

variable "enable_cdn" {
    type = bool
  
}

variable "lb_ip_name" {
    type = string
  
}

variable "region" {
    type = string
  
}

variable "google_compute_url_map_name" {
    type = string
  
}

variable "google_compute_target_http_proxy_name" {
    type = string
  
}

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

variable "instance_group_name" {
    type = string
  
}

variable "project_id" {
    type = string
  
}

variable "zone" {
    type = string
  
}