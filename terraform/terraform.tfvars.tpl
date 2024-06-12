service_account_key_file        = "key.json" # provide here your key.json path to yc
cloud_id                        = "" # provide here your cloud_id
folder_id                       = "" # provide here your folder_id
yc_zone                         = "" # provide here your zone
local_admin_private_key_path    = "~/.ssh/id_rsa" # provide here your private key
local_admin_public_key_path     = "~/.ssh/id_rsa.pub" # provide here your pub key
local_admin                     = "almalinux"

yc_compute_instances_nginx = {

    nginx-node1 = {

        name        = "nginx-node1"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.3"
        }
    
    nginx-node2 = {

        name        = "nginx-node2"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.4"
    }
}

yc_compute_instances_backend = {

    backend-node1 = {

        name        = "backend-node1"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.5"
    }
    
    backend-node2 = {

        name        = "backend-node2"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.6"
    }
}

yc_compute_instances_db = {

    db-node = {

        name        = "db-node"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.7"
    }


}

yc_compute_instances_iscsi = {

    iscsi-node = {

        name        = "iscsi-node"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.8"
    }


}