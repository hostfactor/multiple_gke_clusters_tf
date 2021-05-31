provider "kubernetes" {
  alias = "us_east1"
  host = module.us_east1.cluster
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = module.us_east1.ca_certificate
}

module "us_east1" {
  source = "./modules/gke_cluster"
  name = "cluster-us-east1"
  region = "us-east1"
}

module "nginx_us_east1" {
  source = "./modules/nginx"

  providers = {
    kubernetes = kubernetes.us_east1
  }
}
