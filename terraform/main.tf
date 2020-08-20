resource "google_storage_bucket" "sample_bucket" {
  name          = "jamsupreme-another-bucket-vcool-2"
  force_destroy = true
}

# resource "google_storage_bucket_object" "zip_file" {
#   name   = "index.zip"
#   bucket = google_storage_bucket.sample_bucket.name
#   source = "./code.zip"
# }

# resource "google_cloudfunctions_function" "function" {
#   name        = "function-test-3"
#   description = "My function"
#   runtime     = "nodejs10"

#   available_memory_mb   = 128
#   source_archive_bucket = google_storage_bucket.sample_bucket.name
#   source_archive_object = google_storage_bucket_object.zip_file.name
#   trigger_http          = true
#   entry_point           = "helloWorld"
# }


resource "google_compute_instance" "my_instance" {
  name         = "cool-instance"
  machine_type = "e2-micro"
  zone         = "us-east4-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  # scratch_disk {
  #   interface = "SCSI"
  # }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  # metadata = {
  #   foo = "bar"
  # }

  # metadata_startup_script = "echo hi > /test.txt"

  # service_account {
  #   scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  # }
}