// ----------------------------------------------------------------------------
// Required Variables
// ----------------------------------------------------------------------------
variable "gcp_project" {
  description = "The name of the GCP project to use"
  type        = string
}

// ----------------------------------------------------------------------------
// Optional Variables
// ----------------------------------------------------------------------------
variable "cluster_name" {
  description = "Name of the Kubernetes cluster to create"
  type        = string
  default     = ""
}

variable "zone" {
  description = "Zone in which to create the cluster (deprecated, use cluster_location instead)"
  type        = string
  default     = ""
}

variable "cluster_location" {
  description = "The location (region or zone) in which the cluster master will be created. If you specify a zone (such as us-central1-a), the cluster will be a zonal cluster with a single cluster master. If you specify a region (such as us-west1), the cluster will be a regional cluster with multiple masters spread across zones in the region"
  type        = string
  default     = "us-central1-a"
}

variable "cluster_network" {
  description = "The name of the network (VPC) to which the cluster is connected"
  type        = string
  default     = "default"
}

variable "cluster_subnetwork" {
  description = "The name of the subnetwork to which the cluster is connected. Leave blank when using the 'default' vpc to generate a subnet for your cluster"
  type        = string
  default     = ""
}
variable "enable_private_nodes" {
  description = "Control whether nodes have internal IP addresses only. If enabled, all nodes are given only RFC 1918 private addresses and communicate with the master via private networking."
  type        = bool
  default     = false
}

variable "disable_public_endpoint" {
  description = "Control whether the master's internal IP address is used as the cluster endpoint. If set to 'true', the master can only be accessed from internal IP addresses."
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning internal IP addresses to the master or set of masters, as well as the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network."
  type        = string
  default     = ""
}

variable "cluster_ipv4_cidr_block" {
  description = "The IP address range for the cluster pod IPs. Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask. Set to a CIDR notation (e.g. 10.96.0.0/14) from the RFC-1918 private networks (e.g. 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) to pick a specific range to use."
  type        = string
  default     = ""
}

variable "services_ipv4_cidr_block" {
  description = "The IP address range of the services IPs in this cluster. Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask. Set to a CIDR notation (e.g. 10.96.0.0/14) from the RFC-1918 private networks (e.g. 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) to pick a specific range to use."
  type        = string
  default     = ""
}

variable "bucket_location" {
  description = "Bucket location for storage"
  type        = string
  default     = "US"
}

variable "jenkins_x_namespace" {
  description = "Kubernetes namespace to install Jenkins X in"
  type        = string
  default     = "jx"
}

variable "force_destroy" {
  description = "Flag to determine whether storage buckets get forcefully destroyed"
  type        = bool
  default     = false
}

variable "parent_domain" {
  description = "**Deprecated** Please use apex_domain variable instead.r"
  type        = string
  default     = ""
}

variable "apex_domain" {
  description = "The parent / apex domain to be used for the cluster"
  type        = string
  default     = ""
}

variable "parent_domain_gcp_project" {
  description = "**Deprecated** Please use apex_domain_gcp_project variable instead."
  type        = string
  default     = ""
}

variable "apex_domain_gcp_project" {
  description = "The GCP project the apex domain is managed by, used to write recordsets for a subdomain if set.  Defaults to current project."
  type        = string
  default     = ""
}

variable "subdomain" {
  description = "Optional sub domain for the installation"
  type        = string
  default     = ""
}

variable "apex_domain_integration_enabled" {
  description = "Flag that when set attempts to create delegation records in apex domain to point to domain created by this module"
  type        = bool
  default     = true
}

variable "tls_email" {
  description = "Email used by Let's Encrypt. Required for TLS when apex_domain is specified"
  type        = string
  default     = ""
}

variable "create_ui_sa" {
  description = "Whether the service accounts for the UI should be created"
  type        = bool
  default     = true
}

// ----------------------------------------------------------------------------
// Vault
// ----------------------------------------------------------------------------
variable "vault_url" {
  description = "URL to an external Vault instance in case Jenkins X shall not create its own system Vault"
  type        = string
  default     = ""
}

