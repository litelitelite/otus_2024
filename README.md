# lession-5-nginx


## This code create an 4 VM in YC and provision iscsi initiator and 3 iscsi targets.

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

```
collections:
  - name: community.general
  - name: ansible.posix
  ```