# DEFINE DEFAULT VARIABLES HERE

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "key_name" {
  description = "Key Pair"
  type        = string
  default     = "ec2.pem"
}

variable "volume_size" {
  description = "Volume size"
  type        = string
}

variable "region_name" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "server_name" {
  description = "EC2 Server Name"
  type        = string
}
variable "aws_profile" {
  type = string
  default = "khalid"

}