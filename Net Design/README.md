

# data

**name:** _user_
**psw:** _resu_

# qemu2 setup (ova to qcow2)

```
tar -xvf <image-name>.ova
qemu-img convert <image-name>-disk001.vmdk <image-name>.qcow2 -O qcow2
file <image-name>.qcow2

```

**std path:** _/var/lib/libvirt/images_

# vm auto-scaling (missing package fix)

```
sudo apt-get update && sudo apt-get install spice-vdagent

```


