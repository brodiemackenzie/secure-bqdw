terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.77.0"      
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