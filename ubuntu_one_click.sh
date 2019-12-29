#!/bin/bash
cat > /etc/update-motd.d/10-help-text <<-EOF
#!/bin/sh

printf "\n"
echo "                       :=+*###**=:.                      "
echo "                    -*%@@@@@@@@@@@@*-                    "
echo "                  -#@@@#+-:...:-+#@@@%-                  "
echo "                 *@@@*:           .+@@@#.                "
echo "   :+++=-      .#@@#:               .*@@%.      -==++:   "
echo "    -%%#%#:    #@@*      -+###*-      +@@#    :#%#%%-    "
echo "     :#%%%%+  -@@%     :%@@@%@@@%-     #@@+  +%%%%#.     "
echo "        .:-== #@@-    :@@%-.  :*@@-    :@@%.==-::.       "
echo "    :-:      .@@@.    *@%.      #@%     %@@:      .-.    "
echo ":=*%@%@%*=:  .@@%     %@*       =@@.    #@@:  :=*%@%@%*-."
echo ".=*%%#%%%#+=..@@@.    #@#       +@%     %@@..=*#%%%#%%*=."
echo "   .-+-.      *@@=    -@@=     :%@=    -@@%      :=+-.   "
echo "       ..::-. :@@%.    -%@%+=+*@@+    .%@@= .::..        "
echo "    .*%@%%#-   +@@%.    .=*#%@@@+    .#@@*   =%%%@%+     "
echo "   -%%##%=      +@@%-       +@@=    -%@@*     .+%#%%#:   "
echo "  :++++=.        =@@@#=.   *@@-  .-#@@@+        .+++++.  "
echo "                  .+@@@@#+#@@+=+#@@@@*:                  "
echo "                    .=#@@@@@@@@@@@#=.                    "
echo "                        -=*###*+-.                       "
EOF
apt update
apt upgrade -y
apt -y install software-properties-common
add-apt-repository -y ppa:damentz/liquorix
apt-get -y install linux-image-liquorix-amd64 linux-headers-liquorix-amd64
cp /etc/security/limits.conf ~/limits.conf.bak
cat > /etc/security/limits.conf <<-EOF
* soft nofile 51200
* hard nofile 51200
EOF

cp /etc/profile ~/profile.bak
cat >> /etc/profile <<-EOF
ulimit -SHn 51200
EOF

cp /etc/sysctl.conf ~/sysctl.conf.bak
cat > /etc/sysctl.conf <<-EOF
fs.file-max = 51200
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.core.rmem_default = 65536
net.core.wmem_default = 65536
net.core.netdev_max_backlog = 4096
net.core.somaxconn = 4096
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_keepalive_time = 1200
net.ipv4.ip_local_port_range = 10000 65000
net.ipv4.tcp_max_syn_backlog = 4096
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_fastopen = 3
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.ipv4.tcp_mtu_probing = 1
net.ipv4.tcp_congestion_control = hybla
EOF

sysctl -p

wget --no-check-certificate https://raw.githubusercontent.com/gertraychntitm/goo/master/go.sh -O ~/go.sh
bash ~/go.sh

sed -i '11 a LimitAS=infinity' /etc/systemd/system/v2ray.service
sed -i '11 a LimitCPU=infinity' /etc/systemd/system/v2ray.service
sed -i '11 a LimitFSIZE=infinity' /etc/systemd/system/v2ray.service
sed -i '11 a LimitNOFILE=infinity' /etc/systemd/system/v2ray.service
sed -i '11 a LimitNPROC=infinity' /etc/systemd/system/v2ray.service
systemctl daemon-reload

reboot

