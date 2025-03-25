resource "rabbitmq_permissions" "this" {
  user  = rabbitmq_user.this.name
  vhost = var.create_vhost ? rabbitmq_vhost.this.name : var.vhost

  permissions {
    configure = ".*"
    write     = ".*"
    read      = ".*"
  }
}