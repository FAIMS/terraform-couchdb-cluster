resource "digitalocean_loadbalancer" "couchdb-lb" {
  name = "couchdb-lb"
  region = "syd1"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 5984
    target_protocol = "http"
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = [
    digitalocean_droplet.couchdb-1.id, 
    digitalocean_droplet.couchdb-2.id,
    digitalocean_droplet.couchdb-3.id
  ]
}

