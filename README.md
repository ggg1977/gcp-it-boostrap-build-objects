# gcp-it-boostrap-build-objects

This repository creates the cloud build jobs that are used for deploying resources on GCP.

## Setting values on terraform.tfvars

Go to the  terraform.tfvars file and set these values with your own info

build_project_id              = <build_project_id>

owner                         = <github_owner>

organization                  = <your_organization_name>

enable_boostrap_storage_buckets_repo = false

enable_baseline_networking_vpc_repo =  false

enable_baseline_networking_dns_repo = false

enable_baseline_gke_infra_repo  = false 


## Setting values on couldbuild.yaml

Go to the cloudbuild.yaml file and set the org right value in this section

env:
    - 'ORG=<your organization name>'


## Pushing the changes

1. Push the new changes to the repo

git add .
git commit -m "<your_message>"
git push

