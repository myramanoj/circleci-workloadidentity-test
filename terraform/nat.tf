resource "google_monitoring_alert_policy" "alert_policy_nat_alloc_fail" {
  display_name          = "Nat Allocation Failed"
  combiner              = "OR"
  notification_channels = ["projects/de-manoj-kumar/notificationChannels/13570824548837170415"]
  documentation {
    content = " This runbook is used define nat allocation"
  }
  conditions {
    display_name = "Nat Allocation Failed"
    condition_threshold {
      filter          = "metric.type=\"router.googleapis.com/nat/nat_allocation_failed\" AND resource.type=\"nat_gateway\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = "1"
      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_COUNT_TRUE"
        cross_series_reducer = "REDUCE_COUNT"
        group_by_fields      = ["resource.label.project_id", "resource.label.gateway_name", "resource.label.region"]
      }
    }
  }
}