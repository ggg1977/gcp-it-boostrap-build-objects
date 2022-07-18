variable "build_project_id" {
  type = string
}

variable "organization" {
  type = string
}

variable "owner" {
  type = string
}

variable "deploy_infra" {
  type = bool
}

variable "boostrap_storage_buckets_repo" {
  type    = string
  default = "gcp-it-boostrap-storage-buckets"
}

variable "baseline_networking_vpc_repo" {
  type    = string
  default = "gcp-it-baseline-networking-vcp"
}

variable "baseline_networking_dns_repo" {
  type    = string
  default = "gcp-it-baseline-networking-dns"
}

variable "baseline_gke_infra_repo" {
  type    = string
  default = "gcp-it-baseline-gke-infrastructure"
}


variable "enable_boostrap_storage_buckets_repo" {
  type    = bool
  default = false
}

variable "enable_baseline_networking_vpc_repo" {
  type    = bool
  default = false
}


variable "enable_baseline_networking_dns_repo" {
  type    = bool
  default = false
}

variable "enable_baseline_gke_infra_repo" {
  type    = bool
  default = false
}
