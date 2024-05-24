# lession-4-pacemaker-gfs2


## This code create an 4 VM in YC and provision pacemaker, iscsi target and 3 iscsi initiators with gfs2.

## Note, that this code works only with almalinux9.
## Fencing is disabled, cause fence-agents for YC does not exists.

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

You can see examples of success run in `examples/` dir.

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