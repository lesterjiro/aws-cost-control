````markdown
# AWS IAM Automation with Terraform

This project automates the creation of IAM users, groups, roles, and policies using Terraform.  
The goal is to remove manual AWS Console clicks and keep IAM configuration version-controlled and reproducible.

## What it does
- Creates an IAM group with a custom policy (least privilege).
- Creates IAM users and attaches them to the group.
- Creates IAM roles with trust policies for cross-service access.
- Demonstrates how to separate variables, outputs, and JSON policy docs for clarity.

## Why I built this
I wanted to practice Infrastructure as Code (IaC) by automating common IAM setups.  
Manually creating users and roles in the AWS Console is error-prone. With Terraform:
- Config is repeatable across environments.
- Policies are stored in code (easy to audit/change).
- Easy to extend for future IAM needs.

## How to use
1. Clone this repo.
2. Update `terraform.tfvars` with your values.
3. Run:

   ```bash
   terraform init
   terraform plan
   terraform apply
4. Check the AWS Console (or CLI) to verify IAM resources.
````


## File structure

```text
.
├── main.tf                  # IAM resources
├── variables.tf             # Input variables
├── outputs.tf               # Useful outputs
├── iam-policy.json          # Example custom policy
├── terraform.tfvars         # Your values (not committed)
```

## Notes

* Backend is currently local state. For production, switch to S3 + DynamoDB lock.
* Policy JSON must be valid — AWS is strict with commas and structure.
* IAM best practice: avoid long-term users, prefer roles + temporary credentials.

## Next steps

* Add S3 backend for state.
* Add CI/CD to validate and apply changes.
* Extend to enforce tagging or cost controls.

```

```
