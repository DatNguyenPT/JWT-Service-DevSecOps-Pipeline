variable "project" {
  description = "backend_state"
  default     = "backend_state"
  type        = string
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



