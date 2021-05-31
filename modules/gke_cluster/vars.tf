variable "name" {
  type = string
  description = "The name of the cluster."
}

variable "region" {
  type = string
  description = "The name of the google region e.g. us-central1"
}

variable "zone" {
  type = string
  default = "The zone within the region e.g. a"
}
