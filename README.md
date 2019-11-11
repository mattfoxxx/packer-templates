```
$ pve_user=root@pam pve_pass=s3cr3t pve_url=https://pve.domain.tld:8006/api2/json packer build -only=proxmox -var-file=vars/pve.json build.json
```