# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "projects/portfolio-497109/databases/portfolio"
resource "google_firestore_database" "portfolio" {
  app_engine_integration_mode       = "DISABLED"
  concurrency_mode                  = "PESSIMISTIC"
  database_edition                  = "STANDARD"
  delete_protection_state           = "DELETE_PROTECTION_DISABLED"
  deletion_policy                   = "ABANDON"
  location_id                       = "europe-west2"
  name                              = "portfolio"
  point_in_time_recovery_enablement = "POINT_IN_TIME_RECOVERY_DISABLED"
  project                           = "portfolio-497109"
  tags                              = null
  type                              = "FIRESTORE_NATIVE"
}

# __generated__ by Terraform from "projects/portfolio-497109/locations/europe-west2/services/visitor-counter"
resource "google_cloud_run_v2_service" "visitor_counter" {
  annotations          = {}
  client               = "gcloud"
  client_version       = "569.0.0"
  custom_audiences     = []
  deletion_protection  = true
  description          = null
  ingress              = "INGRESS_TRAFFIC_ALL"
  invoker_iam_disabled = true
  labels               = {}
  launch_stage         = "GA"
  location             = "europe-west2"
  name                 = "visitor-counter"
  project              = "portfolio-497109"
  build_config {
    base_image               = "europe-west2-docker.pkg.dev/serverless-runtimes/google-24/runtimes/python314"
    enable_automatic_updates = true
    environment_variables    = {}
    function_target          = "visitor_counter"
    image_uri                = "europe-west2-docker.pkg.dev/portfolio-497109/cloud-run-source-deploy/visitor-counter:latest"
    service_account          = null
    source_location          = "gs://run-sources-portfolio-497109-europe-west2/services/visitor-counter/1779536631.37000.zip#1779536633305877"
    worker_pool              = null
  }
  scaling {
    manual_instance_count = 0
    min_instance_count    = 0
    scaling_mode          = null
  }
  template {
    annotations                   = {}
    encryption_key                = null
    execution_environment         = null
    gpu_zonal_redundancy_disabled = false
    labels = {
      commit-sha         = "01c017bedb1d7a3221339b60b8ab94e68fa47725"
      gcb-build-id       = "8da1b5e5-5517-470a-af6f-39860e1456d1"
      gcb-trigger-id     = "ff6d3918-9baa-4e1d-ba4d-6f35805bc296"
      gcb-trigger-region = "global"
      managed-by         = "gcp-cloud-build-deploy-cloud-run"
    }
    max_instance_request_concurrency = 80
    revision                         = null
    service_account                  = "344446164530-compute@developer.gserviceaccount.com"
    session_affinity                 = false
    timeout                          = "300s"
    containers {
      args           = []
      base_image_uri = "europe-west2-docker.pkg.dev/serverless-runtimes/google-24/runtimes/python314"
      command        = []
      depends_on     = []
      image          = "europe-west2-docker.pkg.dev/portfolio-497109/cloud-run-source-deploy/portfolio-backend/visitor-counter:01c017bedb1d7a3221339b60b8ab94e68fa47725"
      name           = "visitor-counter-1"
      working_dir    = null
      ports {
        container_port = 8080
        name           = "http1"
      }
      resources {
        cpu_idle = true
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
        startup_cpu_boost = true
      }
      startup_probe {
        failure_threshold     = 1
        initial_delay_seconds = 0
        period_seconds        = 240
        timeout_seconds       = 240
        tcp_socket {
          port = 8080
        }
      }
    }
    scaling {
      max_instance_count = 20
      min_instance_count = 0
    }
  }
  traffic {
    percent  = 100
    revision = null
    tag      = null
    type     = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }
}
