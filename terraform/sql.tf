# Cloud SQL CPU Usage alerting
resource "google_monitoring_alert_policy" "alert_policy_sql_cpu" {
  display_name          = "SQL CPU Usage"
  combiner              = "OR"
  notification_channels = ["projects/helical-gist-265910/notificationChannels/3318454772737097293"]
  documentation {
    content = "This runbook is used define SQL CPU utilization"
  }
  conditions {
    display_name = "SQL CPU Usage"
    condition_threshold {
      filter          = "metric.type=\"cloudsql.googleapis.com/database/cpu/utilization\" AND resource.type=\"cloudsql_database\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = "0.99"
      aggregations {
        alignment_period     = "900s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.label.project_id", "resource.label.database_id", "resource.label.region"]
      }
    }
  }
}

# Cloud SQL Memory Usage alerting

resource "google_monitoring_alert_policy" "alert_policy_sql_mem" {
  display_name          = "SQL Mem Usage"
  combiner              = "OR"
  notification_channels = ["projects/helical-gist-265910/notificationChannels/3318454772737097293"]
  documentation {
    content = "This runbook is used define SQL Mem utilization"
  }
  conditions {
    display_name = "SQL Mem Usage"
    condition_threshold {
      filter          = "metric.type=\"cloudsql.googleapis.com/database/memory/utilization\" AND resource.type=\"cloudsql_database\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = "0.99"
      aggregations {
        alignment_period     = "900s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.label.project_id", "resource.label.database_id", "resource.label.region"]
      }
    }
  }
}
