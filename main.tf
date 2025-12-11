terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}
provider "docker" {}


resource "docker_network" "private_network"{
    name="genesis_net_tf"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}
resource "docker_container" "satellite" {
  image = docker_image.nginx.image_id 
  name  = var.container_name
  networks_advanced {
    name    = docker_network.private_network.name
    aliases = ["satellite_terraform"]
  }
}

resource "docker_container" "ground_station" {
  image= curlimages/curl
  networks_advanced {
    name = docker_network.private_network.name
  }
  command = ["curl", "-v", "http://satellite_terraform"]
}