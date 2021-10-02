provider "google" {
  project = "fredboat-selfhost-327804"
  region  = "us-east1"
  zone    = "us-east1-b"
}

terraform {
  backend "gcs" {
    bucket = "terraform-backend-809237"
  }
}

resource "google_compute_instance" "default" {
  name         = "fredboat"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "projects/cos-cloud/global/images/family/cos-stable"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    discord-bot-token = var.DISCORD_BOT_TOKEN
  }
  metadata_startup_script = file("startup.sh")
}