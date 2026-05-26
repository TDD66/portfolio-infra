import {
  to = google_storage_bucket.site
  id = "my-portfolio-66"
}
import {
  to = google_cloud_run_v2_service.visitor_counter
  id = "projects/portfolio-497109/locations/europe-west2/services/visitor-counter"
}
import {
  to = google_firestore_database.portfolio
  id = "projects/portfolio-497109/databases/portfolio"
}

import {
  to = google_compute_global_address.portfolio_ip
  id = "projects/portfolio-497109/global/addresses/portfolio-ip"
}
import {
  to = google_compute_backend_bucket.portfolio_bucket
  id = "projects/portfolio-497109/global/backendBuckets/portfolio-bucket"
}
import {
  to = google_compute_url_map.portfolio_lb
  id = "projects/portfolio-497109/global/urlMaps/portfolio-lb"
}
import {
  to = google_compute_url_map.portfolio_lb_redirect
  id = "projects/portfolio-497109/global/urlMaps/portfolio-lb-redirect"
}
import {
  to = google_compute_target_https_proxy.portfolio_lb_target_proxy
  id = "projects/portfolio-497109/global/targetHttpsProxies/portfolio-lb-target-proxy"
}
import {
  to = google_compute_target_http_proxy.portfolio_lb_target_proxy
  id = "projects/portfolio-497109/global/targetHttpProxies/portfolio-lb-target-proxy"
}
import {
  to = google_compute_global_forwarding_rule.portfolio_lb
  id = "projects/portfolio-497109/global/forwardingRules/portfolio-lb"
}
import {
  to = google_compute_global_forwarding_rule.portfolio_lb_forwarding_rule
  id = "projects/portfolio-497109/global/forwardingRules/portfolio-lb-forwarding-rule"
}
import {
  to = google_compute_managed_ssl_certificate.portfolio_ssl_www
  id = "projects/portfolio-497109/global/sslCertificates/portfolio-ssl-www"
}