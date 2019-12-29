# One click script for v2ray

Only test for KVM/XEN/Hyper-V/Vmware/ESXi!!!!!

If you use ubuntu, use this command:
```
apt install -y wget
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/gertraychntitm/goo/master/ubuntu_one_click.sh')
```
In finish, you can see v2ray config info and change kernel to zen kernel.

Not recommended for lotserver, it too old and more bugs.


If you use Arch Linux, use this command:
```
pacman -S --needed --noconfirm wget
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/gertraychntitm/goo/master/archlinux_one_click.sh')
```
In finish, you can see v2ray config info. not reboot and kernel change.


# Firewall rule only for ufw!

Only test for ubuntu/archlinux!

Well be update every week, if I can.
```
bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/gertraychntitm/goo/master/ufw_black_list.sh')
```
