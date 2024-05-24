# resource "yandex_vpc_network" "otus-learning" {
#     name = data.yandex_vpc_network.otus-learning.name
# }

# resource "yandex_vpc_subnet" "otus-learning-ru-central1-b" {
#   name = data.yandex_vpc_subnet.otus-learning-ru-central1-b.name
#   network_id = var.otus_network_id
#   v4_cidr_blocks = ["10.129.0.0/24"] 
# }