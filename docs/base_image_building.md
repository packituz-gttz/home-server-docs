# Base Image Building

Build VirtualBox image that serves as a testing and development platform for
the several scripts that configure and install the software provided in this repo.
This images mimics the production environment as much as possible. The resulting
image will contain a GUI(GNOME) and updated packages.

Only build this image if you want to test or develop, to use the provided playbooks
and script go to [Production Deployment](production_deployment.md).

## Tech Stack

Repo: [https://github.com/packituz-gttz/home-server-os](https://github.com/packituz-gttz/home-server-os).

Check **makefile** for most common commands. Run at the root of the project to display available commands:
```shell
make
```

* Ansible: Installs necessary software on image.
* Packer: Builds the image and uploads it to Vagrant Cloud.
* Vagrant: Run image using cli.
* VirtualBox: Required to run the image.

## Project Structure
```text
.
├── devbox.json
├── devbox.lock
├── gui_server.yml
├── makefile
├── output-almalinux9
│   ├── package.box
│   └── Vagrantfile
├── Pipfile
├── Pipfile.lock
├── README.md
├── vagrant-alma.auto.pkr.hcl
├── vagrant-alma.auto.pkrvars.hcl
├── vagrant-alma.auto.pkrvars.hcl.example
└── vagrant-alma.pkr.hcl
```

* devbox: You can use [devbox](https://www.jetify.com/devbox) to install O.S. dependencies, It is completely optional.
* gui_server.yml: Ansible playbook to install and configure packages in VirtualBox image. Run through packer.
* output-almalinux9: Resulting image will be saved here.
* Pipfile: Python dependencies for project.
* vagrant-alma.auto.pkr.hcl: Variables definitions for building image using packer.
* vagrant-alma.auto.pkrvars.hcl: Actual variables values, not commited, create this file and set you values, use vagrant-alma.auto.pkrvars.hcl.example as an example.
* vagrant-alma.auto.pkrvars.hcl.example: Sample on how to set variables values.
* vagrant-alma.pkr.hcl: Packer script which will build image.


## Usage
**Notice: All steps must be run inside a python virtual environment.**

Install python dependencies which will install Ansible for configuring the image through a playbook.

### Building and Publishing

**Notice: Vagrant Cloud has been deprecated in favor of Vagrant Registry, currently upload will fail**


This process takes quite a lot of time depending on machine specs and internet speed.
To start the build & publishing process execute:
```shell
make build
```

### Validation

To validate and format the packer file, run:
```shell
make check
```
Any errors will be printed.