variable "computeName" {
 type = string
}
resource "google_compute_instance" "webserver" {
 name = var.computeName
 machine_type = "f1-micro"
 boot_disk {
 initialize_params {
 image = "ubuntu-os-cloud/ubuntu-1804-lts"
 }
 }
 network_interface {
 network = google_compute_network.vpc_network.name
 access_config {
 }
 }
}
resource "google_compute_network" "vpc_network" {
 name = "terraform-network"
}
output "webserver_ip" {
 value = google_compute_instance.webserver.network_interface.0.access_config.0.nat_ip
}
