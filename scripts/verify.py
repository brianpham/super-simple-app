#!/usr/bin/env python3

import os
import subprocess

GITHUB_WORKSPACE = os.environ.get("GITHUB_WORKSPACE")
TAG = os.environ.get("TAG")

def generateTerraformConfig(NEW_TAG):
    # print(f"Generating terraform config for {NEW_TAG}")

    MOD_TAG = f"""'"{NEW_TAG}"'"""
    CMD = f'cat {GITHUB_WORKSPACE}/terraform/environments/dev/deployment.tf | $GITHUB_WORKSPACE/bin/hcledit attribute set resource.kubernetes_deployment.supersimpleapp.spec.template.spec.container.image {MOD_TAG} > deployment.tf'

    print(CMD)

    subprocess.run(args=CMD, shell=True)

def validateTag(TAG):
    
    NEW_TAG = f'ghcr.io/brianpham/supersimpleapp:{TAG}'
    CURRENT_TAG = subprocess.getoutput(["cat terraform/environments/dev/deployment.tf | hcledit attribute get resource.kubernetes_deployment.supersimpleapp.spec.template.spec.container.image"]).replace('"','')

    if CURRENT_TAG == NEW_TAG:
        print(f'The image {NEW_TAG} matches the current deployment.')
    else:
        print(f'New image detected.\nOk to generate terraform configuration to use {NEW_TAG}.')
        generateTerraformConfig(NEW_TAG)

    
def main():
    validateTag(TAG)


if __name__ == "__main__":
    main()