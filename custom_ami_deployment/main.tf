# Create Instance uisng Custom VPC

module "develop-vpc" {
    source      = "../modules/vpc"

    ENVIRONMENT = var.ENVIRONMENT
    AWS_REGION  = var.AWS_REGION
}

provider "aws" {
  region = var.AWS_REGION
}

module "instance" {
  source = "../modules/instance"

  KEY_NAME = var.KEY_NAME
  PATH_TO_PUBLIC_KEY = var.PATH_TO_PUBLIC_KEY
  SG_VPC_ID = module.develop-vpc.my_vpc_id
  SG_NAME = var.SG_NAME
  SG_DESCRIPTION = var.SG_DESCRIPTION
  AMI_ID = var.AMI_ID
  INSTANCE_TYPE = var.INSTANCE_TYPE
  INSTANCE_NAME = "instance-${var.ENVIRONMENT}"
  AVAILABILITY_ZONE = "${var.AWS_REGION}a"
  INSTANCE_SUBNET_ID = element(module.develop-vpc.public_subnets, 0)
}

