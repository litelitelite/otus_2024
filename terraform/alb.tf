resource "yandex_lb_target_group" "otus-tgt" {
  name           = "otus-tgt"
  target {
    subnet_id = "${yandex_vpc_subnet.otus-learning-ru-central1-b.id}"
    address   = "10.0.1.3"
  }
  target {
    subnet_id = "${yandex_vpc_subnet.otus-learning-ru-central1-b.id}"
    address   = "10.0.1.4"
  }
}

resource "yandex_lb_network_load_balancer" "otus-alb" {
  name = "otus-alb"
  listener {
    name = "otus-listener"
    port = 80
    target_port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = "${yandex_lb_target_group.otus-tgt.id}"
     healthcheck {
      name                = "http"
      interval            = 2
      timeout             = 1
      unhealthy_threshold = 2
      healthy_threshold   = 2
      http_options {
        port = 80
        path = "/app"
      }
  }
}
}
