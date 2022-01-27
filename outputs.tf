output "data_ingestion_project_id" {
    description = "Data Ingestion Project ID"
    value = google_project.data_ingestion_project.project_id
}

output "data_governance_project_id" {
    description = "Data Governance Project ID"
    value = google_project.data_governance_project.project_id
}

output "non_confidential_data_project_id" {
    description = "Non-confidential Project ID"
    value = google_project.non_confidential_project.project_id
}

output "confidential_data_project_id" {
    description = "Confidential Project ID"
    value = google_project.confidential_project.project_id
}

output "terraform_service_account" {
    description = "Terraform service account email address"
    value = google_service_account.terraform_service_account.email
}

output "org_id" {
    description = "Org ID"
    value = data.google_organization.org.org_id
}

output "data_analyst_group" {
    description = "Data Analyst group email address"
    value = "data-analysts@${var.domain}"
}

# data_engineer_group

# security_administrator_group

# security_analyst_group