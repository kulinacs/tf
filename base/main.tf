provider "libvirt" {
    uri = "qemu+ssh://root@master.hm.kulinacs.com/system"
}

# resource "libvirt_pool" "primary" {
#   name = "primary"
#   type = "dir"
#   path = "/mnt/volumes"
# }

resource "libvirt_network" "lab" {
  name = "lab"
  mode = "bridge"
  bridge = "vbr0"
  autostart = true
}

resource "libvirt_volume" "centos" {
  name   = "centos8.qcow2"
  pool   = "primary"
  source = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2"
  format = "qcow2"
}
