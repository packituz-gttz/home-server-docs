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
├── Pipfile
├── Pipfile.lock
├── playbooks
│   ├── configure_server.yml
│   ├── inventory.ini
│   ├── requirements.yml
│   ├── roles
│   │   └── server_setup
│   │       ├── defaults
│   │       │   └── main.yml
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


## Usage