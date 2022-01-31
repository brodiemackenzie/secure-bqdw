/**********************************************
Get organization ID
***********************************************/

data "google_organization" "org" {
  domain = var.domain
}

/**********************************************
Folder for secure bqdw projects
***********************************************/

resource "google_folder" "secure_bqdw_folder" {
  display_name = "secure-bqdw"
  parent       = "organizations/${data.google_organization.org.org_id}"
}

/**********************************************
Project random id suffix configuration
***********************************************/

resource "random_id" "random_project_id_suffix" {
  byte_length = 2
}

/**********************************************
Create prerequisite projects
***********************************************/

resource "google_project" "terraform_seed_project" {
  name       = "${var.terraform_seed_project}"
  project_id = "${var.terraform_seed_project}-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
  billing_account = var.billing_account_id
}

resource "google_project" "data_ingestion_project" {
  name       = "${var.data_ingestion_project}"
  project_id = "${var.data_ingestion_project}-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
  billing_account = var.billing_account_id
}

resource "google_project" "data_governance_project" {
  name       = "${var.data_governance_project}"
  project_id = "${var.data_governance_project}-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
  billing_account = var.billing_account_id
}

resource "google_project" "non_confidential_project" {
  name       = "${var.non_confidential_project}"
  project_id = "${var.non_confidential_project}-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
  billing_account = var.billing_account_id
}

resource "google_project" "confidential_project" {
  name       = "${var.confidential_project}"
  project_id = "${var.confidential_project}-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
  billing_account = var.billing_account_id
}

resource "google_project" "sdx_project" {
  name       = "${var.sdx_project}"
  project_id = "${var.sdx_project}-${random_id.random_project_id_suffix.hex}"
  folder_id  = google_folder.secure_bqdw_folder.name
  billing_account = var.billing_account_id
}

/**********************************************
Enable APIs in prerequisite projects
***********************************************/

resource "google_project_service" "terraform_seed_project_services" {
  for_each = toset(var.terraform_seed_project_service_list)
  project = google_project.terraform_seed_project.project_id
  service = each.key
}

resource "google_project_service" "data_ingestion_project_services" {
  for_each = toset(var.data_ingestion_project_service_list)
  project = google_project.data_ingestion_project.project_id
  service = each.key
}

resource "google_project_service" "data_governance_project_services" {
  for_each = toset(var.data_governance_project_service_list)
  project = google_project.data_governance_project.project_id
  service = each.key
}

resource "google_project_service" "non_confidential_project_services" {
  for_each = toset(var.non_confidential_project_service_list)
  project = google_project.non_confidential_project.project_id
  service = each.key
}

resource "google_project_service" "confidential_project_services" {
  for_each = toset(var.confidential_project_service_list)
  project = google_project.confidential_project.project_id
  service = each.key
}

/**********************************************
Create privileged service account
***********************************************/

resource "google_service_account" "terraform_service_account" {
  project = google_project.terraform_seed_project.project_id
  account_id   = "sa-tf-seed-${random_id.random_project_id_suffix.hex}"
  display_name = "Terraform Seed Service Account"
}

/**********************************************
Grant roles to privileged service account at the org level
***********************************************/

resource "google_organization_iam_member" "terraform_service_account_org_iam" {
  for_each = toset(var.terraform_service_account_org_iam_roles_list)
  org_id  = data.google_organization.org.org_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.terraform_service_account.email}"
}

/**********************************************
Grant roles to privileged service account for the projects
***********************************************/

resource "google_project_iam_member" "terraform_service_account_data_ingestion_iam" {
  for_each = toset(var.terraform_service_account_data_ingestion_iam_roles_list)
  project = google_project.data_ingestion_project.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.terraform_service_account.email}"
}

resource "google_project_iam_member" "terraform_service_account_data_governance_iam" {
  for_each = toset(var.terraform_service_account_data_governance_iam_roles_list)
  project = google_project.data_governance_project.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.terraform_service_account.email}"
}

resource "google_project_iam_member" "terraform_service_account_non_confidential_iam" {
  for_each = toset(var.terraform_service_account_non_confidential_iam_roles_list)
  project = google_project.non_confidential_project.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.terraform_service_account.email}"
}

resource "google_project_iam_member" "terraform_service_account_confidential_iam" {
  for_each = toset(var.terraform_service_account_confidential_iam_roles_list)
  project = google_project.confidential_project.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.terraform_service_account.email}"
}
