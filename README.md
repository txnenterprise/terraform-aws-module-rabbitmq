# Terraform Module: RabbitMQ User and Permissions

This Terraform module provisions a RabbitMQ user with a randomly generated password and assigns permissions to a specified virtual host (vhost). Optionally, it can also create a new vhost if desired. The module is designed to be reusable and configurable through variables.

## Provisioned Resources
- **RabbitMQ User**: A user with a secure, randomly generated password.
- **RabbitMQ Permissions**: Permissions (`configure`, `write`, `read`) assigned to the user for a specified vhost.
- **RabbitMQ Vhost**: Optional creation of a vhost if `create_vhost` is set to `true`.
- **Random Password**: A 14-character password with special characters for the RabbitMQ user.

## Prerequisites
- Terraform `>= 1.3.6`.
- Providers:
  - `cyrilgdn/rabbitmq` `>= 1.8.0`
  - `hashicorp/random` `>= 3.7.1`
- A running RabbitMQ server with Terraform provider access configured.

## Usage
1. **Clone the repository** or copy the code into a directory.
2. **Configure variables**: Create a `terraform.tfvars` file or pass variables via CLI.
3. **Initialize Terraform**:
   ```bash
   terraform init
   ```
4. **Plan the execution**:
   ```bash
   terraform plan
   ```
5. **Apply the changes**:
   ```bash
   terraform apply
   ```

### Example Configuration
Create a `main.tf` file in the root directory to call the module:

```hcl
provider "rabbitmq" {
  endpoint = "http://rabbitmq.example.com:15672"
  username = "admin"
  password = "admin_password"
}

module "rabbitmq_user" {
  source      = "./"
  username    = "myapp_user"
  create_vhost = true
  vhost       = "myapp_vhost"
}
```

### Input Variables
| Name           | Type   | Description                                   | Default |
|----------------|--------|-----------------------------------------------|---------|
| `username`     | string | The RabbitMQ username to create              | -       |
| `create_vhost` | bool   | Whether to create a new vhost                | `true`  |
| `vhost`        | string | The vhost to assign permissions to           | `"/"`   |

### Outputs
- `password`: The generated password for the RabbitMQ user (marked as sensitive).

## Notes
- **Permissions**: The module assigns full permissions (`.*`) for `configure`, `write`, and `read`. Adjust the `rabbitmq_permissions` resource if more restrictive permissions are needed.
- **Password Security**: The password is randomly generated with a length of 14 characters and includes special characters. Modify `random_password.mq` to adjust length or character set.
- **Vhost**: If `create_vhost` is `false`, the module uses the existing vhost specified in the `vhost` variable. Ensure it exists on the RabbitMQ server.
- **Dependencies**: The `rabbitmq_user` resource depends on the password being generated first.

## Development
This module was developed by [A9 Tecnologia](https://www.a9tech.com.br), a company specializing in innovative technology solutions.

## License
This project is licensed under the MIT License. See the [LICENSE](#license) section below for details.

---