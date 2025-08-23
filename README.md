# Navix9 cloud image to qcow2

Navix9 Cloud image to qcow2 format

# history

- 08/22/25 Repo was creted

# Debugging Status

I used my baremetal 2013 MacPro Ubuntu 24.04.3 with the latest QEMU/KVM to run Packer template


# how to run

I ran on my baremetal 2013 MacPro Ubuntu 24.04.3 with the latest QEMU/KVM

```
09:32:54 sajang@macpro navix9-to-qcow2 ±|main ✗|→ time ./build.sh 
qemu.navix96: output will be in this color.

==> qemu.navix96: Retrieving ISO
==> qemu.navix96: Trying https://dlnavix.navercorp.com/cloud-images/Navix-GenericCloud-9.6-20250708.0.x86_64.qcow2
==> qemu.navix96: Trying https://dlnavix.navercorp.com/cloud-images/Navix-GenericCloud-9.6-20250708.0.x86_64.qcow2?checksum=sha256%3A26a8fbfe6ac12b79c9082029d873255ca0dddec375003c1e691ccdb57fbd9982
==> qemu.navix96: https://dlnavix.navercorp.com/cloud-images/Navix-GenericCloud-9.6-20250708.0.x86_64.qcow2?checksum=sha256%3A26a8fbfe6ac12b79c9082029d873255ca0dddec375003c1e691ccdb57fbd9982 => /home/sajang/.cache/packer/d33ea5a67503dd48b3107358eb4f75a21be71c91.iso
==> qemu.navix96: Copying hard drive...
==> qemu.navix96: Resizing hard drive...
==> qemu.navix96: Starting HTTP server on port 8187
==> qemu.navix96: Found port for communicator (SSH, WinRM, etc): 2874.
==> qemu.navix96: Using existing SSH private key
==> qemu.navix96: Looking for available port between 5900 and 6000 on 127.0.0.1
==> qemu.navix96: Starting VM, booting disk image
==> qemu.navix96: The VM will be run headless, without a GUI. If you want to
==> qemu.navix96: view the screen of the VM, connect via VNC without a password to
==> qemu.navix96: vnc://127.0.0.1:5920
==> qemu.navix96: Overriding default Qemu arguments with qemuargs template option...
==> qemu.navix96: Waiting 15s for boot...
==> qemu.navix96: Connecting to VM via VNC (127.0.0.1:5920)
==> qemu.navix96: Typing the boot commands over VNC...
==> qemu.navix96: Not using a NetBridge -- skipping StepWaitGuestAddress
==> qemu.navix96: Using SSH communicator to connect: 127.0.0.1
==> qemu.navix96: Waiting for SSH to become available...
==> qemu.navix96: Connected to SSH!
==> qemu.navix96: Provisioning with shell script: shell/shell-provisioner.sh
==> qemu.navix96: Install something here: TBD
==> qemu.navix96: Navix release 9.6 (Jeongja)
==> qemu.navix96: NAME="Navix"
==> qemu.navix96: VERSION="9.6 (Jeongja)"
==> qemu.navix96: ID="navix"
==> qemu.navix96: ID_LIKE="rhel centos fedora"
==> qemu.navix96: VERSION_ID="9.6"
==> qemu.navix96: PLATFORM_ID="platform:el9"
==> qemu.navix96: PRETTY_NAME="Navix 9.6 (Jeongja)"
==> qemu.navix96: ANSI_COLOR="0;36"
==> qemu.navix96: CPE_NAME="cpe:/o:navix:navix:9::baseos"
==> qemu.navix96: HOME_URL="https://navix.navercorp.com/"
==> qemu.navix96: VENDOR_NAME="Naver Cloud Corp."
==> qemu.navix96: VENDOR_URL="https://www.navercloudcorp.com/"
==> qemu.navix96: BUG_REPORT_URL="https://github.com/NaverCloudPlatform/Navix"
==> qemu.navix96: NAVIX_SUPPORT_PRODUCT="Navix-9"
==> qemu.navix96: NAVIX_SUPPORT_PRODUCT_VERSION="9.6"
==> qemu.navix96: REDHAT_SUPPORT_PRODUCT="Navix"
==> qemu.navix96: REDHAT_SUPPORT_PRODUCT_VERSION="9.6"
==> qemu.navix96: Navix release 9.6 (Jeongja)
==> qemu.navix96: Navix release 9.6 (Jeongja)
==> qemu.navix96: Provisioning with Ansible...
==> qemu.navix96: Setting up proxy adapter for Ansible....
==> qemu.navix96: Executing Ansible: ansible-playbook -e packer_build_name="navix96" -e packer_builder_type=qemu -e packer_http_addr=10.0.2.2:8187 --ssh-extra-args '-o IdentitiesOnly=yes' --scp-extra-args '-O' -e ansible_ssh_private_key_file=/tmp/ansible-key3010087585 -i /tmp/packer-provisioner-ansible1297348451 /home/sajang/tests/daddy-knows-best/navix9-to-qcow2/packer/ansible/playbook.yaml
==> qemu.navix96:
==> qemu.navix96: PLAY [play Hello World] ********************************************************
==> qemu.navix96:
==> qemu.navix96: TASK [task Hello World] ********************************************************
==> qemu.navix96: [WARNING]: Platform linux on host default is using the discovered Python
==> qemu.navix96: interpreter at /usr/bin/python3.9, but future installation of another Python
==> qemu.navix96: interpreter could change the meaning of that path. See
==> qemu.navix96: https://docs.ansible.com/ansible-
==> qemu.navix96: core/2.16/reference_appendices/interpreter_discovery.html for more information.
==> qemu.navix96: changed: [default]
==> qemu.navix96:
==> qemu.navix96: TASK [debug] *******************************************************************
==> qemu.navix96: ok: [default] => {
==> qemu.navix96:     "msg": "Hello World!\\n"
==> qemu.navix96: }
==> qemu.navix96:
==> qemu.navix96: PLAY RECAP *********************************************************************
==> qemu.navix96: default                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
==> qemu.navix96:
==> qemu.navix96: Gracefully halting virtual machine...
==> qemu.navix96: Converting hard drive...
Build 'qemu.navix96' finished after 1 minute 13 seconds.

==> Wait completed after 1 minute 13 seconds

==> Builds finished. The artifacts of successful builds are:
--> qemu.navix96: VM files in directory: output/navix96

real	1m17.428s
user	1m18.776s
sys	0m18.762s
09:34:15 sajang@macpro navix9-to-qcow2 ±|main ✗|→ 
```
