 terraform {
    backend "s3" {
            endpoint                    = "https://storage.yandexcloud.net/"
            bucket                      = "otus-learning-terraform"
            region                      = "ru-central1"
            access_key                  = "YCAJEGxQA5fuUUsMseHYmAH38"
            secret_key                  = "YCNNlBICL6DvwJowUpVqYe0U9vZ-qOQOIP1KfbQ8"
            skip_region_validation      = "true"
            skip_credentials_validation = "true"
            skip_requesting_account_id  = "true"
            skip_s3_checksum            = "true"
        }
    }
