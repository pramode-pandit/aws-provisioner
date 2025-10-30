variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "instance_name" {
  description = "Name of EC2 instance"
  type        = string
  default     = "ece-demo-instance"
}
