output "cluster" {
  value = google_container_cluster.this
}

output "ca_certificate" {
  value = local.cluster_ca_certificate
}

output "host" {
  value = local.cluster_host
}
