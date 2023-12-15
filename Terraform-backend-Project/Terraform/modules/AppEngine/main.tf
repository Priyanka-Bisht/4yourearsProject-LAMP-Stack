# resource "google_app_engine_application" "foryourears-app" {
#   project     = var.project_id
#   location_id = "us-central"
  
# }

# resource "google_app_engine_application_url_dispatch_rules" "foryourearsapp-dispatch-rules" {
#   dispatch_rules {
#     domain = "*"
#     path = "/*"
#     service = "default"
#   }
# }

data "google_service_account" "service_account" {
  account_id   = var.account_id  # Replace with the name of your image
}

resource "google_app_engine_standard_app_version" "latest_version" {

  version_id = var.deployment_version
  service    = "default"
  runtime    = "nodejs20"

  entrypoint {
    shell = "node app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/bucketforappengine121/app.zip"
    }
  }

  instance_class = "F1"

  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances      = 1
    max_idle_instances      = 2
    min_pending_latency     = "1s"
    max_pending_latency     = "5s"
    standard_scheduler_settings {
      target_cpu_utilization        = 0.5
      target_throughput_utilization = 0.75
      min_instances                 = 0
      max_instances                 = 4
    }
  }

  service_account = data.google_service_account.service_account.email


  noop_on_destroy = true
  delete_service_on_destroy = true
}



# resource "google_storage_bucket" "app" {
#   name          = "${var.project_name}-${random_id.app.hex}"
#   location      = var.location
#   force_destroy = var.force_destroy
  
#   versioning {
#     enabled = true
#   }
# }

# resource "random_id" "app" {
#   byte_length = var.byte_length
# }

# data "archive_file" "function_dist" {
#   type        = "zip"
#   source_dir  = "../gitops-main"
#   output_path = "../gitops-main/gitops-main.zip"
# }

# resource "google_storage_bucket_object" "app" {
#   name   = "gitops-main.zip"
#   source = data.archive_file.function_dist.output_path
#   bucket = google_storage_bucket.app.name
# }

# data "google_service_account" "my_service_account" {
#   account_id = "azureconnect@radiant-striker-398604.iam.gserviceaccount.com"
# }

# resource "google_app_engine_application" "my_app" {
#   # service = var.service
#   location_id = var.location
# }


