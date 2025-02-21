variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.0.0/20"]
}
 
variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = ["us-east-1a"]  
}


variable "ami_id" {
    type        = string
    description = "AMI ID"
    default     = "ami-0e1bed4f06a3b463d" # Ubuntu Server 24.04 - x64

}

variable "instance_type" {
    type        = string
    description = "Instance Type"
    default     = "t2.large"
}

variable "key_name" {
    type        = string
    description = "Key Pair Name"
    default     = "instance-keypair"
  
}

# variable "access_key" {
#   type        = string
#   description = "AWS Access Key"
# }

# variable "secret_key" {
#   type        = string
#   description = "AWS Secret Key"
# }

variable "region" {
  type        = string
  description = "AWS Default Region"
  default     = "us-east-1"
}



