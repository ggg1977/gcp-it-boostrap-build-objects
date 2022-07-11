# gcp-it-boostrap-build-objects

This repository creates the cloud build jobs that are used for deploying resources on GCP.

## Setting values on terraform.tfvars

Go to the  terraform.tfvars file and set these values with your own info

build_project_id              = <build project id>
owner                         = <github owner> 
organization                  = <your organization name>


## Setting values on couldbuild.yaml

Go to the cloudbuild.yaml file and set the org right value in this section

env:
    - 'ORG=<your organization name>'