// ----------------------------------------------------------------------------
// Velero/backup
// ----------------------------------------------------------------------------
variable "enable_backup" {
  description = "Whether or not Velero backups should be enabled"
  type        = bool
  default     = false
}

variable "velero_namespace" {
  description = "Kubernetes namespace for Velero"
  type        = string
  default     = "velero"
}

variable "velero_schedule" {
  description = "The Velero backup schedule in cron notation to be set in the Velero Schedule CRD (see [default-backup.yaml](https://github.com/jenkins-x/jenkins-x-boot-config/blob/master/systems/velero-backups/templates/default-backup.yaml))"
  type        = string
  default     = "0 * * * *"
}

variable "velero_ttl" {
  description = "The the lifetime of a velero backup to be set in the Velero Schedule CRD (see [default-backup.yaml](https://github.com/jenkins-x/jenkins-x-boot-config/blob/master/systems/velero-backups/templates/default-backup))"
  type        = string
  default     = "720h0m0s"
}

// ----------------------------------------------------------------------------
// cluster configuration
// ----------------------------------------------------------------------------
variable "node_machine_type" {
  description = "Node type for the Kubernetes cluster"
  type        = string
  default     = "n1-standard-2"
}

variable "node_preemptible" {
  description = "Use preemptible nodes"
  type        = bool
  default     = false
}

variable "min_node_count" {
  description = "Minimum number of cluster nodes"
  type        = number
  default     = 3
}

variable "max_node_count" {
  description = "Maximum number of cluster nodes"
  type        = number
  default     = 5
}

variable "node_disk_size" {
  description = "Node disk size in GB"
  type        = string
  default     = "100"
}

variable "node_disk_type" {
  description = "Node disk type, either pd-standard or pd-ssd"
  type        = string
  default     = "pd-standard"
}

variable "release_channel" {
  description = "The GKE release channel to subscribe to.  See https://cloud.google.com/kubernetes-engine/docs/concepts/release-channels"
  type        = string
  default     = "REGULAR"
}

variable "resource_labels" {
  description = "Set of labels to be applied to the cluster"
  type        = map
  default     = {}
}

// ----------------------------------------------------------------------------
// jx-requirements.yml specific variables only used for template rendering
// ----------------------------------------------------------------------------
variable "git_owner_requirement_repos" {
  description = "The git id of the owner for the requirement repositories"
  type        = string
  default     = ""
}

variable "dev_env_approvers" {
  description = "List of git users allowed to approve pull request for dev enviornment repository"
  type        = list(string)
  default     = []
}

variable "lets_encrypt_production" {
  description = "Flag to determine wether or not to use the Let's Encrypt production server."
  type        = bool
  default     = true
}

variable "webhook" {
  description = "Jenkins X webhook handler for git provider"
  type        = string
  default     = "lighthouse"
}

variable "version_stream_url" {
  description = "The URL for the version stream to use when booting Jenkins X. See https://jenkins-x.io/docs/concepts/version-stream/"
  type        = string
  default     = "https://github.com/jenkins-x/jenkins-x-versions.git"
}

variable "version_stream_ref" {
  description = "The git ref for version stream to use when booting Jenkins X. See https://jenkins-x.io/docs/concepts/version-stream/"
  type        = string
  default     = "master"
}

variable "jx2" {
  description = "Is a Jenkins X 2 install"
  type        = bool
  default     = true
}

variable "gsm" {
  description = "Enables Google Secrets Manager, not available with JX2"
  type        = bool
  default     = false
}

variable "jx_git_url" {
  description = "URL for the Jenins X cluster git repository"
  type        = string
  default     = ""
}

variable "jx_bot_username" {
  description = "Bot username used to interact with the Jenkins X cluster git repository"
  type        = string
  default     = ""
}

variable "jx_bot_token" {
  description = "Bot token used to interact with the Jenkins X cluster git repository"
  type        = string
  default     = ""
}

variable "jx_git_operator_version" {
  description = "The jx-git-operator helm chart version"
  type        = string
  default     = "0.0.192"
}

variable "kuberhealthy" {
  description = "Enables Kuberhealthy helm installation"
  type        = bool
  default     = true
}
