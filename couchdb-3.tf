resource "digitalocean_droplet" "couchdb-3" {
    image = "ubuntu-23-10-x64"
    name = "couchdb-3"
    region = "syd1"
    size = "s-1vcpu-1gb"
    ssh_keys = [
        data.digitalocean_ssh_key.terraform.id
    ]
    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "2m"
    }
    provisioner "remote-exec" {
        inline = [
            "snap wait system seed.loaded",
            "snap install couchdb",
            "snap set couchdb admin=${var.couchdb_password} setcookie=${var.couchdb_secret} name=couchdb@${self.ipv4_address}",
            "sed -i -e 's/;bind_address = 127.0.0.1/bind_address = ${self.ipv4_address}/' /var/snap/couchdb/current/etc/local.ini",
            "snap restart couchdb"
        ]
    }
}

