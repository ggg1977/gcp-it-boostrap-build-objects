build_project_id              = "ggg-build"
owner                         = "ggg1977"
organization                  = "badgggorgg"
deploy_infra                  = true
boostrap_storage_buckets_repo = "gcp-it-boostrap-storage-buckets"
baseline_networking_vpc_repo  = "gcp-it-baseline-networking-vcp"
baseline_networking_dns_repo  = "gcp-it-baseline-networking-dns"
baseline_gke_infra_repo       = "gcp-it-baseline-gke-infrastructure"

# Enable build on "gcp-it-boostrap-storage-buckets" 
enable_boostrap_storage_buckets_repo = true

# Enable build on "gcp-it-baseline-networking-vcp" 
enable_baseline_networking_vpc_repo = true


# Enable build on "gcp-it-baseline-networking-dns" 
enable_baseline_networking_dns_repo = true

# Enable build on "gcp-it-baseline-gke-infrastructure" 
enable_baseline_gke_infra_repo = false
