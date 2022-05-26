
data "google_service_account" "sa_terraform_nonprod" {
  account_id = "sa-iac-terraform-nonprod@${var.build_project_id}.iam.gserviceaccount.com"
}

resource "google_cloudbuild_trigger" "gbt_buckets_nonprod" {
  project = var.build_project_id
  name = "gbt-it-cbb-dev-eus1-001"
  service_account = google_service_account.sa_terraform_nonprod.email

  github {
      owner = var.owner
      name = "gcp-it-boostrap-storage-buckets"
      push {
          branch = "^prod$"
          invert_regex = true
      }
  }
 
  filename = "cloudbuild.yaml"
}


resource "google_cloudbuild_trigger" "gbt_buckets_prod" {
  project = var.build_project_id
  name = "gbt-it-cbb-prod-eus1-001"
  service_account = google_service_account.sa_terraform_nonprod.email

  github {
      owner = var.owner
      name = "gcp-it-boostrap-storage-buckets"
      push {
          branch = "^prod$"
      }
  }
 
  filename = "cloudbuild.yaml"
}