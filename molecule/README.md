# Ubuntu 16.04/18.04 LTS (Xenial/Bionic) Ansible Test Image

Ubuntu 16.04 LTS (Xenial) Docker container for Ansible playbook and role testing.
Ubuntu 18.04 LTS (Bionic) Docker container for Ansible playbook and role testing.

## Tags

  - `16.04`: Latest 16.04 image.
  - `18.04`: Latest 18.04 image.

## How to Build

If you need to build the image on your own locally, do the following:

  1. [Install Docker](https://docs.docker.com/install/).
  2. `cd` into this directory.
  3. Run `docker build -f Dockerfile-16.04 -t molecule:16.04 .`
  4. Run `docker build -f Dockerfile-18.04 -t molecule:18.04 .`

## How to Use

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. Pull this image from Docker Hub: `docker pull ivandeex/molecule:16.04` or `docker pull ivandeex/molecule:18.04`.
  3. Run a container from the image: `docker run --detach --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro ivandeex/molecule:18.04`
  4. To test my Ansible roles, I add in a volume mounted from the current working directory with `--volume=$(pwd):/etc/ansible/roles/role_under_test:ro`.

## Notes

I use Docker to test my Ansible roles and playbooks on multiple OSes using CI tools like Jenkins and Travis. This container allows me to test roles and playbooks using Ansible running locally inside the container.

> **Important Note**: I use this image for testing in an isolated environment—not for production—and the settings and configuration used may not be suitable for a secure and performant production environment. Use on production servers/in the wild at your own risk!

## Author

Created in 2018 by [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
