# GCE Disk Usage Alerting

resource "google_monitoring_alert_policy" "alert_policy" {
  display_name          = "GCE Disk Usage"
  combiner              = "OR"
  notification_channels = ["projects/de-manoj-kumar/notificationChannels/13570824548837170415"]
  documentation {
    content = "This is test runbook for GCP Alerting"
  }
  conditions {
    display_name = "GCE Disk Usage"
    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/disk/percent_used\" AND resource.type=\"gce_instance\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 90
      aggregations {
        alignment_period     = "300s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.label.project_id", "resource.label.instance_id", "resource.label.zone"]
      }
    }
  }
}
# GCE Memory Usage Alerting


resource "google_monitoring_alert_policy" "alert_policy_gce_mem" {
  display_name          = "GCE Mem Usage"
  combiner              = "OR"
  notification_channels = ["projects/de-manoj-kumar/notificationChannels/13570824548837170415"]
  documentation {
    content = " This is test Runbook for GCE Mem alerting"
  }
  conditions {
    display_name = "GCE Mem Usage"
    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/memory/percent_used\" AND resource.type=\"gce_instance\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = "98"
      aggregations {
        alignment_period     = "300s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.label.project_id", "resource.label.instance_id", "resource.label.zone"]
      }
    }
  }
}

# GCE CPU Usage Alerting

resource "google_monitoring_alert_policy" "alert_policy_gce_cpu" {
  display_name          = "GCE CPU Usage"
  combiner              = "OR"
  notification_channels = ["projects/de-manoj-kumar/notificationChannels/13570824548837170415"]
  documentation {
    content = "This is test Runbook for GCE CPU alerting"
  }
  conditions {
    display_name = "GCE CPU Usage"
    condition_threshold {
      filter          = "metric.type=\"agent.googleapis.com/cpu/utilization\" AND resource.type=\"gce_instance\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = "95"
      aggregations {
        alignment_period     = "300s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.label.project_id", "resource.label.instance_id", "resource.label.zone"]
      }
    }
  }
}

