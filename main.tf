terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.2"
    }    
  }
}

provider "google" {
  region  = "us-central1"
  zone    = "us-central1-c"

}

/**********************************************
Folder for secure bqdw projects
***********************************************/

resource "google_folder" "secure_bqdw_folder" {
  display_name = "secure-bqdw"
  parent       = "organizations/898267907536"
}

/**********************************************
  Project random id suffix configuration
 **********************************************/
resource "random_id" "random_project_id_suffix" {
  byte_length = 2
}

/**********************************************
Create prequisite projects
***********************************************/

resource "google_project" "terraform_seed_project" {
  name       = "terraform-seed"
  project_id = "terraform-seed-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
}

resource "google_project" "data_ingestion_project" {
  name       = "data-ingestion"
  project_id = "data-ingestion-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
}

resource "google_project" "data_governance_project" {
  name       = "data-governance"
  project_id = "data-governance-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
}

resource "google_project" "non_confidential_project" {
  name       = "non-confidential"
  project_id = "non-confidential-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
}

resource "google_project" "confidential_project" {
  name       = "confidential"
  project_id = "confidential-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
}

/**********************************************
Enable APIs in prequisite projects
***********************************************/

# TODO - Fix billing account enablement prerequisite for activating APIs

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

resource "google_project_service" "terraform_seed_project_services" {
  for_each = toset(var.terraform_seed_project_service_list)
  project = google_project.terraform_seed_project.project_id
  service = each.key
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

resource "google_project_service" "data_ingestion_project_services" {
  for_each = toset(var.data_ingestion_project_service_list)
  project = google_project.data_ingestion_project.project_id
  service = each.key
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

resource "google_project_service" "data_governance_project_services" {
  for_each = toset(var.data_governance_project_service_list)
  project = google_project.data_governance_project.project_id
  service = each.key
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

resource "google_project_service" "non_confidential_project_services" {
  for_each = toset(var.non_confidential_project_service_list)
  project = google_project.non_confidential_project.project_id
  service = each.key
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

resource "google_project_service" "confidential_project_services" {
  for_each = toset(var.confidential_project_service_list)
  project = google_project.confidential_project.project_id
  service = each.key
}