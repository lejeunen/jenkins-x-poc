# jenkins-x-poc
A POC to explore [Jenkins X](https://jenkins-x.io/) features.

## Requirements
1. [jx binary](https://jenkins-x.io/docs/install-setup/install-binary/) installed.
1. [jenkins-x-boot-config](https://github.com/jenkins-x/jenkins-x-boot-config) forked : [environment-jenkins-x-poc](https://github.com/lejeunen/environment-jenkins-x-poc)


## Setup

1. Create EKS cluster by running _create-cluster.tf_, as described [here](https://github.com/jenkins-x/terraform-aws-eks-jx)
1. Export Vault's key and secret
1. Generate the requirements file `terraform output jx_requirements > ../../environment-jenkins-x-poc/jx-requirements.yml`

## Boot

Switch to the environment repository

Update requirement file with 

```
cluster:
  environmentGitPublic: true
```

Clone jenkins-x-boot-config and cd into it

Overwrite the requirements with ours

Execute `jx boot`

Answer questions as described in [this walkthrough](https://jenkins-x.io/blog/2020/03/10/walkthrough/)




