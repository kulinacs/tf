provider "libvirt" {
  uri = "qemu+ssh://root@master.hm.kulinacs.com/system"
}

module "centos8" {
  source = "../modules/centos"

  base_volume_id = "/mnt/volumes/centos8.qcow2"
  name           = "triage"
  tag            = "lab"
  username       = "kulinacs"
  network_name   = "lab"
  pool           = "primary"
  ssh_key        = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOP78FDtl87/nxkEtcq9vepcyV2w2bcrn59G7BGnr73E kulinacs@bernstein"
  address        = "10.0.0.8/24"
  gateway        = "10.0.0.1"
  vcpus          = 1
  memory         = "8196"
  ovs_networks   = ["lab"]
  block_devices  = ["/dev/sde"]
}
