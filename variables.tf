variable "aws_region" {
  description = "AWS region to operate in"
  type        = string
  default     = "ap-southeast-2"
}

variable "aws_profile" {
  description = "Optional AWS CLI profile name"
  type        = string
  default     = "gopi"
}
/*
variable "access_key" {
  description = "path to shared credentials file"
  type        = string
  default     = "C:/Users/tharunkk/.aws/config"
}

variable "secret_key" {
  description = "path to shared credentials file"
  type        = string
  default     = "C:/Users/tharunkk/.aws/credentials"
}
*/

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets to create"
  type        = number
  default     = 2
}


variable "tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of an existing key pair to enable SSH (optional)"
  type        = string
  default     = null
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH to the instance"
  type        = string
  default     = "0.0.0.0/0"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
  default     = 10
}
/*
variable "additional_ebs_count" {
  description = "Number of additional EBS volumes to attach"
  type        = number
  default     = 0
}

variable "additional_ebs_size" {
  description = "Size (GiB) for each additional EBS volume"
  type        = number
  default     = 20
}
*/

variable "user_data" {
  description = "User data (cloud-init) to pass to the instance"
  type        = string
  default     = "ngnix.sh"
}

