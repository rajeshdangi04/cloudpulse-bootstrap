variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name — used for tagging all resources"
  type        = string
  default     = "cloudpulse"
}

variable "key_name" {
  description = "EC2 Key Pair name for SSH access (create in AWS Console first)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins and Ansible servers"
  type        = string
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "CIDR block for bootstrap VPC — main infra VPC (10.0.0.0/16) se alag rakho"
  type        = string
  default     = "10.10.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for bootstrap public subnet"
  type        = string
  default     = "10.10.1.0/24"
}
