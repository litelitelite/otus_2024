# lession-15-kafka


## This code create VMs in YC and provision Nginx, PGSQL patroni cluster and simple python flask app with haproxy balancer. Also here's OpenSearch monitoring, which collect logs from all nodes through vector, using kafka and logstash. For installing OpenSearch uses https://github.com/opensearch-project/ansible-playbook.

### Usage

- Create catalog in YC with S3 bucket and SA with `storage.uploader` role.
- Provide `cloud_id`, `folder_id`, `service_account_key_file`.
- Provide `bucket`, `access_key` and `secret_key` in backend.tf
- Provide needed variables in terraform.tfvars file

Then run this commands from `terraform` directory:

- `terraform init -backend-config=state.name -reconfigure`
- `terraform apply -var-file=terraform.tfvars -auto-approve`
- `ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i ../ansible/inventory --private-key ~/.ssh/id_rsa ../ansible/site.yml`

Ansible inventory generate dynamicly

## Check for APP and static content

After deploy you can check app, or static content from Nginx load balancer public_ip by getting `nginx_instance_external_ip` from
tf output and then put in on your browser. 

`http://nginx_instance_external_ip/app` - path to simple flask page counter with RedisDB
`http://nginx_instance_external_ip/html` - path to simple static page from app-nodes

Also you can check it by access external YC load_balancer_ip

Examples:

`http://158.160.156.201/html` or `http://158.160.156.201/app/`

## Check HAPROXY

See backend_external_ip

Example:

http://158.160.65.231:7000/

## Check PATRONI status


See any endpoint in 8008 port in external_ip_pgdb

Example:

http://158.160.76.21:8008/

```
{"state": "running", "postmaster_start_time": "2024-07-01 16:33:05.820991+00:00", "role": "replica", "server_version": 140012, "xlog": {"received_location": 67491496, "replayed_location": 67491496, "replayed_timestamp": "2024-07-01 16:39:07.265311+00:00", "paused": false}, "timeline": 2, "dcs_last_seen": 1719852036, "database_system_identifier": "7386673811145480129", "patroni": {"version": "2.1.3", "scope": "TestCluster"}}
```

http://158.160.66.42:8008/

```
{"state": "running", "postmaster_start_time": "2024-07-01 14:27:23.986593+00:00", "role": "master", "server_version": 140012, "xlog": {"location": 67491496}, "timeline": 2, "replication": [{"usename": "admin", "application_name": "etcd2", "client_addr": "10.0.1.8", "state": "streaming", "sync_state": "async", "sync_priority": 0}, {"usename": "admin", "application_name": "etcd1", "client_addr": "10.0.1.7", "state": "streaming", "sync_state": "async", "sync_priority": 0}], "dcs_last_seen": 1719852076, "database_system_identifier": "7386673811145480129", "patroni": {"version": "2.1.3", "scope": "TestCluster"}}
```

### Test failover methods

- You can stop patroni on any pgdb node
- You can stop any app node
- You can stop any nginx balancer
- You can stop any haproxy balancer

### Test OpenSearch cluster

curl https://localhost:9200 -u 'admin:qwerty123' --insecure

### Examples OpenSearch

See catalog examples

### Examples Kafka

```
Command ###
./kafka-topics.sh --list --bootstrap-server 10.0.1.7:9092

Result ###
app_logs_topic
db_logs_topic
nginx_logs_topic
```
### Destroy env

Run command `terraform destroy -var-file=terraform.tfvars -auto-approve`

### Requirements

`ansible-core`
`terraform`
`yc`