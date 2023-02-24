#!/bin/sh
set -xe
tfenv install
cd terraform
terraform fmt -check=true -write=false -diff=true -list=true -recursive
tfenv use 1.3.9