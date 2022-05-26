
data "terraform_remote_state" "trs_iam_sericeaccounts" {
    backend = "gcs"
    config = {
        bucket="${var.organization}-gcs-it-trf-bld-eus1-001"
        prefix="gcp-it-boostrap-iam-serviceaccounts/bld"
    }
}



resource "google_cloudbuild_trigger" "gbt_buckets_nonprod" {
  project = var.build_project_id
  name = "gbt-it-cbb-dev-eus1-001"
  service_account = data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_nonprod_id

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
  service_account = data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_prod_id

  github {
      owner = var.owner
      name = "gcp-it-boostrap-storage-buckets"
      push {
          branch = "^prod$"
      }
  }
 
  filename = "cloudbuild.yaml"
}