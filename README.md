# **AWS Cost Control Automation with Terraform**

This project automates AWS **Budgets**, **Billing Alarms**, and **Tag Enforcement** using Terraform.
The goal is to help manage cloud costs, improve visibility, and enforce tagging compliance, all through Infrastructure as Code (IaC).


## **What it does**

* Creates **AWS Budgets** with automated notifications when spending exceeds defined thresholds.
* Sets up **CloudWatch Billing Alarms** integrated with SNS for real-time alerts.
* Enforces **tag compliance** to ensure all resources are properly labeled for cost tracking.
* Keeps cost-control configurations version-controlled and reproducible with Terraform.


## **Why I built this**

I wanted to learn how to apply Infrastructure as Code (IaC) to **AWS cost governance**.
Managing budgets and cost alerts manually in the AWS Console can be repetitive and error-prone.
With Terraform:

* Configurations are **repeatable and auditable**.
* Alerts and budgets can be **easily updated across environments**.
* Tag enforcement helps maintain **cost accountability** for every resource.


## **How to use**

1. Clone this repo.
2. Update the values in `terraform.tfvars` (budget amount, email, etc.).
3. Run:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
4. Verify cost budgets, billing alarms, and tag policies in the AWS Console.


## **File structure**

```text
.
├── main.tf                  # Main Terraform config
├── budget.tf                # AWS Budgets setup
├── billing_alarm.tf         # CloudWatch billing alarm + SNS config
├── tag_enforcement.tf       # Tag policy / compliance setup
├── variables.tf             # Input variables
├── outputs.tf               # Outputs (e.g., budget IDs, alarm ARNs)
```


## **Notes**

* Uses **local state** for simplicity, for production, migrate to **S3 backend with state locking**.
* All cost thresholds, notification emails, and tag keys are configurable via variables.
* Follows AWS best practices for cost visibility and tagging governance.


## **Next steps**

* Add S3 backend for state management.
* Add CI/CD pipeline to automatically validate and apply Terraform changes.
* Extend tagging enforcement to include service-specific policies.
