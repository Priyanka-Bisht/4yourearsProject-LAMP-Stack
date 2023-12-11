# Define outputs for resource IDs
output "instance_template_id" {
  description = "ID of the instance template"
  value       = google_compute_instance_template.my_instance_template.id
}

output "autoscaler_id" {
  description = "ID of the autoscaler"
  value       = google_compute_autoscaler.instance_group.id
}

output "instance_group_manager_id" {
  description = "ID of the instance group manager"
  value       = google_compute_instance_group_manager.my_instance_group.id
}

output "instance_group_manager_name" {
  value = google_compute_instance_group_manager.my_instance_group.name
}
