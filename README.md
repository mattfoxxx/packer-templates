# Invokation
`PACKER_LOG=1` enables logging output. Pipe with `2>&1 | tee packer.log` to a file.

```bash
$ pve_user=root@pam pve_pass=s3cr3t pve_url=https://pve.domain.tld:8006/api2/json packer build -only=proxmox -var-file=vars/pve.json build.json
```

# mac os peculiarities
...might hit me on ubuntu as well.
```bash
$ ulimit -a  # show value of file descriptors
-t: cpu time (seconds)              unlimited
-f: file size (blocks)              unlimited
-d: data seg size (kbytes)          unlimited
-s: stack size (kbytes)             8192
-c: core file size (blocks)         0
-v: address space (kbytes)          unlimited
-l: locked-in-memory size (kbytes)  unlimited
-u: processes                       1418
-n: file descriptors                256

$ ulimit -n 4096  # set new value, temporary for this session
```
This fixes the error "socket: too many open files" or "tcp: lookup: no such host"