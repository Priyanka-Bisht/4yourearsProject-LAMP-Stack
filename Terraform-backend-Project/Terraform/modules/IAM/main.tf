# Creating Service Account to access AppEngine

resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = "Service Account"
}

# IAM Policy

resource "google_project_iam_member" "appengine_admin" {
  project = var.project_id
  role    = "roles/appengine.appAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"

}

resource "google_project_iam_member" "instance_group_manager_admin" {
  project = var.project_id
  role    = "roles/compute.instanceAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "instance_template_admin" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}





