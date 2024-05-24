service_account_key_file        = "key.json" # provide here your key.json path to yc
cloud_id                        = "" # provide here your cloud_id
folder_id                       = "" # provide here your folder_id
yc_zone                         = "" # provide here your zone
local_admin_private_key_path    = "~/.ssh/id_rsa" # provide here your private key
local_admin_public_key_path     = "~/.ssh/id_rsa.pub" # provide here your pub key
local_admin                     = "almalinux"

yc_compute_instances = {

    gfs2-node1 = {

        name        = "gfs2-node1"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.129.0.30"
        }
    
    gfs2-node2 = {

        name        = "gfs2-node2"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.129.0.31"
        }
    
    gfs2-node3 = {

        name        = "gfs2-node3"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.129.0.32"
        }
    }


yc_compute_instances_master = {

    gfs2-master = {

        name        = "gfs2-master"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        }
}