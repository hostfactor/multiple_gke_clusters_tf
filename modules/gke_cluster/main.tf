resource "google_service_account" "default" {
  account_id = "service-account-id"
  display_name = "Service Account"
}

locals {
  cluster_ca_certificate = base64decode(google_container_cluster.this.master_auth[0].cluster_ca_certificate)
  cluster_host = "https://${google_container_cluster.this.endpoint}"
  location = "${var.region}-${var.zone}"
}

data "google_container_engine_versions" "this" {
  version_prefix = "1.18."
  location = local.location
}

resource "google_container_cluster" "this" {
  name = var.name
  location = local.location

  initial_node_count = 3

  min_master_version = data.google_container_engine_versions.this.latest_master_version

  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
