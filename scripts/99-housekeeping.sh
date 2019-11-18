#!/bin/bash -eux

# Uninstall Ansible and remove PPA.
apt-get -y remove --purge ansible
apt-add-repository --remove ppa:ansible/ansible

# Remove passwordless sudo for sudo group
rm /etc/sudoers.d/sudoers

# Apt cleanup.
apt autoremove
apt update

# Delete unneeded files.
rm -f /home/vagrant/*.sh

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync