# lession-1-terrafrom


## This code create an VM in YC and provision Nginx package to it.

### Usage

- Create catalog in YC with S3 bucket and SA with `storage.uploader` role.
- Provide `cloud_id`, `folder_id`, `service_account_key_file`.
- Provide `bucket`, `access_key` and `secret_key` in backend.tf
- Provide needed variables in terraform.tfvars file

Then run commands:

- `terraform init -backend-config=state.name -reconfigure`
- `terraform apply -var-file=terraform.tfvars -auto-approve`

Ansible inventory generate dynamicly

### Destroy env

Run command `terraform destroy -var-file=terraform.tfvars -auto-approve`

### Requirements

`ansible-core`
`terraform`
`yc`