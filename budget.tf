resource "aws_budgets_budget" "monthly_cost" {
  name              = "MonthlyCostBudget"
  budget_type       = "COST"
  limit_amount      = "20"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator         = "GREATER_THAN"
    notification_type           = "ACTUAL"
    threshold                   = "80"
    threshold_type              = "PERCENTAGE"
    subscriber_email_addresses  = [var.notification_email]
  }
}
