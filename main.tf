provider "aws" {
  region = var.region
}

# -------------------------------------------------------
# VPC Module — Bootstrap VPC banana (Jenkins + Ansible ke liye)
# Main infra VPC se bilkul alag (alag CIDR)
# -------------------------------------------------------
module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
}

# -------------------------------------------------------
# Jenkins Module — Jenkins EC2 banana
# -------------------------------------------------------
module "jenkins" {
  source        = "./modules/jenkins"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id
  key_name      = var.key_name
  instance_type = var.instance_type
  project_name  = var.project_name
}

# -------------------------------------------------------
# Ansible Module — Ansible EC2 banana
# -------------------------------------------------------
module "ansible" {
  source        = "./modules/ansible"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id
  key_name      = var.key_name
  instance_type = var.instance_type
  project_name  = var.project_name
}
