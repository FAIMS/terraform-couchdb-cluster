terraform {
    required_providers {
      digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~> 2.0"
      }
    }
}

variable "do_token" {}
variable "pvt_key" {}
variable "couchdb_password" {}
variable "couchdb_secret" {}

provider digitalocean {
    token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
    name = "terraform"
}
