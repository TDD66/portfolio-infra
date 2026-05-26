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

# __generated__ by Terraform from "projects/portfolio-497109/global/forwardingRules/portfolio-lb"
resource "google_compute_global_forwarding_rule" "portfolio_lb" {
  description                                                  = null
  external_managed_backend_bucket_migration_state              = null
  external_managed_backend_bucket_migration_testing_percentage = 0
  ip_address                                                   = "8.232.166.123"
  ip_protocol                                                  = "TCP"
  ip_version                                                   = null
  labels                                                       = {}
  load_balancing_scheme                                        = "EXTERNAL_MANAGED"
  name                                                         = "portfolio-lb"
  network_tier                                                 = "PREMIUM"
  no_automate_dns_zone                                         = null
  port_range                                                   = "443-443"
  project                                                      = "portfolio-497109"
  source_ip_ranges                                             = []
  target                                                       = "https://www.googleapis.com/compute/v1/projects/portfolio-497109/global/targetHttpsProxies/portfolio-lb-target-proxy"
}

# __generated__ by Terraform from "projects/portfolio-497109/global/targetHttpProxies/portfolio-lb-target-proxy"
resource "google_compute_target_http_proxy" "portfolio_lb_target_proxy" {
  description                 = null
  http_keep_alive_timeout_sec = 0
  name                        = "portfolio-lb-target-proxy"
  project                     = "portfolio-497109"
  proxy_bind                  = false
  url_map                     = "https://www.googleapis.com/compute/v1/projects/portfolio-497109/global/urlMaps/portfolio-lb-redirect"
}

# __generated__ by Terraform from "projects/portfolio-497109/global/sslCertificates/portfolio-ssl-www"
resource "google_compute_managed_ssl_certificate" "portfolio_ssl_www" {
  description = null
  name        = "portfolio-ssl-www"
  project     = "portfolio-497109"
  type        = "MANAGED"
  managed {
    domains = ["tadiwanashedzvoti.com", "www.tadiwanashedzvoti.com"]
  }
}

# __generated__ by Terraform from "projects/portfolio-497109/global/backendBuckets/portfolio-bucket"
resource "google_compute_backend_bucket" "portfolio_bucket" {
  bucket_name             = "my-portfolio-66"
  compression_mode        = "DISABLED"
  custom_response_headers = []
  description             = null
  edge_security_policy    = null
  enable_cdn              = true
  load_balancing_scheme   = null
  name                    = "portfolio-bucket"
  project                 = "portfolio-497109"
  cdn_policy {
    cache_mode                   = "CACHE_ALL_STATIC"
    client_ttl                   = 3600
    default_ttl                  = 3600
    max_ttl                      = 86400
    negative_caching             = false
    request_coalescing           = true
    serve_while_stale            = 0
    signed_url_cache_max_age_sec = 0
  }
}

# __generated__ by Terraform from "projects/portfolio-497109/global/forwardingRules/portfolio-lb-forwarding-rule"
resource "google_compute_global_forwarding_rule" "portfolio_lb_forwarding_rule" {
  description                                                  = null
  external_managed_backend_bucket_migration_state              = null
  external_managed_backend_bucket_migration_testing_percentage = 0
  ip_address                                                   = "8.232.166.123"
  ip_protocol                                                  = "TCP"
  ip_version                                                   = null
  labels                                                       = {}
  load_balancing_scheme                                        = "EXTERNAL_MANAGED"
  name                                                         = "portfolio-lb-forwarding-rule"
  network_tier                                                 = "PREMIUM"
  no_automate_dns_zone                                         = null
  port_range                                                   = "80-80"
  project                                                      = "portfolio-497109"
  source_ip_ranges                                             = []
  target                                                       = "https://www.googleapis.com/compute/v1/projects/portfolio-497109/global/targetHttpProxies/portfolio-lb-target-proxy"
}

# __generated__ by Terraform from "projects/portfolio-497109/global/urlMaps/portfolio-lb-redirect"
resource "google_compute_url_map" "portfolio_lb_redirect" {
  default_service = null
  description     = "Automatically generated HTTP to HTTPS redirect for the portfolio-lb forwarding rule"
  name            = "portfolio-lb-redirect"
  project         = "portfolio-497109"
  default_url_redirect {
    host_redirect          = null
    https_redirect         = true
    path_redirect          = null
    prefix_redirect        = null
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }
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

# __generated__ by Terraform
resource "google_compute_target_https_proxy" "portfolio_lb_target_proxy" {
  certificate_map             = null
  description                 = null
  http_keep_alive_timeout_sec = 0
  name                        = "portfolio-lb-target-proxy"
  project                     = "portfolio-497109"
  proxy_bind                  = false
  quic_override               = "NONE"
  server_tls_policy           = null
  ssl_certificates            = ["https://www.googleapis.com/compute/v1/projects/portfolio-497109/global/sslCertificates/portfolio-ssl-www"]
  ssl_policy                  = null
  tls_early_data              = "DISABLED"
  url_map                     = "https://www.googleapis.com/compute/v1/projects/portfolio-497109/global/urlMaps/portfolio-lb"
}

# __generated__ by Terraform from "projects/portfolio-497109/global/urlMaps/portfolio-lb"
resource "google_compute_url_map" "portfolio_lb" {
  default_service = "https://www.googleapis.com/compute/v1/projects/portfolio-497109/global/backendBuckets/portfolio-bucket"
  description     = null
  name            = "portfolio-lb"
  project         = "portfolio-497109"
}

# __generated__ by Terraform from "my-portfolio-66"
resource "google_storage_bucket" "site" {
  default_event_based_hold    = false
  enable_object_retention     = false
  force_destroy               = false
  labels                      = {}
  location                    = "EU"
  name                        = "my-portfolio-66"
  project                     = "portfolio-497109"
  public_access_prevention    = "inherited"
  requester_pays              = false
  rpo                         = "DEFAULT"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  encryption {
    default_kms_key_name = ""
  }
  hierarchical_namespace {
    enabled = false
  }
  soft_delete_policy {
    retention_duration_seconds = 604800
  }
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

# __generated__ by Terraform from "projects/portfolio-497109/global/addresses/portfolio-ip"
resource "google_compute_global_address" "portfolio_ip" {
  address       = "8.232.166.123"
  address_type  = "EXTERNAL"
  description   = null
  ip_version    = "IPV4"
  labels        = {}
  name          = "portfolio-ip"
  network       = null
  prefix_length = 0
  project       = "portfolio-497109"
  purpose       = null
}
