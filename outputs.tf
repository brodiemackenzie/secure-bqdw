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

output "sdx_project_number" {
    description = "Secure Data Exchange for Flex Templates Project Number"
    value = google_project.sdx_project.number
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
    value = "${var.data_analyst_group}@${var.domain}"
}

output "data_engineer_group" {
    description = "Data Engineer group email address"
    value = "${var.data_engineer_group}@${var.domain}"
}

output "network_administrator_group" {
    description = "Network Administrator group email address"
    value = "${var.network_administrator_group}@${var.domain}"
}

output "security_administrator_group" {
    description = "Security Administrator group email address"
    value = "${var.security_administrator_group}@${var.domain}"
}

output "security_analyst_group" {
    description = "Security Analyst group email address"
    value = "${var.security_analyst_group}@${var.domain}"
}

output "perimeter_additional_members" {
    description = "Perimeter additional members"
    value = var.perimeter_additional_members
}
