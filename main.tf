terraform {
 required_providers {
 google = {
 source = "hashicorp/google"
 version = "3.5.0"
 }
 }
}
provider "google" {
 credentials = file("/home/ubuntu/key-jenkins.json")
 project = "green-entity-366409"
 region = "us-central1"
 zone = "us-central1-c"
}
variable "instance-name"{
 type = string
}
module "compute_module" {
 source = "./compute"
 computeName = var.instance-name
}
output "public_ip" {
 value = module.compute_module.webserver_ip
}
