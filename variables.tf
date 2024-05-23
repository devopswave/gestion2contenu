variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "eu-west-3"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
  default     = "my-key-pair"
}
