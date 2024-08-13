# Development Setup

Deploys scripts and services into a VirtualBox machine (AlmaLinux), for testing and development.


## Tech Stack

Repo: [https://github.com/packituz-gttz/home-server](https://github.com/packituz-gttz/home-server).

Check **makefile** for most common commands. Run at the root of the project to display available commands:
```shell
make
```

* Ansible: Configure and installs software and services into VirtualBox machine.
* Vagrant: Run VirtualBox machine using custom image via cli.
* VirtualBox: Required to run the image


## Project Structure

```text
.
├── devbox.json
├── devbox.lock
├── makefile
├── playbooks
│   ├── configure_server.yml
│   ├── inventory.ini
│   ├── requirements.yml
│   ├── roles
│   │   └── server_setup
│   │       ├── files
│   │       │   ├── coder
│   │       │   ├── ghost
│   │       │   ├── joplin
│   │       │   ├── jump
│   │       │   │   ├── backgrounds
│   │       │   │   ├── favicon
│   │       │   │   ├── icon.png
│   │       │   │   └── sites.json
│   │       │   ├── kavita
│   │       │   ├── monit
│   │       │   │   ├── monitrc
│   │       │   │   ├── monit_rc_files
│   │       │   │   └── scripts
│   │       │   ├── ntfy
│   │       │   ├── romm
│   │       ├── meta
│   │       │   └── main.yml
│   │       ├── README.md
│   │       ├── tasks
│   │       ├── templates
│   │       │   └── frigate
│   │       ├── tests
│   │       └── vars
│   │           ├── main.yml
│   │           ├── secrets_staging.yml
│   │           └── secrets.yml
│   ├── sync
│   └── Vagrantfile
├── README.md
├── renovate.json
├── requirements
│   └── requirements.txt
├── scripts


```
* devbox: You can use [devbox](https://www.jetify.com/devbox) to install O.S. dependencies, It is completely optional.
* playbooks: Ansible playbooks that will configure services either on testing or production server.
* requirements.txt: Python dependencies for project.
* playbooks/Vagrantfile: Configuration for VirtualBox machine used as a testing environment.
* playbooks/sync: Files in here will be also present on the guest Virtualbox machine.


All the playbooks are locate inside _playbooks/_ directory, and are organized as a role. Inside
_playbooks/roles/server_setup/tasks_ directory you'll find the playbooks, each one configures certain service
indicated on its name, for example kavita-setup.yml will configure the Kavita service; there are two exceptions
to this rule:

* **os-setup.yml**: Will configure O.S. and must be run before any other playbook on a clean environment.
* **main.yml**: Imports and runs all the playbooks if no tag is specified (more on this later).

Some playbooks make use of files, these are located inside _playbooks/roles/server_setup/files_ these are copied to the 
destination host as per instructed on the playbooks. There's also templates _playbooks/roles/server_setup/templates_ which
work similar to files but some manipulation is done to them before being copied.


## Usage
**Notice: All steps must be run inside a python virtual environment.**

Install python dependencies and install Ansible dependencies, to install Ansible dependencies execute:
```shell
ansible-galaxy install -r playbooks/requirements.yml
```

### Pre-requisites

#### Initial Playbook
Run the following command which will run a playbook that installs necessary libraries on the VM:
```shell
make staging PARAMS='--tags os-setup'
```
Be sure to **always** run this playbook every time you boot up a new VM. Once this playbook finishes you can run any of the
other ones.

#### Configure secrets 
Configure the Ansible secrets file, in here you'll configure things like users, passwords, ports, etc. Execute the 
following command to edit it:
```shell
ansible-vault edit playbooks/roles/server_setup/vars/secrets_staging.yml
```
You'll be prompted for the password which is "123456789" with no quotes, bear in mind that these values are for testing
**never** save actual production secrets or passwords on this file; change the values you deem necessary and save.


### Running playbooks

In order to run a playbook enter the following command, in this case jellyfin will get installed on vm:
```shell
make staging PARAMS='--tags jellyfin-setup'
```
You can view a list of available tags in _playbooks/roles/server_setup/tasks/main.yml_ 

