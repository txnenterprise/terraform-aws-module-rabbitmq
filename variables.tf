variable "username" {
  type = string
}

variable "create_vhost" {
  type = bool
  default = true
}

variable "vhost" {
  type = string
  default = "/"
}