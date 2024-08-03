# lession-18-proxmox

## This code create ProxMox instance from vagrant and provisioning Ansible, and then deploy 2 VMs with Terraform (using telmate plugin for terraform).

## Prerequirements

- After deploy ProxMox on node (you can do this through Ansbile provision by the way):

```
cd /var/lib/vz/template/iso

wget http://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img

sudo apt install libguestfs-tools -y && sudo virt-customize -a ubuntu-20.04-server-cloudimg-amd64.img --install qemu-guest-agent
```

- Create VM:

```
qm create 9001 \
  --name ubuntu-2004-cloud-init --numa 0 --ostype l26 \
  --cpu cputype=host --cores 2 --sockets 1 \
  --memory 1024  \
  --net0 virtio,bridge=vmbr10

qm importdisk 9001 ubuntu-20.04-server-cloudimg-amd64.img local
qm set 9001 --scsihw virtio-scsi-pci --scsi0 local:9001/vm-9001-disk-0.raw
qm set 9001 --ide2 local:cloudinit
qm set 9001 --boot c --bootdisk scsi0
qm set 9001 --serial0 socket --vga serial0
qm set 9001 --agent enabled=1
qm template 9001
```
- Through WebIU:

 1. Generate API_TOKEN 
 2. Add permissions for storage through API

After that you can deploy VMs through terraform.

### Usage

- Provide needed variables into terraform/variables.tf

Run this commands from `vagrant` directory:

- `vagrant up`

Run command from `terraform` directory:

- `terraform init -backend-config=state.name -reconfigure`
- `terraform apply -var-file=terraform.tfvars -auto-approve`

### Destroy env

Run command `terraform destroy -var-file=terraform.tfvars -auto-approve` from `terraform` directory
Then run command `vagrant destroy` from `vagrant` directory.

### Requirements

`ansible-core`
`terraform`
`vagrant`
`telmate plugin for terraform`