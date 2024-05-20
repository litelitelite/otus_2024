# lession-5-nginx


## This code create an 4 VM in YC and provision Nginx, Redis and simple python flask app to it.

### Usage

- Create catalog in YC with S3 bucket and SA with `storage.uploader` role.
- Provide `cloud_id`, `folder_id`, `service_account_key_file`.
- Provide `bucket`, `access_key` and `secret_key` in backend.tf
- Provide needed variables in terraform.tfvars file

Then run commands:

- `terraform init -backend-config=state.name -reconfigure`
- `terraform apply -var-file=terraform.tfvars -auto-approve`

Ansible inventory generate dynamicly

## Check for APP and static content

After deploy you can check app, or static content from Nginx load balancer public_ip by getting `nginx_instance_external_ip` from
tf output and then put in on your browser. 

`http://nginx_instance_external_ip/app` - path to simple flask page counter with RedisDB
`http://nginx_instance_external_ip/html` - path to simple static page from app-nodes

### Destroy env

Run command `terraform destroy -var-file=terraform.tfvars -auto-approve`

### Requirements

`ansible-core`
`terraform`
`yc`