provider "google" {
  project     = "loyal-curve-256919"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = file("key.json")
}