variable "aws_region" {
  description = "The AWS region to deploy the resources in"
  default     = "us-west-2"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance (Amazon Linux 2)"
  default     = "ami-0c55b159cbfafe1f0" # Update with a current AMI ID
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}
