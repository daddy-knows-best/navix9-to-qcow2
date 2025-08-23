
packer {
  required_plugins {
    qemu = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
  required_plugins {
    ansible = {
      version = ">= 1.1.2"
      source = "github.com/hashicorp/ansible"
    }
  }
}

source "qemu" "navix96" {
  headless                  = true
  accelerator               = "kvm" #"hvf" to run this packer template on MacOS, "kvm" if not
  iso_url                   = "https://dlnavix.navercorp.com/cloud-images/Navix-GenericCloud-9.6-20250708.0.x86_64.qcow2"
  iso_checksum              = "file:./NAVIX9SHA256SUMS"
  output_directory          = "output/navix96"
  shutdown_command          = "rm -f /home/packer/.ssh/authorized_keys && sudo rm -f /root/.ssh/authorized_keys && echo 'packer' | sudo -S shutdown -P now"
  disk_size                 = "10G"
  format                    = "qcow2"
  http_directory            = "http"
  ssh_username              = "packer"
  ssh_private_key_file      = "~/.ssh/id_ed25519"
  ssh_port                  = 22
  ssh_clear_authorized_keys = true
  ssh_timeout               = "60m"
  memory                    = 4096
  disk_image                = true
  disk_interface            = "virtio"
  net_device                = "virtio-net"
  boot_wait                 = "15s"
  use_default_display       = true
  vm_name                   = "navix96"
  qemuargs = [
    ["-cpu", "host"],
    ["-display", "none"],
    ["-cdrom", "disk-ssh-pub.img"]
  ]
}


build {
  sources = ["source.qemu.navix96"]

  provisioner "shell" {
    script = "shell/shell-provisioner.sh"
  }

  provisioner "ansible" {
    playbook_file = "ansible/playbook.yaml"
    extra_arguments = [ "--scp-extra-args", "'-O'" ]
  }
}
