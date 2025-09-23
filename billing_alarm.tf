resource "aws_sns_topic" "billing_alerts" {
  name = "billing-alerts"
}

resource "aws_sns_topic_subscription" "billing" {
  topic_arn = aws_sns_topic.billing_alerts.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

resource "aws_cloudwatch_metric_alarm" "billing" {
  alarm_name          = "BillingAlarm50USD"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 21600
  statistic           = "Maximum"
  threshold           = 50
  alarm_description   = "Alert if charges exceed $50"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.billing_alerts.arn]

  dimensions = {
    Currency = "USD"
  }
}
