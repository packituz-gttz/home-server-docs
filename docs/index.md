# Home

**Notice: This guide assumes you are familiar with python.**

Heavy use of [make](https://www.gnu.org/software/make/) is done on all the projects, it's optional but using it will
ease setup.

The purpose of this project is to provide automated setup for several self-hosted software like jellyfin, kavita,
navidrome, etc. All the code is tested on AlmaLinux.This documentation helps you set up project
either for development or for production use; it covers the following points:

**Base image building**

> Creating the base image using packer to test your changes or locally view
> how the system works. Uses AlmaLinux as base O.S.

**Development Setup**

> Configures project home-server locally, so you can test your setup or develop new features.
> Uses Vagrant and Ansible. Most things can be tested in this environment, if not it'll be indicated.

**Production Deployment**

> Deployment of project into a self-hosted environment, through the usage of Ansible playbooks, also
> employs Cloudflare technologies to enabled access outside local network and makes use of Terraform to
> configure some infrastructure.

**Documentation Setup**

> Configuration on deploying documentation to Cloudflare Pages and the tools used for building
> docs.

**Extras**

> Shows how to configure some extra tools not required for the project, but nonetheless useful.
