provider "aws" {
  region = "eu-west-3"
}

module "vpc" {
  source = "./modules/vpc"
}

module "compute" {
  source    = "./modules/compute"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
}

module "database" {
  source     = "./modules/database"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}

module "storage" {
  source = "./modules/storage"
}

module "iam" {
  source = "./modules/iam"
}

module "monitoring" {
  source    = "./modules/monitoring"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
}
