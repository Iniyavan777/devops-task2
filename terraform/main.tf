terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "trend" {
  name = "iniyacloud03/trend:latest"
}

resource "docker_container" "trend_app" {
  name  = "trend-terraform"
  image = docker_image.trend.image_id
  ports {
    internal = 80
    external = 3002
  }
}
