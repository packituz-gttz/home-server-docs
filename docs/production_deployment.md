# Production Deployment

Shows how to connect setup with Cloudflare, scripts and other services for production usage and how
to deploy services into production server.



## Tech Stack

Repo: [https://github.com/packituz-gttz/home-server](https://github.com/packituz-gttz/home-server).

Check **makefile** for most common commands. Run at the root of the project to display available commands:
```shell
make
```

* Ansible: Configure and installs software and services into production environment.
* Borg: Backup solutions.
* BorgBase: Backups are uploaded here.
* Cloudflare: Allows connection to production server outside local network.
* Terraform: Manages Cloudflare infrastructure.
* Terraform Cloud: Works in conjunction with Terraform to manage infrastructure.

## Project Structure

For a more in depth on all the files and directories present please visit [Development Setup](development_setup.md).

In this section only the Terraform directories and Ansible playbooks will be used, the former will configure Cloudflare
connection with production server allowing internet connection outside local network, and the latter will deploy and
configure the services on production server.



## Usage