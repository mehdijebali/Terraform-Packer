# Variable for Create Instance Module
variable "PATH_TO_PUBLIC_KEY" {
  description = "Public key path"
  default = "levelup_key.pub"
}

variable "ENVIRONMENT" {
    type    = string
    default = "development"
}

variable "AMI_ID" {
    type    = string
    default = ""
}

variable "AWS_REGION" {
default = "us-east-1"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "KEY_NAME" {
  default = "levelup_key"
}

variable "SG_NAME" {
  default = "allow-levelup-ssh"
}

variable "SG_DESCRIPTION" {
  default = "security group that allows ssh connection"
}