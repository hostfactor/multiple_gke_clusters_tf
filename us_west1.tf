provider "kubernetes" {
  alias = "us_west1"
  host = module.us_west1.cluster
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = module.us_west1.ca_certificate
}

module "us_west1" {
  source = "./modules/gke_cluster"
  name = "cluster-us-west1"
  region = "us-west1"
}

module "nginx_us_west1" {
  source = "./modules/nginx"

  providers = {
    kubernetes = kubernetes.us_west1
  }
}
