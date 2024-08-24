# lession-22-salt

## This code create VMs with Vagrant, provision salt server, salt minions and configure nginx and iptables.

### Usage

Run this command:

- `vagrant up && ansible-playbook -i inventory --private-key ~vagrant/.ssh/id_rsa site.yaml`

### Destroy env

- `vagrant destroy`

### Requirements

`ansible-core`
`vagrant`
