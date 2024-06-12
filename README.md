# lession-4-pacemaker-gfs2


## This code create an 6 VM in YC (2 nginx, 2 backend, 1 db and 1 iscsi) and provision pacemaker, iscsi target and iscsi initiators with gfs2.
## There is backend app with flask behind nginx frontend.

## Note, that this code works only with almalinux9.

### Usage

- Create catalog in YC with S3 bucket and SA with `storage.uploader` role.
- Provide `cloud_id`, `folder_id`, `service_account_key_file`.
- Provide `bucket`, `access_key` and `secret_key` in backend.tf.
- Create valid `terraform.tfvars` from `terraform.tfvars.tpl`, providing neested variables.

Then run commands:

- `cd terraform/`
- `terraform init -backend-config=state.name -reconfigure`
- `terraform apply -var-file=terraform.tfvars -auto-approve && sleep 20 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u almalinux -i ../ansible/inventory --private-key ~/.ssh/id_rsa ../ansible/site.yml`

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
### Check APP and static content

After deploy you can check app, or static content from yandex cloud load balancer public_ip.

- http://yc_lb_external_ip/app - path to simple flask page counter with PostgreSQL.
- http://yc_lb_external_ip/html - path to simple static page from app-nodes.

### Bugs

Pacemaker can be installed with issue on sharedfs with no reason (only through ansible).
In that case, you need manually connect to backend nodes and provide command of `6-gfs2.yml` playbook in console. Command `vgchange -a y` can be helpful.