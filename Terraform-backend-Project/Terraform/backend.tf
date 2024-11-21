terraform {
  backend "gcs" {
    bucket         = "bucketforappengine121"  # Replace with your GCS bucket name
    prefix         = "terraform/state"
    project        = var.project_id
    #credentials = file("keyfile.pem")       # Optional: Set a prefix for your state files
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">=4.0.0"
    }

  }
}
