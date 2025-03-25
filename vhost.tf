resource "rabbitmq_vhost" "this" {
  count = var.create_vhost ? 1 : 0
  name = var.vhost
}