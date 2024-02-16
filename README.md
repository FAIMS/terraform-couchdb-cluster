# Deploy a CouchDB cluster to Digital Ocean via Terraform

Create a three node cluster with a front end load balancer. Configure
as a CouchDB cluster.  

Partly based on this tutorial:
[How To Use Terraform with DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean).

## Configuration

```bash
export DO_PAT="digital ocean personal access token"
export COUCHDB_PASSWORD="secret admin password"
export COUCHDB_SECRET="cookie secret"
```

I created a new SSH key in the current directory using `ssh-keygen` but you could
also use an existing key in the path below.  DO needs to know about this key.

## Build the cluster

To validate the configuration and view the plan:

```bash
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=./id_rsa" \
  -var "couchdb_password=${COUCHDB_PASSWORD}" \
  -var "couchdb_secret=${COUCHDB_SECRET}"
```

To create the cluster substitute `terraform apply`.
