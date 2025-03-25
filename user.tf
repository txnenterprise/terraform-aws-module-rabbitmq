resource "random_password" "mq" {
  length           = 14
  special          = true
  override_special = "&8h8a9QogDb3y"
}

resource "rabbitmq_user" "this" {
  name     = var.username
  password = random_password.mq.result
  depends_on = [
    random_password.mq
  ]
}