# Define variables for the instance template
variable "project_id" {
    type = string
  
}

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

variable "network_name" {
    type =  string
  
}

variable "subnetwork_name" {
    type = string
  
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

variable "zone" {
  description = "Zone for the autoscaler"
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

variable "account_id" {
  type = string
}
