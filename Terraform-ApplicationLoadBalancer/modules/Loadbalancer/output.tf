output "health_check_id" {
  value = google_compute_health_check.lb_health_check.id
}

output "backend_service_id" {
  value = google_compute_backend_service.lb_backend_service.id
}

output "external_ip" {
  value = google_compute_address.lb_ip.address
}

output "url_map_id" {
  value = google_compute_url_map.url-map.id
}

output "target_http_proxy_id" {
  value = google_compute_target_http_proxy.http-proxy.id
}

output "global_address_id" {
  value = google_compute_global_address.global-address.id
}

output "global_forwarding_rule_id" {
  value = google_compute_global_forwarding_rule.forwarding-rule.id
}


# output "instance_group_manager_name" {
#   value = google_compute_instance_group_manager.my_instance_group.name
# }
