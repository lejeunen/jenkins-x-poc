# from https://github.com/jenkins-x/terraform-aws-eks-jx
module "eks-jx" {
  source = "jenkins-x/eks-jx/aws"

  region = "eu-central-1"
  cluster_name = "jenkins-x-poc"
  cluster_version = "1.16"

  desired_node_count = 2
  min_node_count = 2
  node_machine_type = "t3.xlarge"

  vpc_name = "jenkins-x-poc"
  vpc_cidr_block = "10.4.0.0/16"
  public_subnets = [
    "10.4.1.0/24",
    "10.4.2.0/24",
    "10.4.3.0/24"]
  private_subnets = [
    "10.4.4.0/24",
    "10.4.5.0/24",
    "10.4.6.0/24"]

  force_destroy = true
}

output "jx_requirements" {
  value = module.eks-jx.jx_requirements
}

output "vault_user_id" {
  value = module.eks-jx.vault_user_id
  description = "The Vault IAM user id"
}

output "vault_user_secret" {
  value = module.eks-jx.vault_user_secret
  description = "The Vault IAM user secret"
}