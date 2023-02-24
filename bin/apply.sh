#!/bin/sh

CI_COMMIT_SHORT_SHA=$(echo ${CIRCLE_SHA1:0:8})
tfenv install
cd terraform
# for debugging, show that these files exist
ls -la "terraform-$CI_COMMIT_SHORT_SHA.tar.gz"
ls -la "terraform-$CI_COMMIT_SHORT_SHA.plan"

# uncache .terraform for the apply
tar xzf "terraform-$CI_COMMIT_SHORT_SHA.tar.gz"

terraform init -input=false
terraform apply -input=false "terraform-$CI_COMMIT_SHORT_SHA.plan"
