variable "grafana_image" {
  type        = string
  description = "Grafana Docker image to use"
  default     = "grafana/grafana:8.0.3"
}
variable "cf_org" {
  type        = string
  description = "The CF Org to deploy under"
}
variable "cf_space_id" {
  type        = string
  description = "The id of the CF Space to deploy in"
}
variable "cf_domain" {
  type        = string
  description = "The CF domain to use for Grafana"
}
variable "name_postfix" {
  type        = string
  description = "The postfix string to append to the hostname, prevents namespace clashes"
}
variable "environment" {
  type        = map(any)
  description = "Environment variables for Grafana app"
  default     = {}
}
variable "network_policies" {
  description = "The container-to-container network policies to create with Grafana as the source app"
  type = list(object({
    destination_app = string
    protocol        = string
    port            = string
  }))
  default = []
}

variable "memory" {
  type        = number
  description = "The amount of RAM to allocate for Grafana (MB)"
  default     = 512
}
variable "disk" {
  type        = number
  description = "The amount of Disk space to allocate for Grafana (MB)"
  default     = 1024
}
variable "db_broker" {
  type        = string
  description = "The Database broker to use for requesting a PostgreSQL database"
  default     = "hsdp-rds"
}
variable "db_plan" {
  type        = string
  description = "The Database plan to use"
  default     = "postgres-micro-dev"
}

variable "db_json_params" {
  type        = string
  description = "Optional DB JSON params"
  default     = "{}"
}

variable "enable_postgres" {
  type        = bool
  description = "Enable or disables postgres persistence"
  default     = true
}

variable "grafana_username" {
  type        = string
  description = "The Grafana username to use"
}

variable "grafana_password" {
  type        = string
  description = "The Grafana password to use"
}

variable "pg_exporter_image" {
  type    = string
  default = "quay.io/prometheuscommunity/postgres-exporter:latest"
}