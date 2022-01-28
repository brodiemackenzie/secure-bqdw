variable "domain" {
  description = "Cloud Identity / GCP domain"
  type = string
  default = "brodiem.altostrat.com"
}

variable "billing_account" {
  description = "GCP Billing Account"
  type = string
  default = "Argolis Billing (brodiem)"
}

variable "data_analyst_group" {
  description = "Data Analyst group name"
  type = string
  default = "data-analysts"
}

variable "data_engineer_group" {
  description = "Data Engineer group name"
  type = string
  default = "data-engineers"
}

variable "network_administrator_group" {
  description = "Network Administrator group name"
  type = string
  default = "network-admins"
}

variable "security_administrator_group" {
  description = "Security Administrator group name"
  type = string
  default = "security-admins"
}

variable "security_analyst_group" {
  description = "Security Analyst group name"
  type = string
  default = "security-analysts"
}

variable "terraform_seed_project" {
  description = "Terraform Seed Project Name"
  type = string
  default = "terraform-seed"  
}

variable "data_ingestion_project" {
  description = "Data Ingestion Project Name"
  type = string
  default = "data-ingestion" 
}

variable "data_governance_project" {
  description = "Data Governance Project Name"
  type = string
  default = "data-governance"  
}

variable "non_confidential_project" {
  description = "Non-confidential Project Name"
  type = string
  default = "non-confidential"  
}

variable "confidential_project" {
  description = "Confidential Project Name"
  type = string
  default = "confidential"  
}

variable "terraform_seed_project_service_list" {
  description ="The list of APIs to enable for the terraform seed project"
  type = list(string)
  default = [
    "accesscontextmanager.googleapis.com",
    "appengine.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "dataflow.googleapis.com",
    "iam.googleapis.com",
    "pubsub.googleapis.com"
]
}

variable "data_ingestion_project_service_list" {
  description ="The list of APIs to enable for the data ingestion project"
  type = list(string)
  default = [
    "accesscontextmanager.googleapis.com",
    "appengine.googleapis.com",
    "artifactregistry.googleapis.com",
    "bigquery.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudscheduler.googleapis.com",
    "compute.googleapis.com",
    "datacatalog.googleapis.com",
    "dataflow.googleapis.com",
    "dlp.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "pubsub.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com"
]
}

variable "data_governance_project_service_list" {
  description ="The list of APIs to enable for the data governance project"
  type = list(string)
  default = [
    "accesscontextmanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "datacatalog.googleapis.com",
    "dlp.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com",
    "secretmanager.googleapis.com"
]
}

variable "non_confidential_project_service_list" {
  description ="The list of APIs to enable for the non-confidential project"
  type = list(string)
  default = [
    "accesscontextmanager.googleapis.com",
    "bigquery.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com"
]
}

variable "confidential_project_service_list" {
  description ="The list of APIs to enable for the confidential project"
  type = list(string)
  default = [
    "accesscontextmanager.googleapis.com",
    "artifactregistry.googleapis.com",
    "bigquery.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "datacatalog.googleapis.com",
    "dataflow.googleapis.com",
    "dlp.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com"
]
}

variable "terraform_service_account_org_iam_roles_list" {
  description ="The list of roles to grant to the terraform service account at the org level"
  type = list(string)
  default = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.organizationAdmin"
]
}

variable "terraform_service_account_data_ingestion_iam_roles_list" {
  description ="The list of roles to grant to the terraform service account for the data ingestion project"
  type = list(string)
  default = [
    "roles/appengine.appCreator",
    "roles/cloudscheduler.admin",
    "roles/compute.networkAdmin",
    "roles/compute.securityAdmin",
    "roles/dataflow.developer",
    "roles/dns.admin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/pubsub.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountTokenCreator",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/storage.admin"
]
}

variable "terraform_service_account_data_governance_iam_roles_list" {
  description ="The list of roles to grant to the terraform service account for the data governance project"
  type = list(string)
  default = [
    "roles/cloudkms.admin",
    "roles/cloudkms.cryptoKeyEncrypter",
    "roles/dlp.deidentifyTemplatesEditor",
    "roles/dlp.inspectTemplatesEditor",
    "roles/dlp.user",
    "roles/datacatalog.admin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/secretmanager.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountTokenCreator",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/storage.admin"
]
}

variable "terraform_service_account_non_confidential_iam_roles_list" {
  description ="The list of roles to grant to the terraform service account for the non-confidential project"
  type = list(string)
  default = [
    "roles/bigquery.admin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountTokenCreator",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/storage.admin"
]
}

variable "terraform_service_account_confidential_iam_roles_list" {
  description ="The list of roles to grant to the terraform service account for the confidential project"
  type = list(string)
  default = [
    "roles/bigquery.admin",
    "roles/compute.networkAdmin",
    "roles/compute.securityAdmin",
    "roles/dns.admin",
    "roles/dataflow.developer",
    "roles/resourcemanager.projectIamAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountTokenCreator",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/storage.admin"
]
}
