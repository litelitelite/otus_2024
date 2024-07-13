service_account_key_file        = "key.json" # provide here your key.json path to yc
cloud_id                        = "" # provide here your cloud_id
folder_id                       = "" # provide here your folder_id
yc_zone                         = "ru-central1-b" # provide here your zone
local_admin_private_key_path    = "~/.ssh/id_rsa" # provide here your private key
local_admin_public_key_path     = "~/.ssh/id_rsa.pub" # provide here your pub key
local_admin                     = "ubuntu"

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

    db-node1 = {

        name        = "pgdb1"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.7"
    }

    db-node2 = {

        name        = "pgdb2"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.8"
    }

    db-node3 = {

        name        = "pgdb3"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.9"
    }


}


yc_compute_instances_elk = {

    elk-node1 = {

        name        = "elk-node1"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.10"
        }
    
    elk-node2 = {

        name        = "elk-node2"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.11"
    }

    elk-node3 = {

        name        = "elk-node3"
        platform_id = "standard-v3"
        cores       = 2
        memory      = 2
        size        = 10
        type        = "network-hdd"
        nat         = true
        ip_address  = "10.0.1.12"
    }
}