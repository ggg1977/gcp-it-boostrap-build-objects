
data "terraform_remote_state" "trs_iam_sericeaccounts" {
  backend = "gcs"
  config = {
    bucket = "${var.organization}-gcs-it-trf-bld-eus1-001"
    prefix = "gcp-it-boostrap-iam-serviceaccounts/bld"
  }
}


## GCS buckets

resource "google_cloudbuild_trigger" "gbt_buckets_nonprod" {
  count           = var.deploy_infra && var.enable_boostrap_storage_buckets_repo ? 1 : 0
  project         = var.build_project_id
  name            = "gbt-it-cbb-dev-eus1-001"
  service_account = tolist(data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_nonprod_id)[0]

  github {
    owner = var.owner
    name  = var.boostrap_storage_buckets_repo
    push {
      branch       = "^prod$"
      invert_regex = true
    }
  }

  filename = "cloudbuild.yaml"
}


resource "google_cloudbuild_trigger" "gbt_buckets_prod" {
  count           = var.deploy_infra && var.enable_boostrap_storage_buckets_repo ? 1 : 0
  project         = var.build_project_id
  name            = "gbt-it-cbb-prod-eus1-001"
  service_account = tolist(data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_prod_id)[0]

  github {
    owner = var.owner
    name  = var.boostrap_storage_buckets_repo
    push {
      branch = "^prod$"
    }
  }

  filename = "cloudbuild.yaml"
}

## VPCs

resource "google_cloudbuild_trigger" "gbt_vpcs_environments" {
  count           = var.deploy_infra && var.enable_baseline_networking_vpc_repo ? 1 : 0
  project         = var.build_project_id
  name            = "gbt-it-wsh-net-eus1-001"
  service_account = tolist(data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_prod_id)[0]

  github {
    owner = var.owner
    name  = var.baseline_networking_vpc_repo
    push {
      branch = ".*"
    }
  }

  filename = "cloudbuild.yaml"
}


## Dns zones

resource "google_cloudbuild_trigger" "gbt_dns_dev" {
  count           = var.deploy_infra && var.enable_baseline_networking_vpc_repo ? 1 : 0
  project         = var.build_project_id
  name            = "gbt-it-dns-dev-eus1-001"
  service_account = tolist(data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_nonprod_id)[0]

  github {
    owner = var.owner
    name  = var.baseline_networking_dns_repo
    push {
      branch = "^prod$"
      invert_regex = true
    }
  }

  filename = "cloudbuild.yaml"
}


resource "google_cloudbuild_trigger" "gbt_dns_prod" {
  count           = var.deploy_infra && var.enable_baseline_networking_dns_repo ? 1 : 0
  project         = var.build_project_id
  name            = "gbt-it-dns-prod-eus1-001"
  service_account = tolist(data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_prod_id)[0]

  github {
    owner = var.owner
    name  = var.baseline_networking_dns_repo
    push {
      branch       = "^prod$"
    }
  }

  filename = "cloudbuild.yaml"
}


## GKE

resource "google_cloudbuild_trigger" "gbt_gke_dev" {
  count           = var.deploy_infra && var.enable_baseline_gke_infra_repo ? 1 : 0
  project         = var.build_project_id
  name            = "gbt-it-gke-dev-eus1-001"
  service_account = tolist(data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_nonprod_id)[0]

  github {
    owner = var.owner
    name  = var.baseline_gke_infra_repo
    push {
      branch = "^prod$"
      invert_regex = true
    }
  }

  filename = "cloudbuild.yaml"
}


resource "google_cloudbuild_trigger" "gbt_gke_prod" {
  count           = var.deploy_infra && var.enable_baseline_gke_infra_repo ? 1 : 0
  project         = var.build_project_id
  name            = "gbt-it-gke-prod-eus1-001"
  service_account = tolist(data.terraform_remote_state.trs_iam_sericeaccounts.outputs.service_account_prod_id)[0]

  github {
    owner = var.owner
    name  = var.baseline_gke_infra_repo
    push {
      branch       = "^prod$"
    }
  }

  filename = "cloudbuild.yaml"
}
